//
//  ZYNewsViewController.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/26.
//

#import "ZYNewsViewController.h"

@interface ZYNewsViewController ()<UITableViewDelegate>

@property (nonatomic,strong) ZYArrayDataSource * dataSource;

@end

@implementation ZYNewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)initUI {
    UITableView * tableView = [UITableView newTableViewGroupedWithTarget:self];
    [self.view addSubview:tableView];
    [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.offset(0);
    }];
    
    ZYArrayDataSource * dataSource = [ZYArrayDataSource newWithReuseIdentifier:@"cell" configureBlock:^(id  _Nonnull cell, NSIndexPath * _Nonnull indexPath) {
        UITableViewCell * asd = (UITableViewCell *)cell;
        asd.textLabel.text = @"白衣-------";
    }];
    _dataSource = dataSource;
    tableView.dataSource = _dataSource;
    [dataSource reloadTableCollectionView:tableView numberOfSections:2 numberOfRows:10];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
