//
//  UIViewController+ZYDisplayCurrentVC.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/18.
//

#if DEBUG

#import "UIViewController+ZYDisplayCurrentVC.h"
#import "ZYDisplayCurrentVC.h"
#import <objc/runtime.h>

@implementation UIViewController (ZYDisplayCurrentVC)

- (void)myDealloc {
    NSLog(@">>>>>>>>>>%@ 已经释放了<<<<<<<<<<",[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject);
    [self myDealloc];
}

+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Method myViewWillAppear = class_getInstanceMethod(self, @selector(myViewWillAppear:));
        Method viewWillAppear = class_getInstanceMethod(self, @selector(viewWillAppear:));
        method_exchangeImplementations(viewWillAppear, myViewWillAppear);
        
        Method myDealloc = class_getInstanceMethod(self, @selector(myDealloc));
        Method dealloc = class_getInstanceMethod(self, NSSelectorFromString(@"dealloc"));
        method_exchangeImplementations(dealloc, myDealloc);
    });
}

- (BOOL)isPrivateVC {
    
    NSString * selfClass = NSStringFromClass(self.class);
    return [selfClass isEqualToString:@"UIAlertController"] ||
    [selfClass isEqualToString:@"_UIAlertControllerTextFieldViewController"] ||
    [selfClass isEqualToString:@"UIApplicationRotationFollowingController"] ||
    [selfClass isEqualToString:@"UIInputWindowController"];
}

- (void)myViewWillAppear:(BOOL)animated {
    if (![self isPrivateVC]) {
        UILabel * noteLabel = ZYDisplayCurrentVC.share.noteLabel;
        if (noteLabel.superview) {
            [noteLabel.superview bringSubviewToFront:noteLabel];
        }
        if (ZYDisplayCurrentVC.share.note == nil) {
            ZYDisplayCurrentVC.share.note = @"";
        }
        noteLabel.text = [NSString stringWithFormat:@"%@%@",ZYDisplayCurrentVC.share.note,[NSStringFromClass(self.class) componentsSeparatedByString:@"."].lastObject];
        [noteLabel sizeToFit];
    }
    [self myViewWillAppear:animated];
}

@end

#endif
