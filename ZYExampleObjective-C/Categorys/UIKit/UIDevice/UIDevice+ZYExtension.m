//
//  UIDevice+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/20.
//

#import "UIDevice+ZYExtension.h"

@implementation UIDevice (ZYExtension)


+ (float)systemVersionFloat {
    return UIDevice.currentDevice.systemVersion.floatValue;
}

+ (NSString *)app_version {
    return [NSBundle.mainBundle objectForInfoDictionaryKey:@"CFBundleShortVersionString"];;
}

+ (NSString *)app_buildVersion {
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleVersion"];;
}

+ (NSString *)app_name {
    return [NSBundle.mainBundle.infoDictionary objectForKey:@"CFBundleDisplayName"];;
}

+ (NSString *)app_currentLanguage {
    return ([NSLocale.preferredLanguages objectAtIndex:0]);;
}

+ (BOOL)isSimulator {
    return (TARGET_IPHONE_SIMULATOR == 1 &&
            TARGET_OS_IPHONE == 1);
}

+ (BOOL)isIphone {
    return (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPhone);
}

+ (BOOL)isIpad {
    return (UIDevice.currentDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad);
}

@end

