//
//  SPTopicVideoView.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/24.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTopicVideoView.h"
#import <AFNetworking.h>
#import <UIImageView+WebCache.h>

@interface SPTopicVideoView()

@property (weak, nonatomic) IBOutlet UIImageView *video_ImageView;
@property (weak, nonatomic) IBOutlet UILabel *palyCount;
@property (weak, nonatomic) IBOutlet UILabel *playTimeLabel;

@end
@implementation SPTopicVideoView

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
    if (originImage) { // 原图已经被下载过
        self.video_ImageView.image = originImage;
    } else { // 原图并未下载过
        if (mgr.isReachableViaWiFi) {
            [self.video_ImageView sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeholder];
        } else if (mgr.isReachableViaWWAN) {
#warning downloadOriginImageWhen3GOr4G配置项的值需要从沙盒里面获取
            // 3G\4G网络下时候要下载原图
            BOOL downloadOriginImageWhen3GOr4G = YES;
            if (downloadOriginImageWhen3GOr4G) {
                [self.video_ImageView sd_setImageWithURL:[NSURL URLWithString:topic.image1] placeholderImage:placeholder];
            } else {
                [self.video_ImageView sd_setImageWithURL:[NSURL URLWithString:topic.image0] placeholderImage:placeholder];
            }
        } else { // 没有可用网络
            UIImage *thumbnailImage = [[SDImageCache sharedImageCache] imageFromDiskCacheForKey:topic.image0];
            if (thumbnailImage) { // 缩略图已经被下载过
                self.video_ImageView.image = thumbnailImage;
            } else { // 没有下载过任何图片
                // 占位图片;
                self.video_ImageView.image = placeholder;
            }
        }
    }

    
    
    // 播放数量
    if (topic.playcount >= 10000) {
        self.palyCount.text = [NSString stringWithFormat:@"%.1f万播放", topic.playcount / 10000.0];
    } else {
        self.palyCount.text = [NSString stringWithFormat:@"%zd播放", topic.playcount];
    }
    // %04d : 占据4位，多余的空位用0填补
    self.playTimeLabel.text = [NSString stringWithFormat:@"%02zd:%02zd", topic.voicetime / 60, topic.videotime % 60];
}
@end
