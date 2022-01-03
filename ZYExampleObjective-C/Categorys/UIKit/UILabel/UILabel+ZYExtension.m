//
//  UILabel+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/3.
//

#import "UILabel+ZYExtension.h"

@implementation UILabel (ZYExtension)

- (CGFloat)zy_getHeightWithWidth:(CGFloat)width {
    return [self sizeThatFits:CGSizeMake(width, CGFLOAT_MAX)].height;
}

- (CGFloat)zy_getWidthWithHeight:(CGFloat)height {
    return [self sizeThatFits:CGSizeMake(CGFLOAT_MAX, height)].width;
}


@end
