//
//  NSCalendar+SPCalendar.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/23.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSCalendar (SPCalendar)
/**
 *  类方法，根据当前系统创建日历并返回
 *
 *  @return 日历对象
 */
+ (instancetype)sp_Calendar;
@end
