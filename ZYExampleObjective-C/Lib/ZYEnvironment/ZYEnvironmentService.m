//
//  ZYEnvironmentService.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/18.
//

#import "ZYEnvironmentService.h"

static NSString * kZYEnvironment = @"kZYEnvironment";
static NSString * kZYEnvironmentURLString = @"kZYEnvironmentURLString";

@interface ZYEnvironmentService ()

@property (strong, nonatomic) dispatch_block_t changeEnvironmentBlock;

@property (assign, nonatomic) BOOL changeAfterExit;

@property (strong, nonatomic) NSArray <NSString *> * urlStringArray;;

@end

@implementation ZYEnvironmentService

+ (instancetype)shared {
    static ZYEnvironmentService * service = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        service = [[super allocWithZone:nil] init];
    });
    return service;
}

#pragma mark - prepare environment
+ (void)prepareEnvironmentLocalURLStringArray:(NSArray <NSString *>*)array {
#ifdef DEBUG
    [ZYEnvironmentService.shared prepareEnvironmentLocalURLStringArray:array];
    ZYEnvironmentServiceType type = [ZYEnvironmentService currentEnvironment];
    [ZYEnvironmentService setUserDefaultsValue:array[type] forKey:kZYEnvironmentURLString];
#else
    [ZYEnvironmentService setUserDefaultsValue:array[array.count - 1] forKey:kZYEnvironmentURLString];
#endif
}

- (void)prepareEnvironmentLocalURLStringArray:(NSArray <NSString *>*)array {
    _urlStringArray = array;
}

#pragma mark - UserDefaults
+ (NSString *)localEnvironmentURLString {
    NSString * urlString = [ZYEnvironmentService userDefaultsValueForKey:kZYEnvironmentURLString];
    NSAssert(urlString, @"请先配置prepareEnvironmentLocalURLStringArray");
    return urlString;
}

- (void)saveEnvironmentType:(ZYEnvironmentServiceType)type {
    [ZYEnvironmentService setUserDefaultsValue:@(type) forKey:kZYEnvironment];
}

+ (ZYEnvironmentServiceType)currentEnvironment {
#ifdef DEBUG
    NSNumber * value = [ZYEnvironmentService userDefaultsValueForKey:kZYEnvironment];
    value = value ? value : @(ZYEnvironmentServiceTypeDevelop);
    return [value integerValue];
#endif
    return ZYEnvironmentServiceTypeRelease;
}

#pragma mark - 添加环境配置Alert
+ (void)addEnvironmentTapView:(UIView *)tapView
       changeEnvironmentBlock:(dispatch_block_t)changeEnvironmentBlock
              changeAfterExit:(BOOL)changeAfterExit {
#ifdef DEBUG
    [ZYEnvironmentService.shared addEnvironmentTapView:tapView
                                changeEnvironmentBlock:changeEnvironmentBlock
                                       changeAfterExit:changeAfterExit];
#endif
}

- (void)addEnvironmentTapView:(UIView *)tapView
       changeEnvironmentBlock:(dispatch_block_t)changeEnvironmentBlock
              changeAfterExit:(BOOL)changeAfterExit {

    if (_changeEnvironmentBlock) return;;
    _changeEnvironmentBlock = changeEnvironmentBlock;
    _changeAfterExit = changeAfterExit;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showEnvionmentAlert)];
    tapView.userInteractionEnabled = YES;
    tap.numberOfTapsRequired = 2;
    [tapView addGestureRecognizer:tap];
}

#pragma mark - showEnvionmentAlert
- (void)showEnvionmentAlert {
    NSString * currentEnvironmentString = [NSString stringWithFormat:@"当前环境:%@", ZYEnvironmentServiceTypeDesc([ZYEnvironmentService currentEnvironment])];
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:currentEnvironmentString
                                                                              message:nil
                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    
    NSArray * array = @[@(ZYEnvironmentServiceTypeDevelop),
                        @(ZYEnvironmentServiceTypeTest),
                        @(ZYEnvironmentServiceTypePrepareRelease),
                        @(ZYEnvironmentServiceTypeRelease)];
    
    [array enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * title = [NSString stringWithFormat:@"%@-%@",ZYEnvironmentServiceTypeDesc([obj integerValue]),_urlStringArray[idx]];
        UIAlertAction * action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            
            [self makeSureChangeEnvionmentAlert:[action.title substringToIndex:4]];
        }];
        [alertController addAction:action];
    }];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];

    [self.currentViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)makeSureChangeEnvionmentAlert:(NSString *)prefixString {
    __block ZYEnvironmentServiceType type;
    [_urlStringArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([ZYEnvironmentServiceTypeDesc(idx) isEqualToString:prefixString]) {
            type = idx;
        }
    }];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"切换环境"
                                                                              message:[NSString stringWithFormat:@"是否切换环境到%@",ZYEnvironmentServiceTypeDesc(type)]
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self saveEnvironmentType:type];
        [ZYEnvironmentService setUserDefaultsValue:self.urlStringArray[type] forKey:kZYEnvironmentURLString];
        
        !self.changeEnvironmentBlock ?: self.changeEnvironmentBlock();
        
        if (!self.changeAfterExit) return;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            exit(0);
        });
    }];
    [alertController addAction:action];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    
    [self.currentViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - findCurrentViewController
/// 获取当前屏幕显示的viewcontroller
- (UIViewController *)currentViewController {
    
    UIWindow * window;
    if (@available(iOS 13.0, *)) {
        for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes) {
            if (windowScene.activationState == UISceneActivationStateForegroundActive) {
                window = windowScene.windows.firstObject;
                break;
            }
        }
    } else {
        window = UIApplication.sharedApplication.delegate.window;
    }
    return [self getCurrentViewControllerFrom:window.rootViewController];
}

- (UIViewController *)getCurrentViewControllerFrom:(UIViewController *)rootVC {
    /// 视图是被presented出来的
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    
    UIViewController *currentVC;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentViewControllerFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentViewControllerFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

#pragma mark - Tool UserDefaults
+ (void)setUserDefaultsValue:(nullable id)value forKey:(NSString *)key {
    [NSUserDefaults.standardUserDefaults setValue:value forKey:key];
    [NSUserDefaults.standardUserDefaults synchronize];
}

+ (nullable id)userDefaultsValueForKey:(NSString *)key {
    return [NSUserDefaults.standardUserDefaults valueForKey:key];
}

@end
