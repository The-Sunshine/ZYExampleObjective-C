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

@property (strong, nonatomic) NSMutableArray <NSString *> * urlStringArray;;

@property (strong, nonatomic) NSMutableArray <NSNumber *> * typeArray;;

@property (strong, nonatomic) NSArray <NSString *> * otherServiceArray;;

@property (strong, nonatomic) UILabel * noteLabel;

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
+ (void)prepareEnvironmentLocalDevelopURLString:(NSString *)develop
                                  testURLString:(NSString *)test
                        prepareReleaseURLString:(NSString *)prepareRelease
                               releaseURLString:(NSString *)release {
#ifdef DEBUG
    [ZYEnvironmentService.shared prepareEnvironmentDevelopURLString:develop
                                                      testURLString:test
                                            prepareReleaseURLString:prepareRelease
                                                   releaseURLString:release];
#else
    [ZYEnvironmentService setUserDefaultsValue:release forKey:kZYEnvironmentURLString];
#endif
}

- (void)prepareEnvironmentDevelopURLString:(NSString *)develop
                             testURLString:(NSString *)test
                   prepareReleaseURLString:(NSString *)prepareRelease
                          releaseURLString:(NSString *)release {
    self.urlStringArray = [NSMutableArray array];
    self.typeArray = [NSMutableArray array];
    if (develop) {
        [self.urlStringArray addObject:develop];
        [self.typeArray addObject:@(ZYEnvironmentServiceTypeDevelop)];
    }
    if (test) {
        [self.urlStringArray addObject:test];
        [self.typeArray addObject:@(ZYEnvironmentServiceTypeTest)];
    }
    if (prepareRelease) {
        [self.urlStringArray addObject:prepareRelease];
        [self.typeArray addObject:@(ZYEnvironmentServiceTypePrepareRelease)];
    }
    if (release) {
        [self.urlStringArray addObject:release];
        [self.typeArray addObject:@(ZYEnvironmentServiceTypeRelease)];
    }

    NSAssert(self.urlStringArray.count, @"prepareEnvironmentDevelopURLString?????????url");
    ZYEnvironmentServiceType type = [ZYEnvironmentService currentEnvironment];
    /// ??????????????????url??????????????? ????????????????????????url ????????????????????????
    if (![self.typeArray containsObject:@(type)]) {
        type = self.typeArray.firstObject.integerValue;
        [self saveEnvironmentType:type];
    }
    NSString * url = (_urlStringArray.count <= type) ? _urlStringArray.firstObject : _urlStringArray[type];
    [ZYEnvironmentService setUserDefaultsValue:url forKey:kZYEnvironmentURLString];

    self.noteLabel.text = ZYEnvironmentServiceTypeDesc([ZYEnvironmentService currentEnvironment]);
}

#pragma mark - UserDefaults
+ (NSString *)currentEnvironmentURLString {
    NSString * urlString = [ZYEnvironmentService userDefaultsValueForKey:kZYEnvironmentURLString];
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

#pragma mark - ??????????????????Alert
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

    _changeEnvironmentBlock = changeEnvironmentBlock;
    _changeAfterExit = changeAfterExit;
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showEnvionmentAlert)];
    tapView.userInteractionEnabled = YES;
    tap.numberOfTapsRequired = 2;
    [tapView addGestureRecognizer:tap];
}

#pragma mark - ??????????????????????????????
+ (void)addOtherServiceDisplayStringArray:(NSArray <NSString *>*)array {
#ifdef DEBUG
    [ZYEnvironmentService.shared addOtherServiceDisplayStringArray:array];
#endif
}

- (void)addOtherServiceDisplayStringArray:(NSArray <NSString *>*)array {
    self.otherServiceArray = array;
}

#pragma mark - showEnvionmentAlert
- (void)showEnvionmentAlert {
    ZYEnvironmentServiceType type = [ZYEnvironmentService currentEnvironment];
    NSString * url = [ZYEnvironmentService currentEnvironmentURLString];
    NSString * currentEnvironmentString = [NSString stringWithFormat:@"????????????:%@-%@", ZYEnvironmentServiceTypeDesc(type),url];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:currentEnvironmentString
                                                                              message:nil
                                                                       preferredStyle:UIAlertControllerStyleActionSheet];
    [self.typeArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj.integerValue == type) return;;

        NSString * title = [NSString stringWithFormat:@"%@-%@",ZYEnvironmentServiceTypeDesc(obj.integerValue),_urlStringArray[idx]];
        UIAlertAction * action = [UIAlertAction actionWithTitle:title style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self makeSureChangeEnvionmentAlert:[action.title substringToIndex:4]];
        }];
        [alertController addAction:action];
    }];
    
    [self.otherServiceArray enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (obj.length > 0) {
            UIAlertAction * action = [UIAlertAction actionWithTitle:obj style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
            action.enabled = false;
        }
    }];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];

    [self.currentViewController presentViewController:alertController animated:YES completion:nil];
}

- (void)makeSureChangeEnvionmentAlert:(NSString *)prefixString {
    __block ZYEnvironmentServiceType type;
    
    NSArray * array = @[@(ZYEnvironmentServiceTypeDevelop),
                         @(ZYEnvironmentServiceTypeTest),
                         @(ZYEnvironmentServiceTypePrepareRelease),
                         @(ZYEnvironmentServiceTypeRelease)];
    /// ???????????????????????????????????????
    [array enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([ZYEnvironmentServiceTypeDesc(idx) isEqualToString:prefixString]) {
            type = idx;
        }
    }];
    
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"????????????"
                                                                              message:[NSString stringWithFormat:@"?????????????????????%@",ZYEnvironmentServiceTypeDesc(type)]
                                                                       preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction * action = [UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        
        [self saveEnvironmentType:type];
        self.noteLabel.text = ZYEnvironmentServiceTypeDesc(type);
        
        /// ?????????????????????????????????????????????url
        [self.typeArray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj.integerValue == type) {
                [ZYEnvironmentService setUserDefaultsValue:self.urlStringArray[idx] forKey:kZYEnvironmentURLString];
            }
        }];
        
        !self.changeEnvironmentBlock ?: self.changeEnvironmentBlock();
        
        if (!self.changeAfterExit) return;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            exit(0);
        });
    }];
    [alertController addAction:action];
    
    UIAlertAction * cancelAction = [UIAlertAction actionWithTitle:@"??????" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [alertController addAction:cancelAction];
    
    [self.currentViewController presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - findCurrentViewController
- (UIWindow *)currentWindow {
    
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
    return window;
}

/// ???????????????????????????viewcontroller
- (UIViewController *)currentViewController {
    return [self getCurrentViewControllerFrom:[self currentWindow].rootViewController];
}

- (UIViewController *)getCurrentViewControllerFrom:(UIViewController *)rootVC {
    /// ????????????presented?????????
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    
    UIViewController *currentVC;
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // ????????????UITabBarController
        currentVC = [self getCurrentViewControllerFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // ????????????UINavigationController
        currentVC = [self getCurrentViewControllerFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // ????????????????????????
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

#pragma mark - lazy
- (UILabel *)noteLabel {
    if (!_noteLabel) {
        CGRect frame;
        frame.size = CGSizeMake(60, 20);
        if ([UIScreen mainScreen].bounds.size.height >= 812) {
            frame.origin = CGPointMake(UIScreen.mainScreen.bounds.size.width - frame.size.width - 5, 32);
        }else {
            frame.origin = CGPointMake(UIScreen.mainScreen.bounds.size.width - frame.size.width - 5, 16);
        }
        UILabel * label = UILabel.new;
        label.frame = frame;
        label.textColor = [UIColor colorWithRed:53.0 / 255 green:205.0 / 255 blue:73.0 / 255 alpha:1.0];
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = 0.5;
        label.font = [UIFont systemFontOfSize:14];
        label.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        label.layer.cornerRadius = 3;
        label.layer.masksToBounds = true;
        _noteLabel = label;
        
        [self addEnvironmentTapView:label changeEnvironmentBlock:self.changeEnvironmentBlock changeAfterExit:self.changeAfterExit];
        [self addLabel:label];
    }
    return _noteLabel;
}

- (void)addLabel:(UILabel *)label {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        UIWindow * window = [self currentWindow];
        if (window) {
            [window addSubview:label];
        } else {
            [self addLabel:label];
        }
    });
}

@end
