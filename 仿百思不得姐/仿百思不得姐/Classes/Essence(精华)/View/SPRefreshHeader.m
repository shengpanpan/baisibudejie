//
//  SPRefreshHeader.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/20.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPRefreshHeader.h"
@interface SPRefreshHeader()
@property (nonatomic, strong) UIImageView *imageView;
@end
@implementation SPRefreshHeader

- (void)prepare{

    [super prepare];
    
    self.automaticallyChangeAlpha = YES;
    self.lastUpdatedTimeLabel.textColor = [UIColor orangeColor];
    self.stateLabel.textColor = [UIColor orangeColor];
    [self setTitle:@"赶紧下拉刷新吧" forState:MJRefreshStateIdle];
    [self setTitle:@"赶紧松开吧" forState:MJRefreshStatePulling];
    [self setTitle:@"正在加载数据..." forState:MJRefreshStateRefreshing];
    
    //添加图片
//    UIImageView *imageView = [[UIImageView alloc] init];
//    UIImage *image = [UIImage imageNamed:@"caomei"];
//    imageView.image = image;
//    
//    [self addSubview:imageView];
//    
//    self.imageView = imageView;
}

//拜访子控件
- (void)placeSubviews{

    [super placeSubviews];
//    
//    self.imageView.frame = CGRectMake(0, -50, self.sp_width, 100);
}
@end
