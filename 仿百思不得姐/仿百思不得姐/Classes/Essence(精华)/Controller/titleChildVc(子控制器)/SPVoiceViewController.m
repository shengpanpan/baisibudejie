//
//  SPVoiceViewController.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPVoiceViewController.h"

@interface SPVoiceViewController ()

@end

@implementation SPVoiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
       self.view.backgroundColor = SPRandomColor;
  
    self.tableView.contentInset = UIEdgeInsetsMake(SPNavBarMaxY + SPTitlesViewH, 0, SPTabBarH, 0);
    
    
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
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
