//
//  UITableView+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/3.
//

#import "UITableView+ZYExtension.h"

@implementation UITableView (ZYExtension)

- (void)removeCellLine {
    self.separatorStyle = UITableViewCellSeparatorStyleNone;
}

@end
