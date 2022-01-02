//
//  ZYBaseTableViewCell.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/30.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYBaseTableViewCell : UITableViewCell

@property (nonatomic, strong) id model;

- (void)initUI;

@end

NS_ASSUME_NONNULL_END
