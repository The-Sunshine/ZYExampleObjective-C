//
//  ZYArrayDataSource.m
//
//  Created by zy on 10/05/2019.
//

#import "ZYArrayDataSource.h"

@interface ZYArrayDataSource ()

@property (nonatomic,copy) NSString * identifier;

@property (nonatomic,copy) NSString * headerIdentifier;

@property (nonatomic,copy) NSString * footerIdentifier;

@property (nonatomic,copy) ZYCellConfigureBlock configureBlock;

@property (nonatomic,copy) ZYCollectionReusableViewBlock headerViewBlock;

@property (nonatomic,copy) ZYCollectionReusableViewBlock footerViewBlock;

@property (nonatomic,assign) NSInteger rows;

@property (nonatomic,assign) NSInteger sections;

@end

@implementation ZYArrayDataSource

+ (ZYArrayDataSource *)newWithReuseIdentifier:(NSString *)identifier
                               configureBlock:(ZYCellConfigureBlock)configureBlock {
    return [[self alloc] initWithReuseIdentifier:identifier configureBlock:configureBlock];
}

- (instancetype)initWithReuseIdentifier:(NSString *)identifier
               configureBlock:(ZYCellConfigureBlock)configureBlock {
    self = [super init];
    if (self) {
        self.identifier = identifier;
        self.configureBlock = [configureBlock copy];
    }
    return self;
}

- (instancetype)init {
    @throw [NSException exceptionWithName:@"ZYArrayDataSource init error" reason:@"Use the designated initializer to init." userInfo:nil];
    return [self initWithReuseIdentifier:nil configureBlock:nil];
}

- (void)initWithCollectionHeaderReuseIdentifier:(NSString *)identifier
                              reusableViewBlock:(ZYCollectionReusableViewBlock)block {
    _headerIdentifier = identifier;
    _headerViewBlock = block;
}

- (void)initWithCollectionFooterReuseIdentifier:(NSString *)identifier
                              reusableViewBlock:(ZYCollectionReusableViewBlock)block {
    _footerIdentifier = identifier;
    _footerViewBlock = block;
}

#pragma mark - section row reload
- (void)reloadTableCollectionView:(UIScrollView *)tableView
                     numberOfRows:(NSInteger)rows {
    self.sections = 1;
    self.rows = rows;
    [self reloadTableCollectionView:tableView];
}

- (void)reloadTableCollectionView:(UIScrollView *)tableView
                 numberOfSections:(NSInteger)sections
                     numberOfRows:(NSInteger)rows {
    self.sections = sections;
    self.rows = rows;
    [self reloadTableCollectionView:tableView];
}

- (void)reloadTableCollectionView:(UIScrollView *)tableView {
    if ([tableView isKindOfClass:UITableView.class]) {
        UITableView * _tableView = (UITableView *)tableView;
        _tableView.tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0.01)];
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, UIScreen.mainScreen.bounds.size.width, 0.01)];
        [_tableView reloadData];
    } else if ([tableView isKindOfClass:UICollectionView.class]) {
        [(UICollectionView *)tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:self.identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:self.identifier];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    self.configureBlock(cell,indexPath);
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sections;
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.rows;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:self.identifier forIndexPath:indexPath];
    self.configureBlock(cell,indexPath);
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.sections;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:self.headerIdentifier forIndexPath:indexPath];
        self.headerViewBlock(headerView,indexPath);
        return headerView;
    }
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView * footerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:self.footerIdentifier forIndexPath:indexPath];
        self.footerViewBlock(footerView,indexPath);
        return footerView;
    }
    return UICollectionReusableView.new;
}

@end
