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
@property (nonatomic, strong) UIButton *previousClickedTabBarButton;

@end

@implementation SPCustomTabBar

#pragma 懒加载publish
- (UIButton *)publishButton{

    if (!_publishButton) {
        
        UIButton *publishButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishButton setImage:[UIImage originalImageWithName:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishButton setImage:[UIImage originalImageWithName:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
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
    
    for (UIButton *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {

            if (i == 2) {
                i += 1;
            }
            btnX = i*btnW;
            
            tabBarButton.frame = CGRectMake(btnX, 0, btnW, btnH);
            
            i++;
            
            [tabBarButton addTarget:self action:@selector(tabBarClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        self.publishButton.center = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
        
       
    }
}

- (void)tabBarClick:(UIButton *)button{

    SPLogFunc;
    
    //判断是否为第一次点击如果为第一次点击则不发送刷新通知
    if (self.previousClickedTabBarButton) {
        //发送通知
        [[NSNotificationCenter defaultCenter] postNotificationName:SPTabBarButtonDidRpeatClickNotification object:nil userInfo:nil];
        
    }
    
    self.previousClickedTabBarButton = button;
   
}
@end
