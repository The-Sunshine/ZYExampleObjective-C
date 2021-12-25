//
//  ZYEnvironmentService.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/18.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZYEnvironmentServiceType) {
    ZYEnvironmentServiceTypeDevelop,
    ZYEnvironmentServiceTypeTest,
    ZYEnvironmentServiceTypePrepareRelease,
    ZYEnvironmentServiceTypeRelease,
};

static inline NSString * ZYEnvironmentServiceTypeDesc(ZYEnvironmentServiceType type) {
    switch (type) {
        case ZYEnvironmentServiceTypeDevelop:
            return @"开发环境";
        case ZYEnvironmentServiceTypeTest:
            return @"测试环境";
        case ZYEnvironmentServiceTypePrepareRelease:
            return @"预发环境";
        default:
            return @"正式环境";
    }
}

/// 环境切换设置
@interface ZYEnvironmentService : NSObject

/// 准备环境和url, DEBUG第一次安装默认开发环境,RELEASE固定正式环境
/// @param array url
+ (void)prepareEnvironmentLocalURLStringArray:(NSArray <NSString *>*)array;

/// 读取当前环境
+ (ZYEnvironmentServiceType)currentEnvironment;

/// 读取当前环境的url
+ (NSString *)localEnvironmentURLString;

/// 添加环境切换双击手势 仅在DEBUG环境打开
/// @param tapView 可点击控件
/// @param changeEnvironmentBlock 切换成功后配置
/// @param changeAfterExit 切换0.5秒后是否退出程序
+ (void)addEnvironmentTapView:(UIView *)tapView
       changeEnvironmentBlock:(dispatch_block_t)changeEnvironmentBlock
              changeAfterExit:(BOOL)changeAfterExit;

/// 添加其他服务配置显示
/// @param array 自定义显示配置 不可点击
+ (void)addOtherServiceDisplayStringArray:(NSArray <NSString *>*)array;

@end

NS_ASSUME_NONNULL_END
