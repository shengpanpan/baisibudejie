//
//  SPFriendTrendViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPFriendTrendViewController.h"
#import "UIImage+originalImage.h"
#import "UIBarButtonItem+SPItem.h"
#import "SPloginRegistController.h"

@interface SPFriendTrendViewController ()

@end

@implementation SPFriendTrendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    //创建左边按钮；
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem barButtonItemWithImage:[UIImage originalImageWithName:@"friendsRecommentIcon"] withHighImage:[UIImage originalImageWithName:@"friendsRecommentIcon-click"] withTarget:self withAction:@selector(tagClick)];
    
    
    //中间视图
    self.navigationItem.title = @"我的关注";
}
- (IBAction)loginRegistClick:(id)sender {
    SPloginRegistController *loginRegistVC = [[SPloginRegistController alloc] init];
    
    [self presentViewController:loginRegistVC animated:YES completion:nil];
}

- (void)tagClick{

    SPLogFunc;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
