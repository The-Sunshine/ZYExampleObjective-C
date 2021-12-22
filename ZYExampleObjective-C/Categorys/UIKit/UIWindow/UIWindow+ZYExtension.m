//
//  UIWindow+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/22.
//

#import "UIWindow+ZYExtension.h"

@implementation UIWindow (ZYExtension)

/// 获取当前屏幕显示的Window
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

@end
