//
//  ZYRefreshHeader.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYRefreshHeader.h"

@implementation ZYRefreshHeader

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUI];
}

- (void)setupUI {
    self.automaticallyChangeAlpha = YES;
}

// MJBug fix
- (void)endRefreshing {
    [super endRefreshing];
    self.state = MJRefreshStateIdle;
}

- (void)layoutSubviews {
    [super layoutSubviews];
}

@end
