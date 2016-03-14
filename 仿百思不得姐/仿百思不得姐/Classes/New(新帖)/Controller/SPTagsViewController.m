//
//  SPTagsViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTagsViewController.h"
#import <AFNetworking/AFNetworking.h>
#import <MJExtension/MJExtension.h>
#import "SPTagItem.h"
#import "SPTagCell.h"
#import <SVProgressHUD/SVProgressHUD.h>

@interface SPTagsViewController ()

@property (nonatomic, weak) AFHTTPSessionManager *mgr;
@property (nonatomic, strong) NSArray *tagsArray;

@end

@implementation SPTagsViewController

static NSString * const ID = @"tag";

#pragma tagsArray懒加载
- (AFHTTPSessionManager *)mgr{

    if (!_mgr) {
        _mgr =[AFHTTPSessionManager manager];
    }
    
    return _mgr;
}
- (NSArray *)tagsArray{

    if (!_tagsArray) {
        _tagsArray = [NSArray array];
    }
    return _tagsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"标签推荐";
    
    //1.初始化tableView
    [self setUpTableView];

    //2.加载cell数据
    [self loadCellData];
    
    
}

#pragma 初始化table
- (void)setUpTableView{

    self.tableView.backgroundColor = SPRandomColor;
    
    self.tableView.rowHeight = 70;

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([SPTagCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

#pragma loadData
- (void)loadCellData{

    //创建弹窗
    [SVProgressHUD show];
    //1.发送网络请求
    
    
    //1.2.设置请求数据
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    
    SPWeakSelf;
    //1.3.发送网络请求
    [self.mgr GET:SPRequestURL parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        //字典数组转换为模型数组
        weakSelf.tagsArray = [SPTagItem mj_objectArrayWithKeyValuesArray:responseObject];
        NSLog(@"_tagsArray%ld",_tagsArray.count);
        
        //刷新表格
        [weakSelf.tableView reloadData];
        
        //关闭弹窗
        [SVProgressHUD dismiss];
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      
        if (error.code == NSURLErrorCancelled) return ;
        if (error.code == NSURLErrorTimedOut) {
            [SVProgressHUD showErrorWithStatus:@"加载超时，请稍后再试！"];
        }else{
        
            [SVProgressHUD showErrorWithStatus:@"加载数据失败！"];
        }
     
        
    }];
    

}

- (void)dealloc{

    //停止请求
    [self.mgr invalidateSessionCancelingTasks:YES];
    [SVProgressHUD dismiss];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    SPLogFunc;
    SPLog(@"%ld",self.tagsArray.count);
       return self.tagsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SPTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];

   //设置cell
    cell.tagItem = self.tagsArray[indexPath.row];
    
    return cell;
}


@end
