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
#import "SPAllViewController.h"
#import "SPVideoViewController.h"
#import "SPVoiceViewController.h"
#import "SPPictureViewController.h"
#import "SPJokeViewController.h"
#import "SPTitleButton.h"

@interface SPEssenceViewController ()
@property (nonatomic, strong) UIView *titleView;
@property (nonatomic, strong) UIButton *selectedButton;
@property (nonatomic, strong) UIScrollView *contentView;

@end

@implementation SPEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化NavBar
    [self setUpNavBar];
    
    //1.添加子控制器
    [self setUpChildVC];
    
    //2.添加title视图
    [self setUpTitleView];
    
    //3.添加contentView视图
    [self setUpContentView];
   }

/***********childVC************/
#pragma 初始化子控制器
- (void)setUpChildVC{

    SPAllViewController *allVC = [[SPAllViewController alloc] init];
    allVC.title = @"全部";
    [self addChildViewController:allVC];
    
    SPVideoViewController *videoVC = [[SPVideoViewController alloc] init];
    videoVC.title = @"视频";
    [self addChildViewController:videoVC];
    
    SPVoiceViewController *voiceVC = [[SPVoiceViewController alloc] init];
    voiceVC.title = @"声音";
    [self addChildViewController:voiceVC];
    
    SPPictureViewController *picVC = [[SPPictureViewController alloc] init];
    picVC.title = @"图片";
    [self addChildViewController:picVC];
    
    SPJokeViewController *jokeVC = [[SPJokeViewController alloc] init];
    jokeVC.title = @"段子";
    [self addChildViewController:jokeVC];
    
}

/***********titleView************/
#pragma 添加title视图
- (void)setUpTitleView{

    NSInteger titleCount = self.childViewControllers.count;
    
    //创建titleView
    UIView *titleView = [[UIView alloc] init];
    
    CGFloat titleHeight = SPTitlesViewH;
    CGFloat titleWidht = self.view.sp_width;
    CGFloat titleX = 0;
    CGFloat titleY = 64;
    titleView.frame = CGRectMake(titleX, titleY, titleWidht, titleHeight);
    
    titleView.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.7];
    
    [self.view addSubview:titleView];
    self.titleView = titleView;
    
    //设置frame
    for (int i = 0; i < 5; i++) {
        SPTitleButton *button = [SPTitleButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat buttonY = 0;
        CGFloat buttonW = self.titleView.sp_width/titleCount;
        CGFloat buttonX = i*buttonW;
        CGFloat buttonH = self.titleView.sp_height;
        button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH);
        
        [button setTitle:self.childViewControllers[i].title forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        button.tag = i;
        
        [self.titleView addSubview:button];
        
    }
}

#pragma titleButton点击后的处理方法
- (void)titleButtonClick:(UIButton *)button{
    
    SPLogFunc;
    //选中按钮
    [self selectedButton:button];
    
    //判断当前控制器的视图是否已经家再过
     UITableViewController *selectedVC = self.childViewControllers[button.tag];
    
    if([selectedVC isViewLoaded]) return;
   
    selectedVC.view.frame = self.contentView.bounds;
    [self.contentView addSubview:selectedVC.view];
    
    
   
    
    
}

#pragma 设置选中状态
- (void)selectedButton:(UIButton *)button{
    //取消上次的选中状态
    self.selectedButton.selected = NO;
    //设置选中状态
    button.selected = YES;
    //保存呢选中状态的按钮
    self.selectedButton = button;
    
}

/*************conentView********/
#pragma 添加content视图
- (void)setUpContentView{

    //创建滚动视图
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    
    CGFloat scrollY = CGRectGetMaxY(self.titleView.frame);
    CGFloat scrollW = self.view.bounds.size.width;
    CGFloat scrollH = self.view.bounds.size.height - scrollY;
    CGFloat scrollX = 0;
    scrollView.frame = CGRectMake(scrollX, scrollY, scrollW, scrollH);
    
    
    //设置滚动范围
    scrollView.contentSize = CGSizeMake(scrollW *self.childViewControllers.count, scrollH);
    
    //设置可以交互
    scrollView.userInteractionEnabled = YES;
    
    //取消滚动指示器
    scrollView.showsHorizontalScrollIndicator = NO;
    
    //设置分页
    scrollView.pagingEnabled = YES;
    
    //添加视图
    [self.view addSubview:scrollView];
    
     self.contentView = scrollView;
  
    //禁止系统自动设置内边距
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    
    
}

/***********navbar**************/
#pragma 初始化navbar
- (void)setUpNavBar{
    
//    self.view.backgroundColor = SPRandomColor;
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
