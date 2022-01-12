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

/// 获取当前屏幕显示的viewcontroller
+ (UIViewController *)currentViewController;


@end

NS_ASSUME_NONNULL_END
