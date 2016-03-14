//
//  UIImageView+SPExtension.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (SPExtension)

/**
 *  设置加载进来的图片
 *
 *  @param url 图片url
 */
- (void)setHeaderImage:(NSString *)url;

/**
 *  设置裁剪后圆形的图片
 *
 *  @param url 图片url
 */
- (void)setHeaderCircleImage:(NSString *)url;

@end
