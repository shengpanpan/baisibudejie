//
//  UITextField+SPPlaceHolder.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/16.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (SPPlaceHolder)
/**
 *  KVC,实现直接给你UITextField的属性placeHolderColor赋值，来改变颜色
 */
@property UIColor *placeHolderColor;
/**
 *  设置placeHolder的内容：添加字体并且改变将颜色设置为当前颜色。
 *
 *  @param title 内容
 */
- (void)setSp_PlaceHolder:(NSString *)title;
@end
