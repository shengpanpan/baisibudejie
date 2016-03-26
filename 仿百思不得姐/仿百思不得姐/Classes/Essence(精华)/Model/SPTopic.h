//
//  SPTopic.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/17.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <Foundation/Foundation.h>
//位移枚举,网络请求时候需要判断请求cell的类型，cell集成时候需要判断子cell的类型
typedef NS_ENUM(NSUInteger, SPTopicType) {
    //1为全部，10为图片，29为段子，31为音频，41为视频，默认为1
    /*全部*/
    SPTopicTypeAll = 1,
    /*图片*/
    SPTopicTypePicture = 10,
    /*段子*/
    SPTopicTypeJoke = 29,
    /*音频*/
    SPTopicTypeVoice = 31,
    /*视频*/
    SPTopicTypeVideo = 41
};

@interface SPTopic : NSObject
/** 用户的名字 */
@property (nonatomic, copy) NSString *name;
/** 用户的头像 */
@property (nonatomic, copy) NSString *profile_image;
/** 帖子的文字内容 */
@property (nonatomic, copy) NSString *text;
/** 帖子审核通过的时间 */
@property (nonatomic, copy) NSString *created_at;
/** 顶数量 */
@property (nonatomic, assign) NSInteger ding;
/** 踩数量 */
@property (nonatomic, assign) NSInteger cai;
/** 转发\分享数量 */
@property (nonatomic, assign) NSInteger repost;
/** 评论数量 */
@property (nonatomic, assign) NSInteger comment;


/** 宽度(像素) */
@property (nonatomic, assign) NSInteger width;
/** 高度(像素) */
@property (nonatomic, assign) NSInteger height;
/** 小图 */
@property (nonatomic, copy) NSString *image0;
/** 中图 */
@property (nonatomic, copy) NSString *image2;
/** 大图 */
@property (nonatomic, copy) NSString *image1;

/** 音频时长 */
@property (nonatomic, assign) NSInteger voicetime;
/** 视频时长 */
@property (nonatomic, assign) NSInteger videotime;
/** 音频\视频的播放次数 */
@property (nonatomic, assign) NSInteger playcount;

/********************额外增加的属性*************************/
/** 帖子的类型 10为图片 29为段子 31为音频 41为视频 */
@property (nonatomic, assign) NSInteger type;

/** 最热评论 */
@property (nonatomic, strong) NSArray *top_cmt;

/**cell的高度，根据当前的模型计算出cell的高度*/
@property (nonatomic, assign) CGFloat cellHeight;

/**设置中间视图的frame*/
@property (nonatomic, assign) CGRect contentFrame;
@end
