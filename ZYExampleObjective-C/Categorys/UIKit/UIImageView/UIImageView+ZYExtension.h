//
//  UIImageView+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/2.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ZYExtension)

/// 快速添加图片
/// @param imageNamed NSString
- (void)zy_imageNamed:(NSString *)imageNamed;

@end

NS_ASSUME_NONNULL_END
