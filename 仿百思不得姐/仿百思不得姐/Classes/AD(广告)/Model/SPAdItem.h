//
//  SPAdItem.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPAdItem : NSObject
//广告的图片URL
@property (nonatomic, strong) NSString *w_picurl;
//广告图片的宽度
@property (nonatomic, assign) CGFloat w;
//广告图片的高度
@property (nonatomic, assign) CGFloat h;
//广告的跳转的URL
@property (nonatomic, strong) NSString *ori_curl;
@end
