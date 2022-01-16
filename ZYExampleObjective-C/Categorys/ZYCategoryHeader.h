//
//  ZYCategoryHeader.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/14.
//

#ifndef ZYCategoryHeader_h
#define ZYCategoryHeader_h

#import <UIKit/UIKit.h>

/// imageNamed快速读取
static inline UIImage * zy_imageNamed(NSString * imageName) {
    return [UIImage imageNamed:imageName];
}

#import "ZYMacro.h"

/// UIKit
#import "UIAlertController+ZYExtension.h"
#import "UIBarButtonItem+ZYExtension.h"
#import "UIButton+ZYExtension.h"
#import "UIDevice+ZYExtension.h"
#import "UIFont+ZYExtension.h"
#import "UIImageView+ZYExtension.h"
#import "UILabel+ZYExtension.h"
#import "UITableView+ZYExtension.h"
#import "UITableViewCell+ZYExtension.h"
#import "UITextField+ZYExtension.h"
#import "UIView+ZYExtension.h"
#import "UIViewController+ZYExtension.h"
#import "UIWindow+ZYExtension.h"





/// Foundation
#import "NSString+ZYExtension.h"
#import "NSUserDefaults+ZYExtension.h"
#import "NSDate+ZYExtension.h"








#endif /* ZYCategoryHeader_h */
