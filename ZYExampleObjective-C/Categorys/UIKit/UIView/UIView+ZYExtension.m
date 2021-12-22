//
//  UIView+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/14.
//

#import "UIView+ZYExtension.h"

@implementation UIView (ZYExtension)

- (void)addTapGestureRecognizerWithTarget:(id)target
                                   action:(SEL)action {
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];
}

- (void)addGradientWithBeginColor:(UIColor *)beginColor
                         endColor:(UIColor *)endColor
                  andGradientType:(ZYGradientDirectionType)type {
    CAGradientLayer *gradient = [CAGradientLayer layer];
    [self layoutIfNeeded];
    gradient.frame = self.bounds;
    gradient.colors = @[(id)beginColor.CGColor,(id)endColor.CGColor];
    if (type == ZYGradientTypeDirectionLevel){
        gradient.startPoint = CGPointMake(0, 1);
        gradient.endPoint = CGPointMake(1, 1);
    } else if (type == ZYGradientTypeDirectionVertical){
        gradient.startPoint = CGPointMake(0, 0);
        gradient.endPoint = CGPointMake(0, 1);
    } else if (type == ZYGradientTypeDirectionDownDiagonalLine){
        gradient.startPoint = CGPointMake(0, 1);
        gradient.endPoint = CGPointMake(1, 0);
    } else if (type == ZYGradientTypeDirectionUpwardDiagonalLine){
        gradient.startPoint = CGPointMake(0, 0);
        gradient.endPoint = CGPointMake(1, 1);
    }
    [self.layer addSublayer:gradient];
}

- (void)layerCornerRadius:(CGFloat)cornerRadius {
    self.clipsToBounds = true;
    self.layer.cornerRadius = cornerRadius;
}

- (void)layerBorderColor:(UIColor *)borderColor
             borderWidth:(CGFloat)borderWidth {
    self.layer.borderColor = borderColor.CGColor;
    self.layer.borderWidth = borderWidth;
}


@end
