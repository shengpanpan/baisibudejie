//
//  SPAllViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPAllViewController.h"
#import  <AFNetworking/AFNetworking.h>
#import "SPTopic.h"
#import <MJExtension/MJExtension.h>
#import <MJRefresh/MJRefresh.h>

@interface SPAllViewController ()<UITableViewDataSource>
@property (nonatomic, strong) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) UIRefreshControl *control;
@property (nonatomic, strong) NSMutableArray *listArray;
@property (nonatomic, assign) NSString *maxTime;
@end

@implementation SPAllViewController

#pragma 懒加载
- (AFHTTPSessionManager *)mgr{

    if (!_mgr) {
        _mgr = [AFHTTPSessionManager manager];
    }
    return _mgr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = SPRandomColor;
    
    //设置内边距
    self.tableView.contentInset = UIEdgeInsetsMake(SPNavBarMaxY + SPTitlesViewH, 0, SPTabBarH, 0);
    
    //1.设置刷新控件
    [self setUpRefreshControl];
    
    //3.创建数据模型
    //4.搭建页面
    
}

#pragma 初始化刷新控件
- (void)setUpRefreshControl{

    self.tableView.mj_header = [MJRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    
    //开始刷新
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
   
}


#pragma 加载新数据
- (void)loadNewTopics{
    
    //设置参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    
    //发送请求
    [self.mgr GET:SPRequestURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //数据转模型
        self.listArray = [SPTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        //刷新表格
        [self.tableView reloadData];
        //网络加载完成，结束加载显示
        [self.tableView.header endRefreshing];
        
         //获取maxTime
        self.maxTime = responseObject[@"info"][@"maxtime"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.code == NSURLErrorCancelled) {
            NSLog(@"网络请求取消！");
        }
        NSLog(@"加载网络数据失败");
       [self.tableView.header endRefreshing];
        
    }];

    
}


#pragma 加载更多的数据
- (void)loadMoreData{

    //设置参数
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"list";
    parameters[@"c"] = @"data";
    parameters[@"maxtime"] = self.maxTime;
    
    //发送请求
    [self.mgr GET:SPRequestURL parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //数据转模型
        NSArray *newlistArray = [SPTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.listArray addObjectsFromArray:newlistArray];
        
        //刷新表格
        [self.tableView reloadData];
        
        //网络加载完成，结束加载显示
        [self.tableView.header endRefreshing];
        
        //获取最新的maxTime
        self.maxTime = responseObject[@"info"][@"maxtime"];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        if (error.code == NSURLErrorCancelled) {
            NSLog(@"网络请求取消！");
        }
        NSLog(@"加载网络数据失败");
        [self.tableView.header endRefreshing];
        
    }];
    

    
}
#pragma UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.listArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
        cell.backgroundColor = SPRandomColor;
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@%ld",tableView.class,indexPath.row];
    return cell;
}
@end
