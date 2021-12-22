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

#define SCREEN_SIZE [UIScreen mainScreen].bounds.size
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height

#define SystemVersionValue [UIDevice currentDevice].systemVersion.floatValue

#define RGBCOLOR(r,g,b)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
#define RGBACOLOR(r,g,b,a)  [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:(a)/255.0f]
#define HexColor(hexValue) [UIColor colorWithRed:((float)(((hexValue) & 0xFF0000) >> 16))/255.0 green:((float)(((hexValue) & 0xFF00) >> 8))/255.0 blue:((float)((hexValue) & 0xFF))/255.0 alpha:1.0]

#ifdef DEBUG
#define ZYLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define ZYLog(...)
#endif

//GCD - 一次性执行
#define kDISPATCH_ONCE_BLOCK(onceBlock) static dispatch_once_t onceToken; dispatch_once(&onceToken, onceBlock);
//GCD - 在Main线程上运行
#define kDISPATCH_MAIN_THREAD(mainQueueBlock) dispatch_async(dispatch_get_main_queue(), mainQueueBlock);
//GCD - 开启异步线程
#define kDISPATCH_GLOBAL_QUEUE_DEFAULT(globalQueueBlock) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), globalQueueBlocl);

/// PingFangSC-Regular字体
static inline UIFont * ZYPingFangSCRegularSize(float size) {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
}

/// imageNamed快速读取
static inline UIImage * ZYImageNamed(NSString * imageName) {
    return [UIImage imageNamed:imageName];
}


#endif /* ZYMacro_h */
