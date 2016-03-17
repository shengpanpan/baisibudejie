//
//  SPTextField.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/16.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTextField.h"
#import "UITextField+SPPlaceHolder.h"

@implementation SPTextField

//设置属性值，可以在awakeFromNib中导入，因为此时所有的控件都已经唤醒了，可以进行属性设置了
- (void)awakeFromNib{
    
    /*
     1.第一种思路：通过富文本设置
     2.第二种思路：通过KVO(必须获取placeHolderLabel的属性，断点或者运行时或者打印)
     3.第三种思路：通过运行时
     */

    //监听文本框的改变，有三种方式：通知，代理，target.此处选型target
    
    //设置光标的颜色
    self.tintColor = [UIColor whiteColor];
    
    //设置占位符颜色
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
//    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attrs];

    //文本框开始编辑
    [self addTarget:self action:@selector(textFieldBegin) forControlEvents:UIControlEventEditingDidBegin];
    
    //文本框结束编辑
    [self addTarget:self action:@selector(textFieldEnd) forControlEvents:UIControlEventEditingDidEnd];
    

    
}

#pragma 开始编辑
- (void)textFieldBegin{

    SPLogFunc;
    
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
     self.placeHolderColor = [UIColor whiteColor];
    
}

#pragma 结束编辑
- (void)textFieldEnd{

    SPLogFunc;
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    
    self.placeHolderColor = [UIColor lightGrayColor];
}

@end
