//
//  ZYBaseViewController.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYBaseViewController.h"

@interface ZYBaseViewController ()

@end

@implementation ZYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = UIColor.whiteColor;
    [self setEdgesForExtendedLayout:UIRectEdgeNone];

    [self initUI];
    [self loadData];
}

- (void)initNavigationBackItem {
    if (self.navigationController.childViewControllers.count > 1) {
        /// 统一返回按钮
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.bounds = CGRectMake(0, 0, 40, 40);
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
        [button addTarget:self action:@selector(navigationBackClick) forControlEvents:UIControlEventTouchUpInside];

        UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
        self.navigationItem.leftBarButtonItem = backItem;
    }
}

- (void)initUI {
    
}

- (void)loadData {
    
}

- (void)navigationBackClick {
    [self.navigationController popViewControllerAnimated:YES];
}


@end
