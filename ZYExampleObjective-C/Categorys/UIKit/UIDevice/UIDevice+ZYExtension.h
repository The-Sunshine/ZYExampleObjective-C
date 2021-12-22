//
//  UIDevice+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (ZYExtension)

/// 模拟器
- (BOOL)isSimulator;

/// 判断iphoneX
- (BOOL)isIphoneX;

@end

NS_ASSUME_NONNULL_END
