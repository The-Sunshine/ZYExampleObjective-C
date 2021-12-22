//
//  NSUserDefaults+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/22.
//

#import "NSUserDefaults+ZYExtension.h"

@implementation NSUserDefaults (ZYExtension)

+ (void)zy_setValue:(nullable id)value forKey:(NSString *)key {
    [NSUserDefaults.standardUserDefaults setValue:value forKey:key];
    [NSUserDefaults.standardUserDefaults synchronize];
}

+ (nullable id)zy_valueForKey:(NSString *)key {
    return [NSUserDefaults.standardUserDefaults valueForKey:key];
}

@end
