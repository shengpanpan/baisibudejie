//
//  SPFileTools.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/17.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SPFileTools : NSObject
/**
 *  删除缓存内容
 *
 *  @param directory 目录
 */
+ (void)removeCacheWithDirectoryPath:(NSString *)directory;

/**
 *  获得文件缓存
 *
 *  @param directoryPath 文件夹路径
 *  @param completion
 */
+ (void)getFileSize:(NSString *)directoryPath complection:(void(^)(NSInteger))completion;
@end
