//
//  SPFastLoginView.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/16.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPFastLoginView.h"

@implementation SPFastLoginView

+ (instancetype)fastView{

    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}

//想要修改该视图子视图的属性值，可以通过继承
@end
