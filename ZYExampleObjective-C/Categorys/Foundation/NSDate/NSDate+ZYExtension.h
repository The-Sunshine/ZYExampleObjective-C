//
//  NSDate+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/16.
//

#import <Foundation/Foundation.h>
#import "ZYDateFormatter.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDate (ZYExtension)

/// 获取当前毫秒时间戳
+ (NSTimeInterval)getCurrentMillisecondTimeStamp;

/// 时间戳转字符串 yyyy-MM-dd HH:mm:ss
+ (NSString *)timestampToString:(NSTimeInterval)timestamp dateFormat:(NSString *)dateFormat;

/// 获取当前时间，指定格式字符串 yyyy-MM-dd HH:mm:ss
+ (NSString *)getCurrentTimeWithDateFormat:(NSString *)dateFormat;

/// 获取ZYDateFormatter 包含属性 年月日 时分秒，可直接读取，避免硬编码
+ (ZYDateFormatter *)getDateFormatterDescription;

@end

NS_ASSUME_NONNULL_END
