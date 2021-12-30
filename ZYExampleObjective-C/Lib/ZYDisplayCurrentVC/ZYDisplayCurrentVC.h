//
//  ZYDisplayCurrentVC.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/18.
//

#if DEBUG

#import <UIKit/UIKit.h>

@interface ZYDisplayCurrentVC : NSObject

+ (instancetype)share;

/// 自定义要显示的信息
@property (nonatomic, copy) NSString * note;

/// 显示信息标签
@property (nonatomic, strong, readonly) UILabel * noteLabel;

@end

#endif
