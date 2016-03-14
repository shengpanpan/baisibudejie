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

@interface SPEssenceViewController ()<UIScrollViewDelegate>
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
    
    //4.设置代理监听contentView滚动
    self.contentView.delegate = self;
    
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
    for (int i = 0; i < self.childViewControllers.count; i++) {
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
    
    //选中按钮，跳转到对应的控制器
    [self selectedControll:button];
    
    //设置内容视图的偏移量
    self.contentView.contentOffset = CGPointMake(button.tag*(self.contentView.bounds.size.width), 0);
 
}

#pragma 选中控制器并添加视图
- (void)selectedControll:(UIButton *)button{

    //判断当前控制器的视图是否已经家再过
    UITableViewController *selectedVC = self.childViewControllers[button.tag];
    
    if(selectedVC.view.superview) return;
    
    //设置视图的位置
    CGFloat viewX = button.tag*(self.contentView.bounds.size.width);
    CGFloat viewY = 0;
    CGFloat viewW = self.contentView.bounds.size.width;
    CGFloat viewH = self.contentView.bounds.size.height;
    selectedVC.view.frame = CGRectMake(viewX, viewY, viewW, viewH);
    
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

    
    //选中全部按钮
    [self titleButtonClick:self.titleView.subviews[0]];
    
}

#pragma UIScrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    SPLogFunc;
    //1.获得X偏移量
    CGFloat contentX = scrollView.contentOffset.x;
    
    //2.计算视图对应的位置
    NSInteger i = contentX/self.contentView.sp_width;
    
    //点击对应i值得按钮
    [self titleButtonClick:self.titleView.subviews[i]];
    
}
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{

    SPLogFunc;
    // 取出对应的子控制器
    int index = scrollView.contentOffset.x / scrollView.sp_width;
    UIViewController *willShowChildVc = self.childViewControllers[index];
    
    // 如果控制器的view已经被创建过，就直接返回
    if (willShowChildVc.isViewLoaded) return;
    
    // 添加子控制器的view到scrollView身上
    willShowChildVc.view.frame = scrollView.bounds;
    [scrollView addSubview:willShowChildVc.view];

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

#pragma 点击导航栏左边按钮
- (void)leftBarButtonClick{

    SPLogFunc;
}

#pragma 点击导航栏的右边的按钮
- (void)rightBarButtonClick{
    
    SPLogFunc;
}

#pragma 内存泄露
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
