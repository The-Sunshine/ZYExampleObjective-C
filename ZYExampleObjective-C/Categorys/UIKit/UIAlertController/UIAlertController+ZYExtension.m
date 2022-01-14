//
//  UIAlertController+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/13.
//

#import "UIAlertController+ZYExtension.h"

@implementation UIAlertController (ZYExtension)

+ (void)newWithAlertControllerWithTitle:(nullable NSString *)title
                                message:(nullable NSString *)message
                         preferredStyle:(UIAlertControllerStyle)preferredStyle
                           alertActions:(NSArray<UIAlertAction *> *)alertActions
                         viewController:(UIViewController *)viewController {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    [alertActions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alert addAction:obj];
    }];
    [viewController presentViewController:alert animated:true completion:nil];
}

+ (void)newWithAlertControllerAddCancelActionWithTitle:(nullable NSString *)title
                                               message:(nullable NSString *)message
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                          alertActions:(NSArray<UIAlertAction *> *)alertActions
                                        viewController:(UIViewController *)viewController {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:preferredStyle];
    [alertActions enumerateObjectsUsingBlock:^(UIAlertAction * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [alert addAction:obj];
    }];
    UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cancel];
    [viewController presentViewController:alert animated:true completion:nil];
}

+ (UIAlertAction *)newWithAlertActionWithTitle:(nullable NSString *)title
                                         style:(UIAlertActionStyle)style
                                       handler:(void (^ __nullable)(UIAlertAction *action))handler {
    return [UIAlertAction actionWithTitle:title style:style handler:handler];
}

+ (UIAlertAction *)newWithAlertActionWithTitle:(nullable NSString *)title
                                         style:(UIAlertActionStyle)style
                               actionTextColor:(UIColor *)actionTextColor
                                       handler:(void (^ __nullable)(UIAlertAction *action))handler {
    UIAlertAction * action = [UIAlertAction actionWithTitle:title style:style handler:handler];
    [action setValue:actionTextColor forKey:@"_titleTextColor"];
    return action;
}

@end
