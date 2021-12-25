//
//  WHC_Debuger.m
//  WHC_Debuger
//
//  Created by WHC on 17/1/14.
//  Copyright © 2017年 WHC. All rights reserved.
//
//  Github <https://github.com/netyouli/WHC_Debuger>
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.


#if DEBUG
#import "WHC_Debuger.h"

@interface WHC_Debuger ()
@property (nonatomic, strong) UILabel * noteLabel;
@end

@implementation WHC_Debuger

+ (instancetype)share {
    static WHC_Debuger * debuger = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        debuger = WHC_Debuger.new;
    });
    return debuger;
}

- (instancetype)init {
    self = [super init];
    if (self) {
    }
    return self;
}

- (UILabel *)whc_NoteLabel {
    if (!_noteLabel) {
        CGRect noteLabelFrame;
        if ([UIScreen mainScreen].bounds.size.height >= 812) {
            noteLabelFrame.origin = CGPointMake(65, 32);
        }else {
            noteLabelFrame.origin = CGPointMake(65, 16);
        }
        noteLabelFrame.size = CGSizeMake(150, 20);
        _noteLabel = UILabel.new;
        _noteLabel.frame = noteLabelFrame;
        _noteLabel.textColor = [UIColor colorWithRed:53.0 / 255 green:205.0 / 255 blue:73.0 / 255 alpha:1.0];
        _noteLabel.adjustsFontSizeToFitWidth = YES;
        _noteLabel.minimumScaleFactor = 0.5;
        _noteLabel.font = [UIFont systemFontOfSize:14];
        _noteLabel.textAlignment = NSTextAlignmentCenter;
        _noteLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.5];
        _noteLabel.layer.cornerRadius = 3;
        _noteLabel.layer.masksToBounds = true;
    }
    if (!_noteLabel.superview) {
        
        UIWindow * window = [self currentWindow];
        if (window) {
            [window addSubview:_noteLabel];
        }
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
