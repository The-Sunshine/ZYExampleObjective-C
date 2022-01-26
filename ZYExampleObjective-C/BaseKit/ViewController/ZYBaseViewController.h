//
//  ZYBaseViewController.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import <UIKit/UIKit.h>
#import "ZYVender.h"


NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseViewController : UIViewController


/// 快捷创建返回按钮，需自定义返回事件时使用
/// 默认已在自定义UINavigationController中创建
- (void)initNavigationBackItem;

/// 自定义返回事件
- (void)navigationBackClick;

- (void)initUI;

- (void)loadData;


@end

NS_ASSUME_NONNULL_END
