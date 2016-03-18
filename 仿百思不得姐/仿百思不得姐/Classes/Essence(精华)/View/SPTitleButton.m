//
//  SPTitleButton.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTitleButton.h"
@implementation SPTitleButton

/*
 NS_DESIGNATED_INITIALIZER:特定构造方法
 1】子类如果重写父类的特定构造方法，那么必须用super调用父类的构造方法
 
 警告信息:Designated initializer missing a 'super' call to a designated initializer of the super class
 意思：【特定构造方法】缺少super去调用父类的特定构造方法
 */
- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        self.titleLabel.font = [UIFont systemFontOfSize:14];
    }
    return self;
}

#pragma 取消高亮
- (void)setHighlighted:(BOOL)highlighted{
    /*
     设置高亮的过程：点击按钮----调用set方法，系统调用get方法获得高亮信息，所以通过重写set方法就可以取消高亮了。
     */
}

@end
