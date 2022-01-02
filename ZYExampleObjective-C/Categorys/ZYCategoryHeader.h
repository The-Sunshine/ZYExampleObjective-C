//
//  ZYCategoryHeader.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/14.
//

#ifndef ZYCategoryHeader_h
#define ZYCategoryHeader_h

/// imageNamed快速读取
static inline UIImage * ZYImageNamed(NSString * imageName) {
    return [UIImage imageNamed:imageName];
}

/// UIKit
#import "UIButton+ZYExtension.h"
#import "UIImageView+ZYExtension.h"
#import "UIView+ZYExtension.h"
#import "UIViewController+ZYExtension.h"
#import "UIBarButtonItem+ZYExtension.h"
#import "UIDevice+ZYExtension.h"
#import "UIWindow+ZYExtension.h"





/// Foundation
#import "NSUserDefaults+ZYExtension.h"
#import "NSString+ZYExtension.h"








#endif /* ZYCategoryHeader_h */
