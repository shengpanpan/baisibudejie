//
//  SPNewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPNewController.h"
#import "UIImage+originalImage.h"
#import "UIBarButtonItem+SPItem.h"
#import "SPTagsViewController.h"

@interface SPNewController ()

@end

@implementation SPNewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化NAV
    [self setUpNavBarButtonItem];
   
}

#pragma 创建NAV左边按钮和中间视图
- (void)setUpNavBarButtonItem{
    
    //创建左边按钮；
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage originalImageWithName:@"MainTagSubIcon"] withHighImage:[UIImage originalImageWithName:@"MainTagSubIconClick"] withTarget:self withAction:@selector(tagClick)];
    
    //中间视图
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage originalImageWithName:@"MainTitle"]];
    
}

#pragma 点击调到标签推荐的界面
- (void)tagClick{

    SPLogFunc;
    SPTagsViewController *tagVC = [[SPTagsViewController alloc] init];
    
    [self.navigationController pushViewController:tagVC animated:YES];
    
}


@end
