//
//  ZYButton.h
//  ZYExampleObjective-C
//
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, ZYButtonImagePositionType) {
    ZYButtonImagePositionTypeImageLeft,     /// 图片在左，文字在右
    ZYButtonImagePositionTypeImageRight,    /// 图片在右，文字在左
    ZYButtonImagePositionTypeImageTop,      /// 图片在上，文字在下
    ZYButtonImagePositionTypeImageBottom,   /// 图片在下，文字在上
};


typedef void(^ZYButtonBlock)(void);
@interface ZYButton : UIView

/// 初始化
/// @param image 图片
/// @param title 文字
/// @param imagePositionType 文字字体位置
/// @param imageSize 图片尺寸 如设置为CGSizeZero，则自适应尺寸
/// @param topOrLeftSpace 距左侧或上方的距离
/// @param imageLabelSpace 图片与文字间距
- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
            imagePositionType:(ZYButtonImagePositionType)imagePositionType
                    imageSize:(CGSize)imageSize
               topOrLeftSpace:(CGFloat)topOrLeftSpace
              imageLabelSpace:(CGFloat)imageLabelSpace;

/// 文字字体
@property (nonatomic, strong) UIFont * titleLabelFont;

/// 文字颜色
@property (nonatomic, strong) UIColor * titleLabelTextColor;

/// 选中图片
@property (nonatomic, strong) UIImage * selectedImage;

/// 选中状态
@property (nonatomic, assign) BOOL isSelected;

/// 选中状态不可点击
- (void)selectedDisabled;

/// 点击回调
@property (nonatomic, copy) ZYButtonBlock clickBlock;

/// 关闭DEBUG预设宽高检测
- (void)closeDebugCheckButtonSize;

@end

NS_ASSUME_NONNULL_END
