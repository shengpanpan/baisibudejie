//
//  XMGAllViewController.m
//  5期-百思不得姐
//
//  Created by xiaomage on 15/11/16.
//  Copyright © 2015年 xiaomage. All rights reserved.
//

#import "SPAllViewController.h"
#import <AFNetworking.h>
#import "SPTopic.h"
#import "SPTopicCell.h"
#import <MJExtension.h>
#import <UIImageView+WebCache.h>
#import "SPRefreshHeader.h"

@interface SPAllViewController ()

/** 所有的帖子数据 */
@property (nonatomic, strong) NSMutableArray *topics;
/** 下拉刷新的提示文字 */
@property (nonatomic, weak) UILabel *label;
/** maxtime : 用来加载下一页数据 */
@property (nonatomic, copy) NSString *maxtime;
/** 任务管理者 */
@property (nonatomic, strong) AFHTTPSessionManager *manager;

@end

static NSString *const ID = @"cell";

@implementation SPAllViewController

- (AFHTTPSessionManager *)manager
{
    if (!_manager) {
        _manager = [AFHTTPSessionManager manager];
    }
    return _manager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64 + 35, 0, 49, 0);
    self.tableView.scrollIndicatorInsets = self.tableView.contentInset;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self setupRefresh];
    
    //注册cell
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SPTopicCell class]) bundle:nil] forCellReuseIdentifier:ID];
    //设置的是整个行高，重写cell的setFrame方法，将cell的高度降低，但是并不影响行高
//    self.tableView.rowHeight = 300;
    self.tableView.backgroundColor = [UIColor lightGrayColor];

}

- (void)setupRefresh
{
    self.tableView.mj_header = [SPRefreshHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewTopics)];
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreTopics)];
}

#pragma mark - 数据加载

- (void)loadNewTopics
{
    // 取消所有请求
    //    for (NSURLSessionTask *task in self.manager.tasks) {
    //        [task cancel];
    //    }
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 关闭NSURLSession + 取消所有请求
    // [self.manager invalidateSessionCancelingTasks:YES];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"41";
    
    // 发送请求
    [self.manager GET:SPRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // 存储maxtime(方便用来加载下一页数据)
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典数组 -> 模型数组
        self.topics = [SPTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 让[刷新控件]结束刷新
        [self.tableView.mj_header endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (error.code == NSURLErrorCancelled) {
            // 取消了任务
        } else {
            // 是其他错误
        }
        SPLog(@"请求失败 - %@", error);
        
        // 让[刷新控件]结束刷新
        [self.tableView.mj_header endRefreshing];
    }];
}

// 一个请求任务被取消了(cancel), 会自动调用AFN请求的failure这个block

- (void)loadMoreTopics
{
    // 取消所有的请求
    [self.manager.tasks makeObjectsPerformSelector:@selector(cancel)];
    
    // 参数
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"list";
    params[@"c"] = @"data";
    params[@"type"] = @"41";
    params[@"maxtime"] = self.maxtime;
    
    
    // 发送请求
    [self.manager GET:SPRequestURL parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nonnull responseObject) {
        // 存储这页对应的maxtime
        self.maxtime = responseObject[@"info"][@"maxtime"];
        
        // 字典数组 -> 模型数组
        NSArray *moreTopics = [SPTopic mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.topics addObjectsFromArray:moreTopics];
        
        // 刷新表格
        [self.tableView reloadData];
        
        // 让[刷新控件]结束刷新
        [self.tableView.mj_footer endRefreshing];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        SPLog(@"请求失败 - %@", error);
        
        // 让[刷新控件]结束刷新
        [self.tableView.mj_footer endRefreshing];
    }];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 1.确定重用标示:
    static NSString *ID = @"cell";
    
    // 2.从缓存池中取
    SPTopicCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    // 4.显示数据
    cell.topic = self.topics[indexPath.row];
    NSLog(@"%f",cell.topic.cellHeight);
    return cell;
}

#pragma mark - 代理方法
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    SPTopic *topic = self.topics[indexPath.row];
    return topic.cellHeight;
}
@end
