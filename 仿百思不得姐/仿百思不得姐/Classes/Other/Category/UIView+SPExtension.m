
//
//  UIView+SPExtension.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "UIView+SPExtension.h"

@implementation UIView (SPExtension)
- (CGFloat)sp_width
{
    return self.frame.size.width;
}

- (CGFloat)sp_height
{
    return self.frame.size.height;
}

- (void)setSp_width:(CGFloat)sp_width
{
    CGRect frame = self.frame;
    frame.size.width = sp_width;
    self.frame = frame;
}

- (void)setSp_height:(CGFloat)sp_height
{
    CGRect frame = self.frame;
    frame.size.height = sp_height;
    self.frame = frame;
}

- (CGFloat)sp_x
{
    return self.frame.origin.x;
}

- (void)setSp_x:(CGFloat)sp_x
{
    CGRect frame = self.frame;
    frame.origin.x = sp_x;
    self.frame = frame;
}

- (CGFloat)sp_y
{
    return self.frame.origin.y;
}

- (void)setSp_y:(CGFloat)sp_y
{
    CGRect frame = self.frame;
    frame.origin.y = sp_y;
    self.frame = frame;
}

- (CGFloat)sp_centerX
{
    return self.center.x;
}

- (void)setSp_centerX:(CGFloat)sp_centerX
{
    CGPoint center = self.center;
    center.x = sp_centerX;
    self.center = center;
}

- (CGFloat)sp_centerY
{
    return self.center.y;
}

- (void)setSp_centerY:(CGFloat)sp_centerY
{
    CGPoint center = self.center;
    center.y = sp_centerY;
    self.center = center;
}

- (CGFloat)sp_right
{
    //    return self.sp_x + self.sp_width;
    return CGRectGetMaxX(self.frame);
}

- (CGFloat)sp_bottom
{
    //    return self.sp_y + self.sp_height;
    return CGRectGetMaxY(self.frame);
}

- (void)setSp_right:(CGFloat)sp_right
{
    self.sp_x = sp_right - self.sp_width;
}

- (void)setSp_bottom:(CGFloat)sp_bottom
{
    self.sp_y = sp_bottom - self.sp_height;
}
@end
