//
//  SPSettingViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/12.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPSettingViewController.h"
#import <SDImageCache.h>
#import <SVProgressHUD.h>
#import "SPFileTools.h"

#define CachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

@interface SPSettingViewController ()<UITableViewDelegate>
@property (nonatomic,assign) CGFloat totalSize;
@end

static NSString * const ID = @"cell";
@implementation SPSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:ID];
    
    self.tableView.delegate = self;
    
 
}

#pragma 初始化导航控制器
- (void)setUpNav{
    
    self.navigationItem.title = @"设置";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"jusp" style:0 target:self action:@selector(jump)];

}

#pragma 跳转方法
- (void)jump{

    SPLogFunc;
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:vc animated:YES];
    
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    
    cell.textLabel.text = [self sizeStr];
    
    //获取缓存的大小
    [SPFileTools getFileSize:CachePath complection:^(NSInteger totalSize) {
        self.totalSize = totalSize;
    }];
    
    //显示缓存
    [self sizeStr];
//     [tableView reloadData];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [SPFileTools removeCacheWithDirectoryPath:CachePath];
    
    [tableView reloadData];
}
// 获取缓存尺寸字符串
- (NSString *)sizeStr
{
    
    
    NSString *sizeStr = @"清除缓存";
    // MB KB B
    if (self.totalSize > 1000 * 1000) {
        // MB
        CGFloat sizeF = self.totalSize / 1000.0 / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fMB)",sizeStr,sizeF];
    } else if (self.totalSize > 1000) {
        // KB
        CGFloat sizeF = self.totalSize / 1000.0;
        sizeStr = [NSString stringWithFormat:@"%@(%.1fKB)",sizeStr,sizeF];
    } else if (self.totalSize > 0) {
        // B
        sizeStr = [NSString stringWithFormat:@"%@(%fB)",sizeStr,_totalSize];
    }
    
    return sizeStr;
}
@end
