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

@property (nonatomic, weak) UIButton *publishButton;

@end

@implementation SPCustomTabBar

#pragma 懒加载publish
- (UIButton *)publishButton{

    if (!_publishButton) {
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage originalImageWithName:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage originalImageWithName:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [publishButton addTarget:self action:@selector(publishClick) forControlEvents:UIControlEventTouchUpInside];
        [publishButton sizeToFit];
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

#pragma 布局子控件
- (void)layoutSubviews{

    [super layoutSubviews];
    
    NSInteger itemCount = self.items.count;
    
    CGFloat btnW = self.bounds.size.width/(itemCount + 1);
    CGFloat btnH = self.bounds.size.height;
    CGFloat btnX = 0;
    int i = 0;
    
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            if (i == 2) {
                i += 1;
            }
            btnX = i*btnW;
            
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            
            i++;
        }
        
        self.publishButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
    }
}

#pragma 点击按钮的时候调用的方法
- (void)publishClick{

    NSLog(@"%s",__func__);
}
@end
