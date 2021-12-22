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

- (void)initUI {
    
}

- (void)loadData {
    
}


@end
