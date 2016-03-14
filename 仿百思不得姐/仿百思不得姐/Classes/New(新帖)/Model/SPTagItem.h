//
//  SPTagItem.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/14.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPTagItem : NSObject

/**
*  image_list  标签图片URL
*/
@property (nonatomic, strong) NSString *image_list;
/**
 *  sub_number  标签订阅数
 */
@property (nonatomic, assign) NSInteger sub_number;
/**
 *  theme_name  标签主题名称
 */
@property (nonatomic, strong) NSString *theme_name;

@end
