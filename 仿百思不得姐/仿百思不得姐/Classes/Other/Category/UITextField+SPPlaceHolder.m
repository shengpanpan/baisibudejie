//
//  UITextField+SPPlaceHolder.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/16.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "UITextField+SPPlaceHolder.h"
#import <objc/message.h>

@implementation UITextField (SPPlaceHolder)

//交换方法
+ (void)load{
    
    Method method1 = class_getInstanceMethod(self, @selector(setPlaceholder:));
    
    Method method2 = class_getInstanceMethod(self, @selector(setSp_PlaceHolder:));

    method_exchangeImplementations(method1, method2);
}

- (void)setPlaceHolderColor:(UIColor *)placeHolderColor{
    
    //通过运行时添加属性
    objc_setAssociatedObject(self, @"placeholderColor", placeHolderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    //通过KCV获取_placeholderLabel
    UILabel *label = [self valueForKey:@"placeholderLabel"];
    label.textColor = placeHolderColor;
}


- (instancetype)placeHolderColor{

    return objc_getAssociatedObject(self, @"placeholderColor");
}


- (void)setSp_PlaceHolder:(NSString *)title{

    //设置内容
    [self setSp_PlaceHolder:title];
    
    //设置颜色
    self.placeHolderColor = self.placeHolderColor;
    
}
@end
