
//
//  UIImage+originalImage.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/11.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "UIImage+originalImage.h"

@implementation UIImage (originalImage)

+ (UIImage *)originalImageWithName:(NSString *)name{

    UIImage *image = [UIImage imageNamed:name];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
