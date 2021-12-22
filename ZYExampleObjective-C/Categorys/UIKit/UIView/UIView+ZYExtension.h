//
//  UIView+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/// 渐变色
typedef NS_ENUM(NSUInteger, ZYGradientDirectionType) {
    ZYGradientTypeDirectionLevel,               //AC - BD
    ZYGradientTypeDirectionVertical,            //AB - CD
    ZYGradientTypeDirectionUpwardDiagonalLine,  //A - D
    ZYGradientTypeDirectionDownDiagonalLine,    //C - B
};
//      A         B
//       _________
//      |         |
//      |         |
//       ---------
//      C         D

@interface UIView (ZYExtension)


/// 手势点击
/// @param target id
/// @param action SEL
- (void)addTapGestureRecognizerWithTarget:(id)target
                                   action:(SEL)action;

/// 渐变色
/// @param beginColor UIColor
/// @param endColor UIColor
/// @param type ZYGradientDirectionType方向
- (void)addGradientWithBeginColor:(UIColor *)beginColor
                         endColor:(UIColor *)endColor
                  andGradientType:(ZYGradientDirectionType)type;

/// 圆角
/// @param cornerRadius CGFloat
- (void)layerCornerRadius:(CGFloat)cornerRadius;

/// 边框颜色 & 边框宽度
/// @param borderColor UIColor
/// @param borderWidth CGFloat
- (void)layerBorderColor:(UIColor *)borderColor
             borderWidth:(CGFloat)borderWidth;




@end

NS_ASSUME_NONNULL_END
