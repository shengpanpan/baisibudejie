//
//  SPADViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPADViewController.h"

@interface SPADViewController ()
@property (weak, nonatomic) IBOutlet UIView *placeHolderView;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;

@end

@implementation SPADViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //设置启动视图
    [self setLaunchImage];
}

#pragma 启动视图
- (void)setLaunchImage{

    //通过高度，屏幕适配
    // 6p:LaunchImage-800-Portrait-736h@3x.png
    // 6:LaunchImage-800-667h@2x.png
    // 5:LaunchImage-568h@2x.png
    // 4s:LaunchImage@2x.png
    
    //6p
    if (iphone6P) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h@3x"];
    }
    //6
    else if (iphone6) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    }
    //5
    else if (iphone5) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
    }
    //4s
    else if (iphone4) {
        self.launchImageView.image = [UIImage imageNamed:@"LaunchImage-700"];
    }
    
}

#pragma 发送网络请求
- (void)httpSend{

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
