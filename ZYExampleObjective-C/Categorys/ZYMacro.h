//
//  ZYMacro.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/11/29.
//

#ifndef ZYMacro_h
#define ZYMacro_h

#import <UIKit/UIKit.h>

#define ZYWeakSelf(type)  __weak typeof(type) weak##type = type;
#define ZYStrongSelf(type)  __strong typeof(type) type = weak##type;

#ifdef DEBUG
#define ZYLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZYLog(...)
#endif

static inline CGSize zy_screen_size() {
    return UIScreen.mainScreen.bounds.size;
}

static inline CGFloat zy_screen_width() {
    return UIScreen.mainScreen.bounds.size.width;
}

static inline CGFloat zy_screen_height() {
    return UIScreen.mainScreen.bounds.size.height;
}

static inline BOOL zy_isIphonex() {
    return ([UIScreen mainScreen].bounds.size.width >= 375.0f &&
            [UIScreen mainScreen].bounds.size.height >= 812.0f);
}

static inline CGFloat zy_statusBar_height() {
    return zy_isIphonex() ? 44 : 20;
}

static inline CGFloat zy_navigationBar_height() {
    return zy_statusBar_height() + 44;
}

static inline CGFloat zy_tabBar_height() {
    return zy_isIphonex() ? 83 : 49;
}

// GCD - 一次性执行
static inline void zy_dispatch_once_block(DISPATCH_NOESCAPE dispatch_block_t block) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, block);
}

// GCD - 在Main线程上运行
static inline void zy_dispatch_main_block(DISPATCH_NOESCAPE dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

// GCD - 开启异步线程
static inline void zy_dispatch_global_block(DISPATCH_NOESCAPE dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

/// PingFangSC-Regular字体
static inline UIFont * zy_PingFangSC_regularSize(float size) {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

/// rgbColor
static inline UIColor * zy_rgbColor(float red,float green,float blue) {
    return [UIColor colorWithRed:(red)/255.0f green:(green)/255.0f blue:(blue)/255.0f alpha:1];
}

/// rgbaColor
static inline UIColor * zy_rgbaColor(float red,float green,float blue,float alpha) {
    return [UIColor colorWithRed:(red)/255.0f green:(green)/255.0f blue:(blue)/255.0f alpha:alpha];
}

/// hexColor
static inline UIColor * zy_hexColor(NSUInteger hexValue) {
    return [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0 green:((float)(((hexValue) & 0xFF00) >> 8))/255.0 blue:((float)((hexValue) & 0xFF))/255.0 alpha:1.0];
}

#endif /* ZYMacro_h */
