//
//  UIImage+SPExtension.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (SPExtension)
/**
 *  返回一张图片
 */
- (instancetype)circleImage;
/**
 *  通过图片名称加载并返回裁剪过的圆形图片
 */
+ (instancetype)circleImage:(NSString *)name;
@end
