//
//  ZYRefreshFooter.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYRefreshFooter.h"

@implementation ZYRefreshFooter


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUIOnce];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    [self setupUIOnce];
}

- (void)setupUIOnce {
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
