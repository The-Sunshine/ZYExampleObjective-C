//
//  ZYDateFormatter.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/16.
//

#import "ZYDateFormatter.h"

@implementation ZYDateFormatter

- (instancetype)init {
    self = [super init];
    if (self) {
        self.year = @"yyyy";
        self.month = @"MM";
        self.day = @"dd";
        self.hour = @"HH";
        self.minute = @"mm";
        self.second = @"ss";
    }
    return self;
}

@end
