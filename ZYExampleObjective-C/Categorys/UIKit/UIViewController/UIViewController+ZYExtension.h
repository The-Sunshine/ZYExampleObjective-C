//
//  UIViewController+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (ZYExtension)

/// push跳转
/// @param viewController UIViewController
- (void)zy_navigation_pushViewController:(UIViewController *)viewController;

/// present跳转
/// @param viewController UIViewController
- (void)zy_present_overFullScreenViewController:(UIViewController *)viewController;

/// pop_dismiss返回
- (void)zy_pop_dismiss_viewController;

/// 获取当前屏幕显示的viewcontroller
+ (UIViewController *)currentViewController;

/// 获取当前屏幕显示的Window
+ (UIWindow *)currentWindow;


@end

NS_ASSUME_NONNULL_END
