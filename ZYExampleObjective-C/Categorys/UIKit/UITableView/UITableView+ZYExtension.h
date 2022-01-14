//
//  UITableView+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/3.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableView (ZYExtension)

/// 快速创建tableview group类型
/// @param target id类型 用于绑定delegate dataSource
+ (UITableView *)newTableViewGroupedWithTarget:(id)target;

/// 移除cell 分割线
- (void)removeCellLine;

@end

NS_ASSUME_NONNULL_END
