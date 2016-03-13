//
//  SPNavigationController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/12.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPNavigationController.h"
#import "UIBarButtonItem+SPItem.h"
#import "UIImage+originalImage.h"
@implementation SPNavigationController

#pragma 设置导航控制器全局属性
+ (void)load{

    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    //只要是通过模型设置属性的，都是通过富文本
    NSMutableDictionary *titleAttr = [NSMutableDictionary dictionary];
    titleAttr[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    
    [navBar setTitleTextAttributes:titleAttr];
    
    //设置背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

//重写push方法，统一设置返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //控制器跳转之前设置返回按钮
    if (self.childViewControllers.count > 0) {
        //不是根控制器的时候设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage originalImageWithName:@"navigationButtonReturn"] withHighImage:[UIImage originalImageWithName:@"navigationButtonReturnClick"] withTitle:@"返回" withTarget:self withAction:@selector(BarButtonBack)];
    }

    [super pushViewController:viewController animated:animated];
}

- (void)BarButtonBack{

    SPLogFunc;
    
    [self popViewControllerAnimated:YES];
}
@end
