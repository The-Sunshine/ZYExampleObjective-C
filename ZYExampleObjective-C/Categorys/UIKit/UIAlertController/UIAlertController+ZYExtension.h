//
//  UIAlertController+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIAlertController (ZYExtension)

/// 快速创建 alertController
/// @param title NSString
/// @param message NSString
/// @param preferredStyle UIAlertControllerStyle
/// @param alertActions NSArray<UIAlertAction *>
/// @param viewController UIViewController
+ (void)newWithAlertControllerWithTitle:(nullable NSString *)title
                                message:(nullable NSString *)message
                         preferredStyle:(UIAlertControllerStyle)preferredStyle
                           alertActions:(NSArray<UIAlertAction *> *)alertActions
                         viewController:(UIViewController *)viewController;

/// 快速创建 alertController 附带cancelAction
/// @param title NSString
/// @param message NSString
/// @param preferredStyle UIAlertControllerStyle
/// @param alertActions NSArray<UIAlertAction *>
/// @param viewController UIViewController
+ (void)newWithAlertControllerAddCancelActionWithTitle:(nullable NSString *)title
                                               message:(nullable NSString *)message
                                        preferredStyle:(UIAlertControllerStyle)preferredStyle
                                          alertActions:(NSArray<UIAlertAction *> *)alertActions
                                        viewController:(UIViewController *)viewController;

/// 快速创建 alertAction
/// @param title NSString
/// @param style UIAlertActionStyle
/// @param handler (void (^ __nullable)(UIAlertAction *action))
+ (UIAlertAction *)newWithAlertActionWithTitle:(nullable NSString *)title
                                         style:(UIAlertActionStyle)style
                                       handler:(void (^ __nullable)(UIAlertAction *action))handler;


/// 快速创建 alertAction
/// @param title NSString
/// @param style UIAlertActionStyle
/// @param actionTextColor UIColor
/// @param handler (void (^ __nullable)(UIAlertAction *action))
+ (UIAlertAction *)newWithAlertActionWithTitle:(nullable NSString *)title
                                         style:(UIAlertActionStyle)style
                               actionTextColor:(UIColor *)actionTextColor
                                       handler:(void (^ __nullable)(UIAlertAction *action))handler;



@end

NS_ASSUME_NONNULL_END
