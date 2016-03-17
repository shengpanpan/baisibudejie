//
//  NSObject+SPRuntimeTest.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/16.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "NSObject+SPRuntimeTest.h"
#import <objc/runtime.h>

@implementation NSObject (SPRuntimeTest)
+ (void)runtimetest{
    
    
    unsigned int count = 0;
    
    // 1.获取成员属性数组
    Ivar *ivarList = class_copyIvarList(self, &count);
    
    // 2.遍历所有的成员属性名,一个一个去字典中取出对应的value给模型属性赋值
    for (int i = 0; i < count; i++) {
        
        // 2.1 获取成员属性
        Ivar ivar = ivarList[i];
        
        // 2.2 获取成员属性名 C -> OC 字符串
        NSString *ivarName = [NSString stringWithUTF8String:ivar_getName(ivar)];
        
        // 获取成员属性类型
        NSString *ivarType = [NSString stringWithUTF8String:ivar_getTypeEncoding(ivar)];
        
        
        NSLog(@"%@---名称%@---类型%@",self,ivarName,ivarType);
        
        
    }
}
@end
