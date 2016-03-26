//
//  NSCalendar+SPCalendar.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/23.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "NSCalendar+SPCalendar.h"

@implementation NSCalendar (SPCalendar)

+ (instancetype)sp_Calendar{
    if ([NSCalendar instancesRespondToSelector:@selector(calendarWithIdentifier:)]) {
        return [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    } else {
        return [NSCalendar currentCalendar];
    }
}
@end
