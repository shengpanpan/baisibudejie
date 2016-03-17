//
//  SPFileTools.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/17.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPFileTools.h"

@implementation SPFileTools
/**
 *  删除缓存内容
 *
 *  @param directory 目录
 */
+ (void)removeCacheWithDirectoryPath:(NSString *)directory{

    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directory isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
       NSException *exception =  [NSException exceptionWithName:@"pathError" reason:@"笨蛋，请传入正确的路径" userInfo:nil];
        [exception raise];
    }
    
    //获取cache文件下的所有文件，不包括子路径的子路径。，只需要把父类的文件删除就OK
    NSArray *subPaths = [mgr contentsOfDirectoryAtPath:directory error:nil];
    
    for (NSString *subString in subPaths) {
        //拼接成全路径
        NSString *filePath = [directory stringByAppendingPathComponent:subString];
        
        [mgr removeItemAtPath:filePath error:nil];
    }
}

/**
 *  获得文件缓存
 *
 *  @param directoryPath 文件夹路径
 *  @param completion
 */
+ (void)getFileSize:(NSString *)directoryPath complection:(void(^)(NSInteger))completion{
    
    // 获取文件管理者
    NSFileManager *mgr = [NSFileManager defaultManager];
    BOOL isDirectory;
    BOOL isExist = [mgr fileExistsAtPath:directoryPath isDirectory:&isDirectory];
    
    if (!isExist || !isDirectory) {
        // 抛异常
        // name:异常名称
        // reason:报错原因
        NSException *excp = [NSException exceptionWithName:@"pathError" reason:@"笨蛋 需要传入的是文件夹路径,并且路径要存在" userInfo:nil];
        [excp raise];
        
    }
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        // 获取文件夹下所有的子路径,包含子路径的子路径
        NSArray *subPaths = [mgr subpathsAtPath:directoryPath];
        
        NSInteger totalSize = 0;
        
        for (NSString *subPath in subPaths) {
            // 获取文件全路径
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            
            // 判断隐藏文件
            if ([filePath containsString:@".DS"]) continue;
            
            // 判断是否文件夹
            BOOL isDirectory;
            // 判断文件是否存在,并且判断是否是文件夹
            BOOL isExist = [mgr fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExist || isDirectory) continue;
            
            // 获取文件属性
            // attributesOfItemAtPath:只能获取文件尺寸,获取文件夹不对,
            NSDictionary *attr = [mgr attributesOfItemAtPath:filePath error:nil];
            
            // 获取文件尺寸
            NSInteger fileSize = [attr fileSize];
            
            totalSize += fileSize;
        }
        
        // 计算完成回调
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(totalSize);
            }
        });
        
        
        
    });
    
    
}
@end
