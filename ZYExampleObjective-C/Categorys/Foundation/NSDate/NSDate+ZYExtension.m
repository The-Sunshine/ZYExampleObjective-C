//
//  NSDate+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/16.
//

#import "NSDate+ZYExtension.h"

@implementation NSDate (ZYExtension)

+ (NSTimeInterval)getCurrentMillisecondTimeStamp {
    return [[NSDate date] timeIntervalSince1970];
}

+ (NSString *)timestampToString:(NSTimeInterval)timestamp dateFormat:(NSString *)dateFormat {
    NSDate * date = [NSDate dateWithTimeIntervalSince1970:timestamp / 1000];
    return [self dateToTimeStringDate:date dateFormat:dateFormat];
}

+ (NSString *)getCurrentTimeWithDateFormat:(NSString *)dateFormat {
    NSDate * date = [NSDate date];
    return [self dateToTimeStringDate:date dateFormat:dateFormat];
}

+ (ZYDateFormatter *)getDateFormatterDescription {
    return ZYDateFormatter.new;
}

#pragma mark - private
/// date转时间
+ (NSString *)dateToTimeStringDate:(NSDate *)date dateFormat:(NSString *)dateFormat {
    NSDateFormatter * dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:dateFormat];
    return [dateFormatter stringFromDate:date];
}

@end



