//
//  UIBarButtonItem+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/14.
//

#import "UIBarButtonItem+ZYExtension.h"

@implementation UIBarButtonItem (ZYExtension)

+ (UIBarButtonItem *)barButtonItemWithImage:(UIImage *)image
                              selectedImage:(UIImage *)selectedImage
                                     target:(id)target
                                     action:(SEL)action {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:image forState:UIControlStateNormal];
    [button setImage:selectedImage forState:UIControlStateSelected];
    if (action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [button sizeToFit];

    if (button.bounds.size.width < 40 ||
        button.bounds.size.height > 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)barButtonItemWithTitle:(NSString *)title
                                 titleColor:(UIColor *)titleColor
                                  titleFont:(UIFont *)titleFont
                                     target:(id)target
                                     action:(SEL)action {
    
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    [button setTitleColor:titleColor forState:UIControlStateNormal];
    button.titleLabel.font = titleFont;
    if (action) {
        [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    [button sizeToFit];
    
    if (button.bounds.size.width < 40 ||
        button.bounds.size.height > 40) {
        CGFloat width = 40 / button.bounds.size.height * button.bounds.size.width;
        button.bounds = CGRectMake(0, 0, width, 40);
    }
    return [[UIBarButtonItem alloc] initWithCustomView:button];

}

@end
