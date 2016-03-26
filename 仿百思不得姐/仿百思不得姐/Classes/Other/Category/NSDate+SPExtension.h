//
//  NSDate+SPExtension.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/23.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (SPExtension)
/**
 *  当前时间对象是否为今年
 *  必须设置一直的时间格式  默认为formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
 *  @return yes or no
 */
- (BOOL)isThisYear;

/**
 *  当前时间对象是否为今天
 *  必须设置一直的时间格式  默认为formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
 *  @return yes or no
 */
- (BOOL)isToday;

/**
 *  当前时间对象是否为明天
 *  必须设置一直的时间格式  默认为formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
 *  @return yes or no
 */
- (BOOL)isTomorrow;

/**
 *  当前时间对象是否为昨天
 *  必须设置一直的时间格式  默认为formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
 *  @return yes or no
 */
- (BOOL)isYesterday;

/**
 *  当前时间对象和现在的时间比较后的Components  fromDate:nowDate toDate:selfDate
 *  必须设置一直的时间格式  默认为formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
 *  @return yes or no
 */
- (NSDateComponents *)compareToNowDate;
@end
