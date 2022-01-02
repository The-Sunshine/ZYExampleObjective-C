//
//  UIButton+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef UIButton *_Nullable(^ZYButtonTitleBlock)(NSString *title);
typedef UIButton *_Nullable(^ZYButtonTitleColorBlock)(UIColor *titleColor);
typedef UIButton *_Nullable(^ZYButtonImageBlock)(UIImage *image);

@interface UIButton (ZYExtension)

/// 链式编程
/*
button.setTitleStateNormal(@"1")
.setTitleStateSelected(@"2")
.setTitleColorStateNormal(UIColor.redColor)
.setTitleColorStateSelected(UIColor.grayColor);
.setImageStateNormal(ZYImageNamed(@"3"))
.setImageStateSelected(ZYImageNamed(@"4"))*/

- (ZYButtonTitleBlock)setTitleStateNormal;

- (ZYButtonTitleBlock)setTitleStateSelected;

- (ZYButtonTitleColorBlock)setTitleColorStateNormal;

- (ZYButtonTitleColorBlock)setTitleColorStateSelected;

- (ZYButtonImageBlock)setImageStateNormal;

- (ZYButtonImageBlock)setImageStateSelected;


@end

NS_ASSUME_NONNULL_END
