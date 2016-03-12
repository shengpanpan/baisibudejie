//
//  SPTabBarController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTabBarController.h"
#import "SPEssenceViewController.h"
#import "SPNewController.h"
#import "SPFriendTrendViewController.h"
#import "SPMeViewController.h"
#import "SPPublishController.h"
#import "UIImage+originalImage.h"
#import "SPCustomTabBar.h"

@interface SPTabBarController ()

@end

@implementation SPTabBarController

#pragma 修改item.title的字体和大小
+ (void)load{

    UITabBarItem *tabBarIten = [UITabBarItem appearanceWhenContainedIn:self, nil];
    
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSForegroundColorAttributeName] = [UIColor blackColor];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    
    [tabBarIten setTitleTextAttributes:attr forState:UIControlStateNormal];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化子自控制器
    [self setUpAllChildController];
    
    //初始化自定义tabbar
    [self setUpCustomTabBar];
 
  
}


#pragma 初始化子自控制器
- (void)setUpAllChildController{

    //1.0精华
    SPEssenceViewController *essVC = [[SPEssenceViewController alloc] init];
    [self setUpChildControllerWithController:essVC withTitle: @"精华" withImageName:@"tabBar_essence_icon" withSelectedImageName:@"tabBar_essence_click_icon"];
    
    //新帖
    SPNewController *newVC = [[SPNewController alloc] init];
    [self setUpChildControllerWithController:newVC withTitle:  @"新帖" withImageName:@"tabBar_new_icon" withSelectedImageName:@"tabBar_new_click_icon"];
    
    //关注
    SPFriendTrendViewController *friendVC = [[SPFriendTrendViewController alloc] init];
    [self setUpChildControllerWithController:friendVC withTitle:@"关注" withImageName:@"tabBar_friendTrends_icon" withSelectedImageName:@"tabBar_friendTrends_click_icon"];
    
    //我
    SPMeViewController *meVC = [[SPMeViewController alloc] init];
    [self setUpChildControllerWithController:meVC withTitle:@"我" withImageName:@"tabBar_me_icon" withSelectedImageName:@"tabBar_me_click_icon"];
    
    
}


#pragma 添加控制器
- (void)setUpChildControllerWithController:(UIViewController *)controller withTitle:(NSString *)title withImageName:(NSString *)name withSelectedImageName:(NSString *)selectedName{

    //1.1初始为导航控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:controller];
    
    //设置tabBarIten的属性
    nav.tabBarItem.title = title;
    if (name.length) {
        nav.tabBarItem.image = [UIImage originalImageWithName:name];
        nav.tabBarItem.selectedImage = [UIImage originalImageWithName:selectedName];
        
    }
    
    //1.2加入自控制器数组
    [self addChildViewController:nav];
    
    
}


#pragma 初始化自定义tabbar
- (void)setUpCustomTabBar{

    SPCustomTabBar *customTabBar = [[SPCustomTabBar alloc] init];
    
    [self setValue:customTabBar forKey:@"tabBar"];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
