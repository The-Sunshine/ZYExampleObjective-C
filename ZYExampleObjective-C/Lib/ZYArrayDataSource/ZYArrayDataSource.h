//
//  ZYArrayDataSource.h
//
//  Created by zy on 10/05/2019.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZYCellConfigureBlock)(id cell, id model);

@interface ZYArrayDataSource : NSObject <UITableViewDataSource,UICollectionViewDataSource>

/**
 初始化dataSource协议
 */
- (id)initWithCellIdentifier:(NSString *)identifier
          configureCellBlock:(ZYCellConfigureBlock)configureBlock;


/**
 取出当前cell数据模型
 */
- (id)itemAtIndexPath:(NSIndexPath *)indexPath;


/**
 刷新数据 重新赋值数组
 */
- (void)reloadItems:(NSArray *)items ;


/**
 添加数组 上拉加载使用
 */
- (void)addItems:(NSArray *)items ;

@end

NS_ASSUME_NONNULL_END
