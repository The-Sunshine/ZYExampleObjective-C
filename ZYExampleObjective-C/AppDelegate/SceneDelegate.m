//
//  SceneDelegate.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#import "SceneDelegate.h"
#import "ZYTabbarViewController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "ZYEnvironmentService.h"
#import "ZYVersionUpdateManager.h"
#import "ZYVersionUpdateView.h"


/// DEBUG检测
#ifdef DEBUG
#import "YYFPSLabel.h"
#import "MLeaksFinder.h"
#import "ZYDisplayCurrentVC.h"

#endif

/// 微信id
static NSString * _appID = @"414478124";

@interface SceneDelegate ()

@end

@implementation SceneDelegate


- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {

    [self debugMonitor];

    self.window = [UIWindow.alloc initWithWindowScene:(UIWindowScene *)scene];
    self.window.frame = UIScreen.mainScreen.bounds;
    self.window.rootViewController = ZYTabbarViewController.new;
    [self.window makeKeyAndVisible];

    [self versionUpdate];
    // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
    // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
    // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
}

- (void)debugMonitor {
    [IQKeyboardManager sharedManager].enable = YES;

    [ZYEnvironmentService prepareEnvironmentLocalDevelopURLString:@"http://baidu.com"
                                                    testURLString:@"http://test.com"
                                          prepareReleaseURLString:@"http://prepare.com"
                                                 releaseURLString:@"http://release.com"];
    [ZYEnvironmentService addOtherServiceDisplayStringArray:@[@"文件服务器http://souhu.com"]];
    ZYLog(@"%@",[ZYEnvironmentService currentEnvironmentURLString]);
    ZYLog(@"%ld",[ZYEnvironmentService currentEnvironment]);

#ifdef DEBUG
    YYFPSLabel * fps = [[YYFPSLabel alloc] initWithFrame:CGRectMake(5, 30, 0, 0)];
    [self.window addSubview:fps];
    
    ZYDisplayCurrentVC.share.note = @"自定义";
    ZYDisplayCurrentVC.share.whiteListVCArray = @[@""];
    ZYDisplayCurrentVC.share.whiteListPrefixVCArray = @[@"FLEX"];
    
#endif
}

- (void)versionUpdate {
    /// 延迟0.5秒 window存在 再加载
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        /// 自定义view
        ZYVersionUpdateView * view = [[ZYVersionUpdateView alloc] init];
        view.frame = CGRectMake(0, 0, 250, 300);
        view.model = [ZYVersionUpdateManager testModel];
        __weak typeof(view) self_view = view;
        view.sureBlock = ^{
            [ZYVersionUpdateManager versionUpdateUrl:self_view.model.url];
            [ZYVersionUpdateManager dismiss];
        };
        view.cancelBlock = ^{
            [ZYVersionUpdateManager dismiss];
        };

        /// 商店
        [ZYVersionUpdateManager checkAppStoreVersionUpdateWithAppID:_appID force:false customView:view block:^(BOOL success, NSString * _Nonnull msg) {
            if (!success) {
                NSLog(@"%@", msg);
            }
        }];
        
        /// 服务器 request后
//        ZYVersionUpdateModel * model = [ZYVersionUpdateManager testModel];
//        ZYVersionUpdateView * customView;
//        [ZYVersionUpdateManager.shared updateComparisonWithModel:model customView:customView  block:^(BOOL success, NSString * _Nonnull msg) {
//            if (!success) {
//                NSLog(@"%@", msg);
//            }
//        }];
    });
}

- (void)sceneDidDisconnect:(UIScene *)scene {
    // Called as the scene is being released by the system.
    // This occurs shortly after the scene enters the background, or when its session is discarded.
    // Release any resources associated with this scene that can be re-created the next time the scene connects.
    // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
}


- (void)sceneDidBecomeActive:(UIScene *)scene {
    // Called when the scene has moved from an inactive state to an active state.
    // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
}


- (void)sceneWillResignActive:(UIScene *)scene {
    // Called when the scene will move from an active state to an inactive state.
    // This may occur due to temporary interruptions (ex. an incoming phone call).
}


- (void)sceneWillEnterForeground:(UIScene *)scene {
    // Called as the scene transitions from the background to the foreground.
    // Use this method to undo the changes made on entering the background.
}


- (void)sceneDidEnterBackground:(UIScene *)scene {
    // Called as the scene transitions from the foreground to the background.
    // Use this method to save data, release shared resources, and store enough scene-specific state information
    // to restore the scene back to its current state.
}


@end
