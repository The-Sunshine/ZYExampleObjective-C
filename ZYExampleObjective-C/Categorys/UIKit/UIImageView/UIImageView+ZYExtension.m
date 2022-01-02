//
//  UIImageView+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/2.
//

#import "UIImageView+ZYExtension.h"

@implementation UIImageView (ZYExtension)


- (void)zy_imageNamed:(NSString *)imageNamed {
    self.image = [UIImage imageNamed:imageNamed];
}

@end
