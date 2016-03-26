
// SPConst.m ：定义所有的全局常量

#import <UIKit/UIKit.h>

/** 请求路径 */
UIKIT_EXTERN NSString * const SPRequestURL = @"http://api.budejie.com/api/api_open.php";

/** 统一的间距 */
CGFloat const SPCommonMargin = 10;

/** 统一较小的间距 */
CGFloat const SPCommonSmallMargin = 5;

/** 导航栏最大的Y值 */
CGFloat const SPNavBarMaxY = 64;

/** UITabBar的高度 */
CGFloat const SPTabBarH = 49;

/** SPTitlesView的高度 */
CGFloat const SPTitlesViewH = 35;

/** 标签的高度 */
CGFloat const SPTagH = 25;

/** 帖子-文字的Y值 */
CGFloat const SPTopicTextY = 55;

/** 帖子-底部工具条的高度 */
CGFloat const SPTopicToolbarH = 35;

/** 帖子-最热评论-顶部的高度 */
CGFloat const SPTopicTopCmtTopH = 20;

/** 性别-男 */
NSString * const SPUserSexMale = @"m";

/** 性别-女 */
NSString * const SPUserSexFemale = @"f";

/**重复点击tabBarButton刷新事件*/
NSString * const SPTabBarButtonDidRpeatClickNotification = @"SPTabBarButtonDidRpeatClickNotification";

/**重复点击titleViewButton刷新事件*/
NSString * const SPTitleViewButtonDidRpeatClickNotification = @"SPTitleViewButtonDidRpeatClickNotification";

