//
//  SPCustomTabBar.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPCustomTabBar.h"
#import "UIImage+originalImage.h"
@interface SPCustomTabBar()
@property (nonatomic, strong) UIButton *publishButton;
@end

@implementation SPCustomTabBar

#pragma 懒加载publish
- (UIButton *)publishButton{

    if (!_publishButton) {
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage originalImageWithName:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage originalImageWithName:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:publishButton];
        
        _publishButton = publishButton;
        
    }
    return _publishButton;
}

#pragma 初始化frame
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        self.backgroundImage = [UIImage originalImageWithName:@"tabbar_light"];
    }
    
    return self;
}

#pragma 点击按钮的时候调用的方法
- (void)publishClick{

    NSLog(@"%s",__func__);
}
@end
