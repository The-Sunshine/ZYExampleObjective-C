//
//  UILabel+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (ZYExtension)

/// 获取高度
- (CGFloat)zy_getHeightWithWidth:(CGFloat)width;

/// 获取宽度 仅限label为一行
- (CGFloat)zy_getWidthWithHeight:(CGFloat)height;


@end

NS_ASSUME_NONNULL_END
