//
//  SPTitleButton.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTitleButton.h"

@implementation SPTitleButton

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
}

@end
