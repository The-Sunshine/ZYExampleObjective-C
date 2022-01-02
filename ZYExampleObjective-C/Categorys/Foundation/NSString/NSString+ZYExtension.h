//
//  NSString+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/1.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (ZYExtension)

/// 检验是否为空
- (BOOL)zy_isEmptyString;

/// 检测替换空格后是否为空
- (BOOL)zy_isReplaceSpaceEmptyString;
    


@end

NS_ASSUME_NONNULL_END
