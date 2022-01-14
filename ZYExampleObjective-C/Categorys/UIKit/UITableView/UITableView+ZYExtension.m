//
//  UITableView+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/3.
//

#import "UITableView+ZYExtension.h"

@implementation UITableView (ZYExtension)

+ (UITableView *)newTableViewGroupedWithTarget:(id)target {
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    tableView.delegate = target;
    tableView.dataSource = target;
    return tableView;
}

- (void)removeCellLine {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}


@end
