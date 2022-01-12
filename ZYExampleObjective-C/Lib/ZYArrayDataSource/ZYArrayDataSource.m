//
//  ZYArrayDataSource.m
//
//  Created by zy on 10/05/2019.
//

#import "ZYArrayDataSource.h"

@interface ZYArrayDataSource ()

@property (nonatomic,copy) NSString * identifier;

@property (nonatomic,copy) ZYCellConfigureBlock configureBlock;

@property (nonatomic,strong) NSMutableArray * items;

@end

@implementation ZYArrayDataSource

- (id)initWithCellIdentifier:(NSString *)identifier
          configureCellBlock:(ZYCellConfigureBlock)configureBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.configureBlock = [configureBlock copy];
        self.items = [NSMutableArray array];
    }
    return self;
}

- (instancetype)init {
    return nil;
}

- (void)reloadItems:(NSArray *)items {
    [self.items removeAllObjects];
    [self.items addObjectsFromArray:items];
}

- (void)addItems:(NSArray *)items {
    [self.items addObjectsFromArray:items];
}

- (id)itemAtIndexPath:(NSIndexPath *)indexPath {
    return self.items[indexPath.row];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.identifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifier forIndexPath:indexPath];
    id item = [self itemAtIndexPath:indexPath];
    self.configureBlock(cell, item);
    return cell;
}


@end
