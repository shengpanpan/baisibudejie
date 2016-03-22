//
//  SPVideoViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPVideoViewController.h"
#import <MJRefresh.h>
#import "SPRefreshHeader.h"

@interface SPVideoViewController ()
/** 数据量 */
@property (nonatomic, assign) NSInteger dataCount;
/** 上拉刷新控件 */
@property (nonatomic, weak) UIView *footer;
/** 上拉刷新控件里面的文字 */
@property (nonatomic, weak) UILabel *footerLabel;
/** 下拉刷新控件里面的文字 */
@property (nonatomic, weak) UILabel *headerLabel;
/** 上拉刷新控件时候正在刷新 */
@property (nonatomic, assign, getter=isFooterRefreshing) BOOL footerRefreshing;
@end

@implementation SPVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = SPRandomColor;
    
    //设置内边距
    self.tableView.contentInset = UIEdgeInsetsMake(SPNavBarMaxY + SPTitlesViewH, 0, SPTabBarH, 0);
    
    //初始化刷新控件
    [self setupRefresh];
}

#pragma 刷新控件
- (void)setupRefresh{

  
    self.tableView.header = [SPRefreshHeader headerWithRefreshingBlock:^{
        NSLog(@"打印");
    }];
    self.tableView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(LoadMoreData)];
}

#pragma 加载更多数据
- (void)LoadMoreData{

    SPLogFunc;
}
#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;

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

#pragma mark - 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
  
}

@end
