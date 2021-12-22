//
//  ZYSyntaxExample.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/1.
//

#ifndef ZYSyntaxExample_h
#define ZYSyntaxExample_h

/// 枚举
typedef NS_ENUM(NSUInteger, ZYDemoExampleEnumType) {
    ZYDemoExampleEnumTypeA,
    ZYDemoExampleEnumTypeB,
    ZYDemoExampleEnumTypeC,
};

/// 枚举描述
static inline NSString * ZYDemoExampleEnumTypeDesc(ZYDemoExampleEnumType type) {
    switch (type) {
        case ZYDemoExampleEnumTypeA:
            return @"A";
        case ZYDemoExampleEnumTypeB:
            return @"B";
        case ZYDemoExampleEnumTypeC:
            return @"C";
        default:
            return @"";
    }
}

/// block回调
typedef void(^ZYDemoExampleBlock)(void);

@property (nonatomic, copy) ZYDemoExampleBlock block;

/// 是否存在库
#if __has_include(<Masonry/Masonry.h>)
#import <Masonry.h>
#else
#import "Masonry.h"
#endif





#endif /* ZYSyntaxExample_h */
