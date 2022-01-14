//
//  UITextField+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (ZYExtension)

/// 添加输入监听
/// @param target id
/// @param action SEL
- (void)addMonitorEditingChangedWithTarget:(nullable id)target action:(SEL)action;



@end

NS_ASSUME_NONNULL_END
