
//
//  SPTopicPicView.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/24.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTopicPicView.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>

@interface SPTopicPicView()
@property (weak, nonatomic) IBOutlet UIImageView *gifImageView;
@property (weak, nonatomic) IBOutlet UIButton *openBigPictureButton;
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@end
@implementation SPTopicPicView

- (void)awakeFromNib{
    
    self.autoresizingMask = NO;
}
- (void)setTopic:(SPTopic *)topic{
    
    _topic = topic;
    
    //从磁盘中获取是否存在原图
    //从网络端下载图片1.如果为wifi条件，下载原图2.如果是移动网络 ，愿意下载原图，其他下载拇指图
    //没有网络1.从缓存中查找是否存在拇指图2.如果不存在，设置为占位图
    // 占位图片
    UIImage *placeholder = nil;
    // 根据网络状态来加载图片
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 获得原图（SDWebImage的图片缓存是用图片的url字符串作为key）
    UIImage *originImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:topic.image1];
   
}

@end
