//
//  UIViewController+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import "UIViewController+ZYExtension.h"
#import "UIWindow+ZYExtension.h"

@implementation UIViewController (ZYExtension)

- (void)zy_navigation_pushViewController:(UIViewController *)viewController {
    [self.navigationController pushViewController:viewController animated:true];
}

+ (UIViewController *)currentViewController {
    
    UIWindow * window = [UIWindow currentWindow];
    return [self getCurrentViewControllerFrom:window.rootViewController];
}

+ (UIViewController *)getCurrentViewControllerFrom:(UIViewController *)rootVC {
    /// 视图是被presented出来的
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    
    UIViewController *currentVC;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentViewControllerFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentViewControllerFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

@end
