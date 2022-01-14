//
//  UIViewController+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import "UIViewController+ZYExtension.h"

@implementation UIViewController (ZYExtension)

- (void)zy_navigation_pushViewController:(UIViewController *)viewController {
    [self.navigationController pushViewController:viewController animated:true];
}

- (void)zy_present_overFullScreenViewController:(UIViewController *)viewController {
    viewController.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:viewController animated:true completion:nil];
}

- (void)zy_pop_dismiss_viewController {
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:true];
    } else {
        [self dismissViewControllerAnimated:true completion:nil];
    }
}

+ (UIViewController *)currentViewController {
    UIWindow * window = [self currentWindow];
    return [self getCurrentViewControllerFrom:window.rootViewController];
}

+ (UIWindow *)currentWindow {
    UIWindow * window;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    } else {
        window = UIApplication.sharedApplication.delegate.window;
    }
    return window;
}

#pragma mark - private
+ (UIViewController *)getCurrentViewControllerFrom:(UIViewController *)rootVC {
    /// 视图是被presented出来的
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    
    UIViewController * currentVC;
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
