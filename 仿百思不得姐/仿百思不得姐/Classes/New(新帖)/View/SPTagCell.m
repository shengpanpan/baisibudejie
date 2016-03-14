//
//  SPTagCell.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTagCell.h"
#import "UIImageView+SPExtension.h"

@interface SPTagCell()

@property (weak, nonatomic) IBOutlet UIImageView *tagView;
@property (weak, nonatomic) IBOutlet UILabel *themoLabel;
@property (weak, nonatomic) IBOutlet UILabel *sub_coutLabel;

@end

@implementation SPTagCell


- (void)setFrame:(CGRect)frame{

    frame.size.height -=1;
    
    [super setFrame:frame];
}
#pragma 通过模型给视图赋值
- (void)setTagItem:(SPTagItem *)tagItem{

    _tagItem = tagItem;
    
    //给cell设置图片
    [self.tagView setHeaderCircleImage:tagItem.image_list];
    
    self.themoLabel.text = tagItem.theme_name;
    if (tagItem.sub_number > 10000) {
        self.sub_coutLabel.text = [NSString stringWithFormat:@"%.1f万人订阅",tagItem.sub_number/10000.0];
    }else{
    
         self.sub_coutLabel.text = [NSString stringWithFormat:@"%zd人订阅",tagItem.sub_number];
    }
}
@end
