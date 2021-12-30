//
//  UIButton+ZYExtension.m
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/13.
//

#import "UIButton+ZYExtension.h"

@implementation UIButton (ZYExtension)

- (ButtonTitleBlock)setTitleStateNormal {
    
    ButtonTitleBlock block = ^(NSString * title) {
        [self setTitle:title forState:UIControlStateNormal];
        return self;
    };
    return block;
}

- (ButtonTitleBlock)setTitleStateSelected {
    
    ButtonTitleBlock block = ^(NSString * title) {
        [self setTitle:title forState:UIControlStateSelected];
        return self;
    };
    return block;
}

- (ButtonTitleColorBlock)setTitleColorStateNormal {
    
    ButtonTitleColorBlock block = ^(UIColor * color) {
        [self setTitleColor:color forState:UIControlStateNormal];
        return self;
    };
    return block;
}

- (ButtonTitleColorBlock)setTitleColorStateSelected {
    
    ButtonTitleColorBlock block = ^(UIColor * color) {
        [self setTitleColor:color forState:UIControlStateSelected];
        return self;
    };
    return block;
}

- (ButtonImageBlock)setImageStateNormal {
    
    ButtonImageBlock block = ^(UIImage * image) {
        [self setImage:image forState:UIControlStateNormal];
        [self setImage:image forState:UIControlStateHighlighted];
        return self;
    };
    return block;
}

- (ButtonImageBlock)setImageStateSelected {
    
    ButtonImageBlock block = ^(UIImage * image) {
        [self setImage:image forState:UIControlStateSelected];
        return self;
    };
    return block;
}






@end


