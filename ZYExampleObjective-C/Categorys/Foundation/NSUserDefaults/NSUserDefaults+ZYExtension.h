//
//  NSUserDefaults+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSUserDefaults (ZYExtension)

+ (void)zy_setValue:(nullable id)value forKey:(NSString *)key;

+ (nullable id)zy_valueForKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
