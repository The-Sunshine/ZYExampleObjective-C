//
//  UIButton+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/13.
//

#import "UIButton+ZYExtension.h"

@implementation UIButton (ZYExtension)

- (ZYButtonTitleBlock)setTitleStateNormal {
    
    ZYButtonTitleBlock block = ^(NSString * title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
    return block;
}

- (ZYButtonTitleBlock)setTitleStateSelected {
    
    ZYButtonTitleBlock block = ^(NSString * title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
    return block;
}

- (ZYButtonTitleColorBlock)setTitleColorStateNormal {
    
    ZYButtonTitleColorBlock block = ^(UIColor * color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
    return block;
}

- (ZYButtonTitleColorBlock)setTitleColorStateSelected {
    
    ZYButtonTitleColorBlock block = ^(UIColor * color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
    return block;
}

- (ZYButtonImageBlock)setImageStateNormal {
    
    ZYButtonImageBlock block = ^(UIImage * image) {
        [self setImage:image forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
    return block;
}

- (ZYButtonImageBlock)setImageStateSelected {
    
    ZYButtonImageBlock block = ^(UIImage * image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
    return block;
}






@end


