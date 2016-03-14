//
//  UIImage+SPExtension.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "UIImage+SPExtension.h"

@implementation UIImage (SPExtension)

/**
 *  返回一张图片
 */
- (instancetype)circleImage{

    // 开启图形上下文
    UIGraphicsBeginImageContext(self.size);
    
    // 获得上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // 矩形框
    CGRect rect = CGRectMake(0, 0, self.size.width, self.size.height);
    
    // 添加一个圆
    CGContextAddEllipseInRect(ctx, rect);
    
    // 裁剪(裁剪成刚才添加的图形形状)
    CGContextClip(ctx);
    
    // 往圆上面画一张图片
    [self drawInRect:rect];
    
    // 获得上下文中的图片
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭图形上下文
    UIGraphicsEndImageContext();
    
    return image;

}

/**
 *  通过图片名称加载并返回裁剪过的圆形图片
 */
+ (instancetype)circleImage:(NSString *)name{

    return [[UIImage imageNamed:name] circleImage];
}
@end
