//
//  ZYTableViewController.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseTableVC : ZYBaseViewController<UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) UITableView * tableView;

- (instancetype)initWithStyle:(UITableViewStyle)style;

// 这个代理方法如果子类实现了, 必须调用super
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView NS_REQUIRES_SUPER;

- (void)loadMore:(BOOL)isMore;

- (void)endRefreshing;

@end

NS_ASSUME_NONNULL_END
