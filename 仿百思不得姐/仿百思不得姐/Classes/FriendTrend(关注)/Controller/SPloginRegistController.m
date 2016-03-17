//
//  SPloginRegistController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/15.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPloginRegistController.h"
#import "SPLoginRegistView.h"
#import "SPFastLoginView.h"
#import "NSObject+SPRuntimeTest.h"

@interface SPloginRegistController ()
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *fastLoginView;
@property (nonatomic, strong) UIView *loginView;
@property (nonatomic, strong) UIView *registView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftMargin;
@property (nonatomic, weak) UIView *subfastView;
@end

@implementation SPloginRegistController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    //加载contentView
    [self setUpContentView];
    
    //设置快速登录
    [self setUpFastLogin];
    
}

- (IBAction)loginRegistClick:(UIButton *)button {
    
    button.selected = !button.selected;
    
    //设置左边的距离的约束，从而实现界面的滑动
    self.leftMargin.constant = self.leftMargin.constant == 0 ? -self.contentView.sp_width/2 : 0;
    
    //设置动画
    [UIView animateWithDuration:0.5 animations:^{
        [self.view layoutIfNeeded];
    }];
    
}

#pragma 快速登录
- (void)setUpFastLogin{

    SPFastLoginView *fastView = [SPFastLoginView fastView];
    [self.fastLoginView addSubview:fastView];
    self.subfastView = fastView;
}
#pragma 加载contentView
- (void)setUpContentView{

    //加载登陆视图
    SPLoginRegistView *loginView = [SPLoginRegistView loginView];
   
    [self.contentView addSubview:loginView];
    self.loginView = loginView;
    
    //加载注册视图
    SPLoginRegistView *registView = [SPLoginRegistView registView];
  
    [self.contentView addSubview:registView];
    self.registView = registView;
    
    
}

//设置view,在view显示之前设置。不然从xib加载进来的view的尺寸不一致
- (void)viewDidLayoutSubviews{

    //调用系统的方法
    [super viewDidLayoutSubviews];
    
    //设置从xib加载的子视图的
    
     self.loginView.frame = CGRectMake(0, 0, self.contentView.sp_width/2, self.contentView.sp_height);
    
      self.registView.frame = CGRectMake(self.contentView.sp_width/2, 0, self.contentView.sp_width/2, self.contentView.sp_height);
    //拉伸图片
    self.subfastView.frame = CGRectMake(0, 0, self.fastLoginView.sp_width, self.fastLoginView.sp_height);
    
}

@end
