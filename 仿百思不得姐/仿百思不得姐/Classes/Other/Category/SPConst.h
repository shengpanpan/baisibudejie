//
//  SPConst.h
//  仿百思不得姐
//
//  Created by 风 on 16/3/13.
//  Copyright © 2016年 panda.sheng. All rights reserved.
//

#import <UIKit/UIKit.h>

/** 请求路径 */
UIKIT_EXTERN NSString * const SPRequestURL;

/** 统一的间距 */
UIKIT_EXTERN CGFloat const SPCommonMargin;

/** 统一较小的间距 */
UIKIT_EXTERN CGFloat const SPCommonSmallMargin;

/** 导航栏最大的Y值 */
UIKIT_EXTERN CGFloat const SPNavBarMaxY;

/** UITabBar的高度 */
UIKIT_EXTERN CGFloat const SPTabBarH;

/** SPTitlesView的高度 */
UIKIT_EXTERN CGFloat const SPTitlesViewH;

/** 标签的高度 */
UIKIT_EXTERN CGFloat const SPTagH;

/** 帖子-文字的Y值 */
UIKIT_EXTERN CGFloat const SPTopicTextY;

/** 帖子-底部工具条的高度 */
UIKIT_EXTERN CGFloat const SPTopicToolbarH;

/** 帖子-最热评论-顶部的高度 */
UIKIT_EXTERN CGFloat const SPTopicTopCmtTopH;

/** 性别-男 */
UIKIT_EXTERN NSString * const SPUserSexMale;

/** 性别-女 */
UIKIT_EXTERN NSString * const SPUserSexFemale;

/**重复点击tabBarButton刷新事件*/
UIKIT_EXTERN NSString * const SPTabBarButtonDidRpeatClickNotification;

/**重复点击titleViewButton刷新事件*/
UIKIT_EXTERN NSString * const SPTitleViewButtonDidRpeatClickNotification;