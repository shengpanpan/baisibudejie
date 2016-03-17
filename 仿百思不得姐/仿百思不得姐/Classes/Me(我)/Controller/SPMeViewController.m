//
//  SPMeViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPMeViewController.h"
#import "UIImage+originalImage.h"
#import "UIBarButtonItem+SPItem.h"
#import "SPSettingViewController.h"
#import "SPCollectionViewCell.h"
#import <AFNetworking/AFNetworking.h>
#import "SPSquareItem.h"
#import <MJExtension/MJExtension.h>
#import <SVProgressHUD/SVProgressHUD.h>

@interface SPMeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>
@property (nonatomic, strong) NSMutableArray *itemsArray;
@property (nonatomic, strong) UICollectionView *collectionView;
@end

static NSString * const ID = @"cell";

//1.1设置cell尺寸
static NSInteger clos = 4;//列数
static NSInteger margin = 1;//行距
#define WH  (SPScreenW - (clos-1)*margin)/clos


@implementation SPMeViewController
- (void)viewDidLoad {
    [super viewDidLoad];

   //初始化导航栏
    [self setUpNavBar];
    
    //初始化底部视图
    [self setUpFootView];
    
    //加载数据
    [self loadData];
    
    //处理cell的间距
    self.tableView.sectionHeaderHeight = 0;
    self.tableView.sectionFooterHeight = 10;
    
    self.tableView.contentInset = UIEdgeInsetsMake(-25, 0, 0, 0);
    
}

#pragma 代理方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    //跳转到web视图
    SPSquareItem *item = self.itemsArray[indexPath.row];
    
    if (!item.url)  return;
    
    SPLogFunc;
    

}
#pragma 加载数据
- (void)loadData{

    //1，创建请求管理者
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    //2.设置请求参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    
    //3.发送请求
    [manager GET:SPRequestURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
       //取出广场列表数组
        NSArray *square_listArray = responseObject[@"square_list"];
        
        //字典数组转换为模型数组
       self.itemsArray = [SPSquareItem mj_objectArrayWithKeyValuesArray:square_listArray];
        
        //对数据进行处理：将九宫格补充完完整。利用MVC思想，通过模型改变现实view
        [self resoveData];
        
        //重新计算collectionView的高度
        NSInteger rowCount = (self.itemsArray.count-1)/clos + 1;
        
        CGFloat cellHeight = rowCount *(WH + margin);
        //给cellectionView设置高度
        CGRect collectionViewFrame = self.collectionView.frame;
        collectionViewFrame.size.height = cellHeight;
        self.collectionView.frame = collectionViewFrame;
        
        
        //根据自己计算的cellectionview的frame。添加给tableView让其自己计算
        self.tableView.tableFooterView = self.collectionView;
        
        // 刷新表格
        [self.collectionView reloadData];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [SVProgressHUD showWithStatus:@"网络请求失败！"];
    }];
    
    
}

#pragma 处理数据
- (void)resoveData{

    //获取数组的个数
    NSInteger count = self.itemsArray.count;
    
    //获取空缺的地方
    NSInteger exte = count/clos;
    
    if (exte) {
        NSInteger last = clos - exte;
        
        for (int i = 0; i<last; i++) {
            
            SPSquareItem *lastItem = [[SPSquareItem alloc] init];
            
            [self.itemsArray addObject:lastItem];
            
        }
    }
    
    //获得剩余带填充内容的空格
//    NSInteger last = count ;
    
}
#pragma 初始化底部视图
- (void)setUpFootView{

    //1.设置布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    
    //1.1设置cell尺寸
    layout.itemSize = CGSizeMake(WH, WH);
    layout.minimumLineSpacing = margin;
    layout.minimumInteritemSpacing = margin;

    
    
    //创建collectionView
    UICollectionView *view = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    view.backgroundColor = [UIColor whiteColor];
    view.delegate = self;
    self.tableView.tableFooterView = view;
    self.collectionView = view;
    view.backgroundColor = self.tableView.backgroundColor;
    view.dataSource = self;
     view.scrollEnabled = NO;
    //2.cell注册
    [view registerNib:[UINib nibWithNibName:NSStringFromClass([SPCollectionViewCell class]) bundle:nil] forCellWithReuseIdentifier:ID];
    //3.cell自定义
    
}

#pragma UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{

    return self.itemsArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    SPCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    cell.squareItem = self.itemsArray[indexPath.row];
    
    return cell;
}

#pragma 初始化NAVBAR
- (void)setUpNavBar{
    
    
    
    UIBarButtonItem *settingItem = [UIBarButtonItem barButtonItemWithImage:[UIImage originalImageWithName:@"mine-setting-icon"] withHighImage:[UIImage originalImageWithName:@"mine-setting-icon-click"] withTarget:self withAction:@selector(settingBtnClick)];
    
    UIBarButtonItem *nightItem = [UIBarButtonItem barButtonItemWithImage:[UIImage imageNamed:@"mine-moon-icon"] withSelectedImage:[UIImage imageNamed:@"mine-sun-icon-click"] withTarget:self withAction:@selector(nightBtnClick:)];
    
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    
    self.navigationItem.title = @"我的";
    
}

#pragma  点击设置按钮跳转
- (void)settingBtnClick{

    SPLogFunc;
    
    SPSettingViewController *vc = [[SPSettingViewController alloc] init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma  模式转换
- (void)nightBtnClick:(UIButton *)button{

    SPLogFunc;
}



@end
