//
//  NSDate+SPExtension.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/23.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "NSDate+SPExtension.h"
#import "NSCalendar+SPCalendar.h"

@implementation NSDate (SPExtension)

- (BOOL)isThisYear{

    
    NSDateComponents *components = [self compareToNowDate];
    
    return components.year == 0;
}

- (BOOL)isToday{
    
    NSDateComponents *components = [self compareToNowDate];
    
    return components.year == 0 && components.month == 0 &&components.day == 0 ;
}

- (BOOL)isTomorrow{
    
    NSDateComponents *components = [self compareToNowDate];
    return components.year == 0 && components.month == 0 && components.day == 1;
    
}

- (BOOL)isYesterday{

    NSDateComponents *components = [self compareToNowDate];
    
    return components.year == 0 && components.month == 0 && components.day == -1;
    
}

//时间对象和当前时间进行比较
- (NSDateComponents *)compareToNowDate{
    
    //设置时间格式
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    
    //获取日历对象
    NSCalendar *calendar = [NSCalendar sp_Calendar];
    
    //时间转换为相同格式的的字符串
    NSString *selfStr = [formatter stringFromDate:self];
    NSString *nowStr = [formatter stringFromDate:[NSDate date]];
    
    //将相同格式的字符创转换为相同格式地时间
    NSDate *selfDate = [formatter dateFromString:selfStr];
    NSDate *nowDate = [formatter dateFromString:nowStr];
    
    
    //日历对象比较两个时间，前提是链各个时间的格式一样
    NSDateComponents *components = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond fromDate:nowDate toDate:selfDate options:0];

    return components;
    
}
@end
