//
//  UIBarButtonItem+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/14.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIBarButtonItem (ZYExtension)


/// UIBarButtonItem Image
/// @param image UIImage
/// @param selectedImage UIImage
/// @param target id
/// @param action SEL
+ (UIBarButtonItem *)zy_barButtonItemWithImage:(UIImage *)image
                                 selectedImage:(UIImage *)selectedImage
                                        target:(id)target
                                        action:(SEL)action;

/// UIBarButtonItem Title
/// @param title NSString
/// @param titleColor UIColor
/// @param titleFont UIFont
/// @param target id
/// @param action SEL
+ (UIBarButtonItem *)zy_barButtonItemWithTitle:(NSString *)title
                                    titleColor:(UIColor *)titleColor
                                     titleFont:(UIFont *)titleFont
                                        target:(id)target
                                        action:(SEL)action;

@end

NS_ASSUME_NONNULL_END
