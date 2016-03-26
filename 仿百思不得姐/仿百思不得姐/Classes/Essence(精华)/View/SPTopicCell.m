
//
//  SPTopicCell.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/21.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTopicCell.h"
#import <UIImageView+WebCache.h>
#import "UIImageView+SPExtension.h"
#import "UIView+SPExtension.h"
#import "SPTopicVideoView.h"
#import "SPTopicVoiceView.h"
#import "SPTopicPicView.h"


@interface SPTopicCell()

@property (weak, nonatomic) IBOutlet UIImageView *profile_image;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *created_atLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *repostButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;
@property (weak, nonatomic) IBOutlet UILabel *top_cmtLabel;
@property (weak, nonatomic) IBOutlet UIView *cmtView;

//中间视图创建，懒加载，因为每个cell都会调用，
@property (nonatomic, strong) SPTopicVideoView *videoView;
@property (nonatomic, strong) SPTopicVoiceView *voiceView;
@property (nonatomic, strong) SPTopicPicView *picView;

@end
@implementation SPTopicCell

//懒加载，添加视图
- (SPTopicVideoView *)videoView{

    if (!_videoView) {
       SPTopicVideoView  *videoView = [SPTopicVideoView sp_viewFromXib];
        [self.contentView addSubview:videoView];
    
        _videoView = videoView;
    }
    
    return _videoView;
}

- (SPTopicVoiceView *)voiceView{
    
    if (!_voiceView) {
        SPTopicVoiceView  *voiceView = [SPTopicVoiceView sp_viewFromXib];
        [self.contentView addSubview:voiceView];
        
        _voiceView = voiceView;
    }
    
    return _voiceView;
}

- (SPTopicPicView *)picView{
    
    if (!_picView) {
        SPTopicPicView  *picView = [SPTopicPicView sp_viewFromXib];
        [self.contentView addSubview:picView];
        
        _picView = picView;
    }
    
    return _picView;
}


- (void)awakeFromNib{

    self.backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    self.autoresizingMask = NO;
}

- (void)setTopic:(SPTopic *)topic{

    _topic = topic;
    
    [self.profile_image setHeaderCircleImage:topic.profile_image];
    self.nameLabel.text = topic.name;
    self.created_atLabel.text = topic.created_at;
    self.text_Label.text = topic.text;
    
    //如果有最热评论
    if (topic.top_cmt.count) {
        self.cmtView.hidden = NO;
        
        NSDictionary *cmdDic = topic.top_cmt.firstObject;
        NSString *content = cmdDic[@"content"];
        if (content.length == 0) {
            content = @"语音评论";
        }
    
        NSString *userName = cmdDic[@"user"][@"username"];
        self.top_cmtLabel.text = [NSString stringWithFormat:@"%@ : %@",userName,content];
    } else {
        //隐藏最热评论
        self.cmtView.hidden = YES;
    }
    
    //工具条功能设计
    //顶
    [self setToolButton:self.dingButton number:topic.ding placeHolder:@"顶"];
    //踩
    [self setToolButton:self.caiButton number:topic.cai placeHolder:@"踩"];
    //分享
    [self setToolButton:self.repostButton number:topic.repost placeHolder:@"分享"];
    //评论
    [self setToolButton:self.commentButton number:topic.comment placeHolder:@"评论"];
    
    //中间内容
    //视频
    if (self.topic.type == SPTopicTypeVideo) {
        self.voiceView.hidden = YES;
        self.videoView.hidden = NO;
        self.picView.hidden = YES;
        
        self.videoView.topic = topic;
    }
    //声音
    if (self.topic.type == SPTopicTypeVoice) {
      
        self.videoView.hidden = YES;
        self.voiceView.hidden = NO;
        self.picView.hidden = YES;
        
        self.voiceView.topic = topic;
    }
    //图片
    if (self.topic.type == SPTopicTypePicture) {
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
        self.picView.hidden = NO;
        
        self.picView.topic = topic;
   
    }
    //段子
    if (self.topic.type == SPTopicTypeJoke) {
        self.videoView.hidden = YES;
        self.voiceView.hidden = YES;
        self.picView.hidden = YES;
        
    }
    
}

#pragma 设置工具条按钮数目显示的方法
- (void)setToolButton:(UIButton *)button number:(NSInteger)number placeHolder:(NSString *)string{

    if (number >= 10000) {
        [button setTitle:[NSString stringWithFormat:@"%.1f万",number/10000.0] forState:UIControlStateNormal];
    } else if(number >0){
        [button setTitle:[NSString stringWithFormat:@"%ld万",number] forState:UIControlStateNormal];
    }else{
        [button setTitle:string forState:UIControlStateNormal];
    }

}

#pragma 重写cell的frame,拦截所有设置frame该操作，在里面对所有的cell进行操作。其他用法：固定frame，不需要外界更改frame,再加上setBounds,两者可以屏蔽基本的外界更改操作。
- (void)setFrame:(CGRect)frame{

    frame.size.height -= SPCommonMargin;
    frame.origin.y += SPCommonMargin;
    
    [super setFrame:frame];
}


#pragma 布局子控件
- (void)layoutSubviews{

    [super layoutSubviews];
    
    //布局中间视图
    //设置对应的中间视图的frame，从模型对象中获取对应的frame
    if (self.topic.type == SPTopicTypeVideo) {
        self.videoView.frame = self.topic.contentFrame;
    } else if(self.topic.type == SPTopicTypeVoice ) {
        self.voiceView.frame = self.topic.contentFrame;
    }else  if(self.topic.type == SPTopicTypePicture){
        self.picView.frame = self.topic.contentFrame;
    }

}
- (IBAction)more:(id)sender {
    //自从iOS8之后，可以用控制器代替上诉两者
    UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"我的消息" message:@"消息" preferredStyle:UIAlertControllerStyleActionSheet];
    //给控制器添加按钮
    [controller addAction:[UIAlertAction actionWithTitle:@"收藏" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    }]];
    [controller addAction:[UIAlertAction actionWithTitle:@"举报" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
    }]];
    
    [self.window.rootViewController presentModalViewController:controller animated:YES];
}
@end
