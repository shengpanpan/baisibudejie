//
//  UIBarButtonItem+SPItem.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/12.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "UIBarButtonItem+SPItem.h"

@implementation UIBarButtonItem (SPItem)


+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image withHighImage:(UIImage *)highImage withTarget:(id)target withAction:(SEL)action{
    
    //创建左边和右边按钮,有高亮状态，没有选中状态，为按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    //为避免打击区域被放大，将按钮包装成uiview
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    return barButtonItem;
}

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image withSelectedImage:(UIImage *)selectedImage withTarget:(id)target withAction:(SEL)action{
    
    //创建左边和右边按钮,有高亮状态，没有选中状态，为按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button sizeToFit];
    //为避免打击区域被放大，将按钮包装成uiview
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    return barButtonItem;
}

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image withHighImage:(UIImage *)highImage withTitle:(NSString *)title withTarget:(id)target withAction:(SEL)action{

    //创建左边和右边按钮,有高亮状态，没有选中状态，为按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:highImage forState:UIControlStateHighlighted];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
    [button sizeToFit];
    //为避免打击区域被放大，将按钮包装成uiview
    UIView *containView = [[UIView alloc] initWithFrame:button.bounds];
    [containView addSubview:button];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:containView];
    return barButtonItem;

}
@end
