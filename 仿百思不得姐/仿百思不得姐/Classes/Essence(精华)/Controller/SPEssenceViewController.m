//
//  SPEssenceViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPEssenceViewController.h"
#import "UIImage+originalImage.h"
#import "UIBarButtonItem+SPItem.h"

@interface SPEssenceViewController ()

@end

@implementation SPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    //创建左边按钮；
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage originalImageWithName:@"nav_item_game_icon"] withHighImage:[UIImage originalImageWithName:@"nav_item_game_click_icon"] withTarget:self withAction:@selector(leftBarButtonClick)];
   
    //创建右边按钮
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage originalImageWithName:@"navigationButtonRandom"] withHighImage:[UIImage originalImageWithName:@"navigationButtonRandomClick"] withTarget:self withAction:@selector(rightBarButtonClick)];
    
    
    //中间视图
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage originalImageWithName:@"MainTitle"]];
}

- (void)leftBarButtonClick{

    SPLogFunc;
}

- (void)rightBarButtonClick{
    
    SPLogFunc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
