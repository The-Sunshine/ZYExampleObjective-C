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
+ (float)systemVersionFloat;

/// app 版本号
+ (NSString *)app_version;

/// app build 版本号
+ (NSString *)app_buildVersion;

/// 应用名称
+ (NSString *)app_name;

/// 当前系统语言
+ (NSString *)app_currentLanguage;

/// 模拟器
+ (BOOL)isSimulator;

/// 判断iphone
+ (BOOL)isIphone;

/// 判断ipad
+ (BOOL)isIpad;

@end

NS_ASSUME_NONNULL_END
