
//
//  SPTopicCell.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/21.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTopicCell.h"
#import <UIImageView+WebCache.h>

///** 用户的名字 */
//@property (nonatomic, copy) NSString *name;
///** 用户的头像 */
//@property (nonatomic, copy) NSString *profile_image;
///** 帖子的文字内容 */
//@property (nonatomic, copy) NSString *text;
///** 帖子审核通过的时间 */
//@property (nonatomic, copy) NSString *created_at;
///** 顶数量 */
//@property (nonatomic, assign) NSInteger ding;
///** 踩数量 */
//@property (nonatomic, assign) NSInteger cai;
///** 转发\分享数量 */
//@property (nonatomic, assign) NSInteger repost;
///** 评论数量 */
//@property (nonatomic, assign) NSInteger comment;
@interface SPTopicCell()
@property (weak, nonatomic) IBOutlet UIImageView *profile_image;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *created_atLabel;
@property (weak, nonatomic) IBOutlet UILabel *text_Label;
@property (weak, nonatomic) IBOutlet UIButton *ding;
@property (weak, nonatomic) IBOutlet UIButton *cai;
@property (weak, nonatomic) IBOutlet UIButton *repost;
@property (weak, nonatomic) IBOutlet UIButton *comment;


@end
@implementation SPTopicCell

- (void)setTopic:(SPTopic *)topic{

    _topic = topic;
    
    [self.profile_image sd_setImageWithURL:[NSURL URLWithString:topic.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.nameLabel.text = topic.name;
    self.created_atLabel.text = topic.text;
    self.text_Label.text = topic.text;
    
}

- (void)setFrame:(CGRect)frame{

    frame.size.height -= SPCommonMargin;
    frame.origin.y += SPCommonMargin;
 
    
    [super setFrame:frame];
}
@end
