//
//  SPTopic.m
//  仿百思不得姐
//
//  Created by 风 on 16/3/17.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import "SPTopic.h"
#import "NSCalendar+SPCalendar.h"
#import "NSDate+SPExtension.h"

@implementation SPTopic

static  NSDateFormatter *dateFormatter;
static   NSCalendar *calendar;

#pragma 一次性初始化对象
+ (void)initialize{
    //1.设置时间格式
   dateFormatter = [[NSDateFormatter alloc] init];
    //2.创建日历
   calendar= [NSCalendar sp_Calendar];
}

#pragma 重写created_at方法,在里面改写时间的格式
- (NSString *)created_at{
 
    dateFormatter.dateFormat = @"yyyy-MM-dd HH-mm-ss";
    //获取发帖时间
    NSDate *createAtDate = [dateFormatter dateFromString:_created_at];
    
    if ([createAtDate isThisYear]) {//今年
        if ([createAtDate isToday]) {//今天
            
            //获取改时间和现在事件的components
            NSDateComponents *components = [createAtDate compareToNowDate];
            //间隔大于1小时
            if (components.hour < -1) {
                return [NSString stringWithFormat:@"%zd小时前", labs(components.hour)];
            }else if(components.minute < -1){  //间隔大于等于1分钟
                return [NSString stringWithFormat:@"%zd分钟前",labs(components.minute)];
            }else{ //间隔小雨1分钟
                return @"刚刚";
            }
           
        }else if ([createAtDate isYesterday]) {//昨天
            
            //设置时间格式、
            dateFormatter.dateFormat = @"昨天  HH:mm:ss";
            return [dateFormatter stringFromDate:createAtDate];
            
        } else {//其他天
            
            dateFormatter.dateFormat = @"MM-dd HH:mm:ss";
            return [dateFormatter stringFromDate:createAtDate];
            
        }
        
    }else {//非今年
        
        return _created_at;
        
    }

}

#pragma 重写cellHeight方法，获得当前cell的高度
- (CGFloat)cellHeight{
    
    //如果cellHeight不为0,不需要进行计算
    if (_cellHeight) return _cellHeight;
    //1.说说上端的高度
    _cellHeight += 55;
    
    //2.说说的高度
    CGSize textSize = [self.text boundingRectWithSize:CGSizeMake(SPScreenW - 2*SPCommonMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size;
    _cellHeight += textSize.height + SPCommonMargin;
    
    //3.中间视图的高度
    if (self.type != SPTopicTypeJoke) {//视频，音频，图片 可以统一考虑图片设置问题imageW/imageH = uW/Wh
        CGFloat contentW = SPScreenW - 2*SPCommonMargin;
        CGFloat contentH = contentW * self.height/self.width;
        CGFloat contentX = SPCommonMargin;
        CGFloat contentY = _cellHeight;
        
        self.contentFrame = CGRectMake(contentX, contentY, contentW, contentH);
        
        _cellHeight += contentH + SPCommonMargin;
    }
    //4.最热评论的高度
    if (self.top_cmt.count) {//有最热评论
        _cellHeight += 25;
        //取出最热评论字典
        NSDictionary *cmtDic = self.top_cmt.firstObject;
        NSString *content = cmtDic[@"content"];
        if (content.length == 0) {
            content = @"语音评论";
        }
        //获取名称和内容
        NSString *username = cmtDic[@"user"][@"username"];
        NSString *mtText = [NSString stringWithFormat:@"%@ : %@",username,content];
        _cellHeight += [mtText boundingRectWithSize:CGSizeMake(SPScreenW - 2*SPCommonMargin, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont systemFontOfSize:15]} context:nil].size.height +SPCommonMargin;
    }
    
    //5.工具条的高度
    _cellHeight += 35 + SPCommonMargin;
    

    return _cellHeight;
}
@end
