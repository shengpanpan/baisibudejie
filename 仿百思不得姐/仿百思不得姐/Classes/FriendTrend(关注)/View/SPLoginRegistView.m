//
//  SPLoginRegistView.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/15.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPLoginRegistView.h"
@interface SPLoginRegistView()


@end
@implementation SPLoginRegistView

+ (instancetype)loginView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}


+ (instancetype)registView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}


- (void)awakeFromNib{
    
//    UIImage *image = self.registButton.currentBackgroundImage;
//    
//    image = [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
//    
//    // 让按钮背景图片不要被拉伸
//    [self.registButton setBackgroundImage:image forState:UIControlStateNormal];
}
@end
