//
//  SPADViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"


#import "SPAdItem.h"
#import "SPADViewController.h"
#import <MJExtension/MJExtension.h>
#import <AFNetworking/AFNetworking.h>
#import <UIImageView+WebCache.h>
#import "SPTabBarController.h"

@interface SPADViewController ()
@property (weak, nonatomic) IBOutlet UIView *placeHolderView;
@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;
@property (weak, nonatomic) IBOutlet UIButton *timerButton;
@property (strong, nonatomic) UIImageView *ADImageView;
@property (strong,nonatomic) NSTimer *timer;

@end

@implementation SPADViewController

#pragma 懒加载ADImageView
- (UIImageView *)ADImageView{

    if (!_ADImageView) {
        _ADImageView = [[UIImageView alloc] init];
    }
    return _ADImageView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //创建计时器
    [self createTimer];
    
    //设置启动视图
    [self setLaunchImage];
    
    //加载数据
    [self loadData];
}

#pragma 启动视图
- (void)setLaunchImage{

    //通过高度，屏幕适配
    // 6p:LaunchImage-800-Portrait-736h@3x.png
    // 6:LaunchImage-800-667h@2x.pngvcx
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
- (void)loadData{
    /*
     http://mobads.baidu.com/cpro/ui/mads.php ?=
     */
    
    //1.创建会话管理者
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];

    //2.拼接参数
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[@"code2"] =code2;
    
    //3.发送请求
    [sessionManager GET:@"http://mobads.baidu.com/cpro/ui/mads.php" parameters:attr progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
     
        //1.获取ad的字典
        NSDictionary *adDic = [responseObject[@"ad"] lastObject];
        //2.将字典转换为模型
        SPAdItem *adItem = [SPAdItem mj_objectWithKeyValues:adDic];
        //3.设置ad
        if (adItem.w > 0) {
            
//            adItem.h = SPScreenW/(adItem.w)*adItem.h;
//            NSLog(@"%f%f",adItem.w,adItem.h);
            
            self.ADImageView.frame = CGRectMake(0, 0, SPScreenW, SPScreenH);
            
            //加载图片
            [self.ADImageView sd_setImageWithURL:[NSURL URLWithString:adItem.w_picurl]];
            
            //将图片添加到父类视图
            [_placeHolderView insertSubview:_ADImageView atIndex:0];
        }
        
//        SPLog(@"%@",responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SPLog(@"老大，广告数据请求失败！");
        SPLog(@"%@",error);
    }];

}

#pragma 跳转到tabBar控制器
- (IBAction)goToMainVC:(UIButton *)button {
    
    [self jumpToTabBar];
}

#pragma 控制器隐藏状态栏
- (BOOL)prefersStatusBarHidden{

    return YES;
}

#pragma 创建计时器
- (void)createTimer{

    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

#pragma 计时器调用的方法
- (void)timeChange{

    SPLogFunc;
    
    static int i = 5;
    
    NSString *name = [NSString stringWithFormat:@"跳转(%d)秒",i];
    [self.timerButton setTitle:name forState:UIControlStateNormal];
    
    i--;
    
    //i<0，跳转到tabbar，并销毁计时器
    if (i < 0) {
        
        //跳转到tabbar控制器
        [self jumpToTabBar];
        
        //销毁计时器
        [self.timer invalidate];
        self.timer = nil;
        
    }
    
}

#pragma 跳转到tabbar控制器
- (void)jumpToTabBar{
    
    SPTabBarController *tabBarVc = [[SPTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
