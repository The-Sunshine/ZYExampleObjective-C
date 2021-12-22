//
//  UIDevice+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import "UIDevice+ZYExtension.h"

@implementation UIDevice (ZYExtension)

- (BOOL)isSimulator {
    return (TARGET_IPHONE_SIMULATOR == 1 &&
            TARGET_OS_IPHONE == 1);
}

- (BOOL)isIphoneX {
    return ([UIScreen mainScreen].bounds.size.width >= 375.0f &&
            [UIScreen mainScreen].bounds.size.height >= 812.0f);
}

@end
