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
@interface SPNavigationController ()<UIGestureRecognizerDelegate>

@end
@implementation SPNavigationController

- (void)viewDidLoad{

    [super viewDidLoad];
    
    //设置全局滑动操作
    [self setAllSlideRight];
   }

#pragma 设置全局右边滑动操作
- (void)setAllSlideRight{
    //设置右边滑动操作
    
    /*
     interactivePopGestureRecognizer<UIScreenEdgePanGestureRecognizer: 0x7f99cac4b790;
     state = Possible; delaysTouchesBegan = YES;
     view = <UILayoutContainerView 0x7f99cac4ebd0>;
     target= <(action=handleNavigationTransition:,
     target=<_UINavigationInteractiveTransition 0x7f99cac4f9c0>)>>
     */
    
    //创建一个新的手势
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
    
    //设置页面左右滑动---手势识别---解决方案，禁止该手势，创建一个新的手势代替。
    self.interactivePopGestureRecognizer.enabled = NO;
    
}

#pragma UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{

    return self.childViewControllers.count > 0;
}

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

#pragma 重写push方法，统一设置返回按钮
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    
    //控制器跳转之前设置返回按钮
    if (self.childViewControllers.count > 0) {
        
        viewController.hidesBottomBarWhenPushed = YES;
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
