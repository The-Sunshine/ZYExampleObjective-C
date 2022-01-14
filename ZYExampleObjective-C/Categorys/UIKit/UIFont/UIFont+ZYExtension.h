//
//  UIFont+ZYExtension.h
//  ZYExampleObjective-C
//
//  Created by zy on 2022/1/13.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (ZYExtension)


@end

static inline UIFont * zy_font(CGFloat size) {
    return [UIFont systemFontOfSize:size];
}

static inline UIFont * zy_font_blod(CGFloat size) {
    return [UIFont boldSystemFontOfSize:size];
}

static inline UIFont * zy_font_helveticaNeue_italic(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-Italic" size:size];
}

static inline UIFont * zy_font_helveticaNeue_light(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-Light" size:size];
}

static inline UIFont * zy_font_helveticaNeue_lightItalic(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:size];
}

static inline UIFont * zy_font_helveticaNeue_thin(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-Thin" size:size];
}

static inline UIFont * zy_font_helveticaNeue_thinItalic(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-ThinItalic" size:size];
}

static inline UIFont * zy_font_helveticaNeue_boldItalic(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-BoldItalic" size:size];
}

static inline UIFont * zy_font_helveticaNeue_medium(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-Medium" size:size];
}

static inline UIFont * zy_font_helveticaNeue_mediumItalic(CGFloat size) {
    return [UIFont fontWithName:@"HelveticaNeue-MediumItalic" size:size];
}

static inline UIFont * zy_font_pingFangSC_thin(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Thin" size:size];
}

static inline UIFont * zy_font_pingFangSC_medium(CGFloat size) {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size];
}

NS_ASSUME_NONNULL_END

