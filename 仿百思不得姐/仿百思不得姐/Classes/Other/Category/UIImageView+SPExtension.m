//
//  UIImageView+SPExtension.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "UIImageView+SPExtension.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "UIImage+SPExtension.h"

@implementation UIImageView (SPExtension)

- (void)setHeaderImage:(NSString *)url{

    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
}

- (void)setHeaderCircleImage:(NSString *)url{

    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:[UIImage circleImage:@"defaultUserIcon"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        //如果通过网络加载进来的图片为空，那么返回，会自动设置占位图片。
        if(image == nil) return ;
        SPWeakSelf;
        weakSelf.image = [image circleImage];
    }];
}
@end
