//
//  UITableViewCell+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/13.
//

#import "UITableViewCell+ZYExtension.h"

@implementation UITableViewCell (ZYExtension)

+ (UITableViewCell *)newWithTableView:(UITableView *)tableView
    dequeueReusableCellWithIdentifier:(NSString *)identifier {
    return [self newWithTableView:tableView
dequeueReusableCellWithIdentifier:identifier
                            style:UITableViewCellStyleDefault];
}

+ (UITableViewCell *)newWithTableView:(UITableView *)tableView
    dequeueReusableCellWithIdentifier:(NSString *)identifier
                                style:(UITableViewCellStyle)style {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:style reuseIdentifier:identifier];
    }
    return cell;
}


@end
