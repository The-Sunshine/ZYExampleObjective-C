//
//  UIDevice+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (ZYExtension)

/// 系统版本
+ (float)systemVersion;

/// 模拟器
+ (BOOL)isSimulator;

/// 判断iphoneX
+ (BOOL)isIphoneX;

/// 判断iphone
+ (BOOL)isIphone;

/// 判断ipad
+ (BOOL)isIpad;

@end

NS_ASSUME_NONNULL_END
