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
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0.1)];
    tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0.1)];
    return tableView;
}

- (void)removeCellLine {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}


@end
