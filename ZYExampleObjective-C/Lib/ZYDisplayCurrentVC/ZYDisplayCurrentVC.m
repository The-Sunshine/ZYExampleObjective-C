//
//  ZYDisplayCurrentVC.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/18.
//


#if DEBUG

#import "ZYDisplayCurrentVC.h"

@interface ZYDisplayCurrentVC ()

@property (nonatomic, strong) UILabel * noteLabel;

@end

@implementation ZYDisplayCurrentVC

+ (instancetype)share {
    static ZYDisplayCurrentVC * debuger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        debuger = ZYDisplayCurrentVC.new;
    });
    return debuger;
}

- (UILabel *)noteLabel {
    if (!_noteLabel) {
        CGRect frame;
        if ([UIScreen mainScreen].bounds.size.height >= 812) {
            frame.origin = CGPointMake(62, 32);
        }else {
            frame.origin = CGPointMake(62, 16);
        }
        frame.size = CGSizeMake(0, 20);
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
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            UIWindow * window = [self currentWindow];
            if (window) {
                [window addSubview:label];
            }
        });
    }
    return _noteLabel;
}

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

@end

#endif
