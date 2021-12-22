//
//  ZYTabbarViewController.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYTabbarViewController.h"
#import "ZYNavigationController.h"
#import "ZYDemoViewController.h"

@interface ZYTabbarViewController ()<UITabBarControllerDelegate>

@end

@implementation ZYTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    [self setTabbarAppearance];
    [self addChildViewControllers];
}

- (void)setTabbarAppearance {
    UITabBarAppearance * appearance = UITabBarAppearance.new;
    //tabBaritem title选中状态颜色
    appearance.stackedLayoutAppearance.selected.titleTextAttributes = @{
        NSForegroundColorAttributeName:[UIColor redColor],
    };
    //tabBaritem title未选中状态颜色
    appearance.stackedLayoutAppearance.normal.titleTextAttributes = @{
        NSForegroundColorAttributeName:[UIColor greenColor],
    };
    //tabBar背景颜色
//    appearance.backgroundColor = [UIColor redColor];
    appearance.backgroundImage = [[UIImage imageNamed:@"profile_bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(2,0,0,0) resizingMode:UIImageResizingModeStretch];
    self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance = appearance;
}

- (void)addChildViewControllers {
    
    [self addTabbarVC:ZYDemoViewController.new title:@"基础" imageName:@"main_portal_message"];
    [self addTabbarVC:ZYDemoViewController.new title:@"预演" imageName:@"main_portal_message"];
    [self addTabbarVC:ZYDemoViewController.new title:@"实例" imageName:@"main_portal_message"];
    [self addTabbarVC:ZYDemoViewController.new title:@"分享" imageName:@"main_portal_message"];
    [self addTabbarVC:ZYDemoViewController.new title:@"更多" imageName:@"main_portal_message"];
}

- (void)addTabbarVC:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName {

    ZYNavigationController * nav = [[ZYNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    vc.tabBarItem.title = vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    NSString * selectedTabbarItemImage = [imageName stringByAppendingString:@"_selected"];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedTabbarItemImage];
    vc.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);
}

@end
