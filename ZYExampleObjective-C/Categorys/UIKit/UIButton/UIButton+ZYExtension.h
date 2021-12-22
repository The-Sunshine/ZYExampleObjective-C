//
//  UIButton+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIButton *_Nullable(^ButtonTitleBlock)(NSString *title);
typedef UIButton *_Nullable(^ButtonTitleColorBlock)(UIColor *titleColor);
typedef UIButton *_Nullable(^ButtonImageBlock)(UIImage *image);

@interface UIButton (ZYExtension)

/// 链式编程
/*
button.setTitleStateNormal(@"1")
.setTitleStateSelected(@"2")
.setTitleColorStateNormal(UIColor.redColor)
.setTitleColorStateSelected(UIColor.grayColor);
.setImageStateNormal(ZYImageNamed(@"3"))
.setImageStateSelected(ZYImageNamed(@"4"))*/

- (ButtonTitleBlock)setTitleStateNormal;

- (ButtonTitleBlock)setTitleStateSelected;

- (ButtonTitleColorBlock)setTitleColorStateNormal;

- (ButtonTitleColorBlock)setTitleColorStateSelected;

- (ButtonImageBlock)setImageStateNormal;

- (ButtonImageBlock)setImageStateSelected;


@end

NS_ASSUME_NONNULL_END
