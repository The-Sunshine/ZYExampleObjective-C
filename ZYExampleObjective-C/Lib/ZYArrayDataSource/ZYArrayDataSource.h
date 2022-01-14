//
//  ZYArrayDataSource.h
//
//  Created by zy on 10/05/2019.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^ZYCellConfigureBlock)(id cell,NSIndexPath * indexPath);
typedef void(^ZYCollectionReusableViewBlock)(UICollectionReusableView * view,NSIndexPath * indexPath);

/// 使用方式
/**
 @property (nonatomic,strong) ZYArrayDataSource * dataSource;

 ZYArrayDataSource * dataSource = [ZYArrayDataSource newWithReuseIdentifier:<#identifier#> configureBlock:^(id  _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        <#code#>
 }];
 
 /// collection header
 [dataSource initWithCollectionHeaderReuseIdentifier:<#identifier#> reusableViewBlock:^(UICollectionReusableView * _Nonnull view, NSIndexPath * _Nonnull indexPath) {
        <#code#>
 }];
 
 /// collection footer
 [dataSource initWithCollectionFooterReuseIdentifier:<#identifier#> reusableViewBlock:^(UICollectionReusableView * _Nonnull view, NSIndexPath * _Nonnull indexPath) {
        <#code#>
 }];
 
 tableView.dataSource = dataSource;
 _dataSource = dataSource;
 [dataSource reloadTableCollectionView:tableView numberOfRows:self.<#rowsArray#>.count];
 [dataSource reloadTableCollectionView:tableView numberOfSections:self.<#sectionsArray#>.count numberOfRows:self.<#rowsArray#>.count];
 
 */

@interface ZYArrayDataSource : NSObject <UITableViewDataSource,UICollectionViewDataSource>

/// 注册cell 绑定cellForRowAtIndexPath 数据处理
/// @param identifier NSString
/// @param configureBlock (id cell,NSIndexPath * indexPath)
+ (ZYArrayDataSource *)newWithReuseIdentifier:(NSString *)identifier
                               configureBlock:(ZYCellConfigureBlock)configureBlock;

/// 注册collectionView header 绑定viewForSupplementaryElementOfKind 数据处理
/// @param identifier NSString
/// @param block (UICollectionReusableView * view,NSIndexPath * indexPath)
- (void)initWithCollectionHeaderReuseIdentifier:(NSString *)identifier
                              reusableViewBlock:(ZYCollectionReusableViewBlock)block;

/// 注册collectionView footer 绑定viewForSupplementaryElementOfKind 数据处理
/// @param identifier NSString
/// @param block (UICollectionReusableView * view,NSIndexPath * indexPath)
- (void)initWithCollectionFooterReuseIdentifier:(NSString *)identifier
                              reusableViewBlock:(ZYCollectionReusableViewBlock)block;

/// 设置cell rows行数 并刷新表格
/// @param scrollView UITableView || UICollectionView
/// @param rows NSInteger
- (void)reloadTableCollectionView:(UIScrollView *)scrollView
                     numberOfRows:(NSInteger)rows;

/// 设置cell sections组数 rows行数 并刷新表格
/// @param scrollView UITableView || UICollectionView
/// @param sections NSInteger
/// @param rows NSInteger
- (void)reloadTableCollectionView:(UIScrollView *)scrollView
                 numberOfSections:(NSInteger)sections
                     numberOfRows:(NSInteger)rows;


@end

NS_ASSUME_NONNULL_END
