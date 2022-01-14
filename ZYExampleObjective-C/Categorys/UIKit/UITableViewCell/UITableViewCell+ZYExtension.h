//
//  UITableViewCell+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITableViewCell (ZYExtension)

/// 快速在 cellForRowAtIndexPath 中创建cell
/// @param tableView UITableView
/// @param identifier NSString
+ (UITableViewCell *)newWithTableView:(UITableView *)tableView
    dequeueReusableCellWithIdentifier:(NSString *)identifier;

/// 快速在 cellForRowAtIndexPath 中创建cell
/// @param tableView UITableView
/// @param identifier NSString
/// @param style UITableViewCellStyle
+ (UITableViewCell *)newWithTableView:(UITableView *)tableView
    dequeueReusableCellWithIdentifier:(NSString *)identifier
                                style:(UITableViewCellStyle)style;


@end

NS_ASSUME_NONNULL_END
