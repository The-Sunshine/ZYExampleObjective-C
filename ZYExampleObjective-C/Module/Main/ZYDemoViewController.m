//
//  ZYDemoViewController.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "ZYDemoViewController.h"
#import "ZYEnvironmentService.h"

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
    ZYDemoViewController * vc = ZYDemoViewController.new;
    vc.title = @"第二页";
    [self.navigationController pushViewController:vc animated:true];
}

- (void)dealloc {
    
}

@end
