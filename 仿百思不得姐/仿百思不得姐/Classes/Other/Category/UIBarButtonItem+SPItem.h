//
//  UIBarButtonItem+SPItem.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/12.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (SPItem)
/**
 *  创建导航栏barButtonItem对象
 *
 *  @param image     普通状态下的图片
 *  @param highImage 高亮状态下的图片
 *  @param target    监听者
 *  @param action    执行方法
 *
 *  @return 返回导航栏barButtonItem
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image withHighImage:(UIImage *)highImage withTarget:(id)target withAction:(SEL)action;
/**
 *  创建导航栏barButtonItem对象
 *
 *  @param image     普通状态下的图片
 *  @param highImage 选中状态下的图片
 *  @param target    监听者
 *  @param action    执行方法
 *
 *  @return 返回导航栏barButtonItem
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage withTarget:(id)target withAction:(SEL)action;

/**
 *  创建导航栏barButtonItem对象
 *
 *  @param image     普通状态下的图片
 *  @param highImage 选中状态下的图片
 *  @param title     按钮文字
 *  @param target    监听者
 *  @param action    执行方法
 *
 *  @return 返回导航栏barButtonItem
 */
+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image withHighImage:(UIImage *)highImage withTitle:(NSString *)title withTarget:(id)target withAction:(SEL)action;
@end
