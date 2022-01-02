//
//  NSString+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/1.
//

#import "NSString+ZYExtension.h"

@implementation NSString (ZYExtension)

- (BOOL)zy_isEmptyString {
    return ([self isEqual:[NSNull null]] || !self);
    return self.length == 0;
}

- (BOOL)zy_isReplaceSpaceEmptyString {
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""].length == 0;
}

@end
