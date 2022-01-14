//
//  UITextField+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/14.
//

#import "UITextField+ZYExtension.h"

@implementation UITextField (ZYExtension)

- (void)addMonitorEditingChangedWithTarget:(nullable id)target action:(SEL)action {
    [self addTarget:target action:action forControlEvents:UIControlEventEditingChanged];
}

@end
