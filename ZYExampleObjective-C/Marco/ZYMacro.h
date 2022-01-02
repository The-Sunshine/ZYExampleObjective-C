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

static inline CGSize SCREEN_SIZE() {
    return UIScreen.mainScreen.bounds.size;
}

static inline CGFloat SCREEN_WIDTH() {
    return UIScreen.mainScreen.bounds.size.width;
}

static inline CGFloat SCREENH_HEIGHT() {
    return UIScreen.mainScreen.bounds.size.height;
}

/// 检查null nil
static inline BOOL ZYCheckNull(NSString * string) {
    return [string isEqual:[NSNull null]] ||
    (string == nil ? @"" : [NSString stringWithFormat:@"%@", string]);
}

// GCD - 一次性执行
static inline void ZYDispatch_once_block(DISPATCH_NOESCAPE dispatch_block_t block) {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, block);
}

// GCD - 在Main线程上运行
static inline void ZYDispatch_main_block(DISPATCH_NOESCAPE dispatch_block_t block) {
    dispatch_async(dispatch_get_main_queue(), block);
}

// GCD - 开启异步线程
static inline void ZYDispatch_global_block(DISPATCH_NOESCAPE dispatch_block_t block) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block);
}

/// PingFangSC-Regular字体
static inline UIFont * ZYPingFangSCRegularSize(float size) {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

/// rgbColor
static inline UIColor * rgbColor(float red,float green,float blue) {
    return [UIColor colorWithRed:(red)/255.0f green:(green)/255.0f blue:(blue)/255.0f alpha:1];
}

/// rgbaColor
static inline UIColor * rgbaColor(float red,float green,float blue,float alpha) {
    return [UIColor colorWithRed:(red)/255.0f green:(green)/255.0f blue:(blue)/255.0f alpha:alpha];
}

/// hexColor
static inline UIColor * hexColor(NSUInteger hexValue) {
    return [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0 green:((float)(((hexValue) & 0xFF00) >> 8))/255.0 blue:((float)((hexValue) & 0xFF))/255.0 alpha:1.0];
}

#endif /* ZYMacro_h */
