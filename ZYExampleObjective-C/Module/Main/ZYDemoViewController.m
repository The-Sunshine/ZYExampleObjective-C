//
//  ZYDemoViewController.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYDemoViewController.h"
#import "ZYEnvironmentService.h"
#import "ZYMineViewController.h"


#ifdef DEBUG
#import "FLEX.h"

#endif

@implementation ZYDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton  *bgImg = [[UIButton alloc] init];
    [self.view addSubview:bgImg];
    bgImg.frame = CGRectMake(100, 100, 200, 200);
    [bgImg addGradientWithBeginColor:UIColor.redColor endColor:UIColor.greenColor andGradientType:0];
        
    ZYLog(@"%@",NSLocalizedString(@"ZYDemoViewController_search", nil));
    [ZYEnvironmentService addEnvironmentTapView:bgImg changeEnvironmentBlock:^{
        
    } changeAfterExit:false];
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
#ifdef DEBUG
    [[FLEXManager sharedManager] showExplorer];

#endif
    
    ZYMineViewController * vc = ZYMineViewController.new;
    vc.title = @"第二页";
    [self zy_present_overFullScreenViewController:vc];
}

- (void)dealloc {
    
}

@end
