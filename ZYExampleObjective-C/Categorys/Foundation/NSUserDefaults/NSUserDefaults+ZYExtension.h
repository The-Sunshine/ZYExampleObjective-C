//
//  NSUserDefaults+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static inline void zy_userDefaults_setValue(_Nullable id value,NSString * key) {
    [NSUserDefaults.standardUserDefaults setValue:value forKey:key];
    [NSUserDefaults.standardUserDefaults synchronize];
}

static inline _Nullable id zy_userDefaults_valueForKey(NSString * key) {
    return [NSUserDefaults.standardUserDefaults valueForKey:key];
}

@interface NSUserDefaults (ZYExtension)



@end

NS_ASSUME_NONNULL_END
