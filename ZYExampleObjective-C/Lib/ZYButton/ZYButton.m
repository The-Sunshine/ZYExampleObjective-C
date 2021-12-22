//
//  ZYButton.h
//  ZYExampleObjective-C
//
//

#import "ZYButton.h"
#if __has_include(<Masonry/Masonry.h>)
#import <Masonry.h>
#else
#import "Masonry.h"
#endif

@interface ZYButton ()

@property (nonatomic, strong) UIImageView * imageView;

@property (nonatomic, strong) UILabel * titleLabel;

@property (nonatomic, assign) ZYButtonImagePositionType imagePositionType;

@property (nonatomic, assign) CGSize imageSize;

@property (nonatomic, assign) CGFloat topOrLeftSpace;

@property (nonatomic, assign) CGFloat imageLabelSpace;

@end

@implementation ZYButton
{
    UIImage * _normalImage;
    BOOL _closeCheckButtonSize;
    BOOL _selectedDisabled;
}

- (instancetype)initWithImage:(UIImage *)image
                        title:(NSString *)title
            imagePositionType:(ZYButtonImagePositionType)imagePositionType
                    imageSize:(CGSize)imageSize
               topOrLeftSpace:(CGFloat)topOrLeftSpace
              imageLabelSpace:(CGFloat)imageLabelSpace {
    self = [super init];
    if (self) {
        _normalImage = image;
        _imagePositionType = imagePositionType;
        _imageSize = imageSize;
        _topOrLeftSpace = topOrLeftSpace;
        _imageLabelSpace = imageLabelSpace;
        [self initUIWithImage:image title:title];
    }
    return self;
}

- (void)initUIWithImage:(UIImage *)image
                  title:(NSString *)title {
    
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(click)];
    [self addGestureRecognizer:tap];

    UIImageView * imageView = UIImageView.new;
    [self addSubview:imageView];
    imageView.image = image;
    imageView.userInteractionEnabled = true;
    _imageView = imageView;
    
    UILabel * titleLabel = UILabel.new;
    [self addSubview:titleLabel];
    titleLabel.text = title;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    _titleLabel = titleLabel;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        if (!CGSizeEqualToSize(self.imageSize, CGSizeZero)) {
            make.width.offset(self.imageSize.width);
            make.height.offset(self.imageSize.height);
        }
        
        switch (self.imagePositionType) {
            case ZYButtonImagePositionTypeImageLeft:
                make.left.offset(self.topOrLeftSpace);
                make.centerY.equalTo(self);
                break;
            case ZYButtonImagePositionTypeImageRight:
                make.left.equalTo(self.titleLabel.mas_right).offset(self.imageLabelSpace);
                make.centerY.equalTo(self);
                break;
            case ZYButtonImagePositionTypeImageTop:
                make.top.offset(self.topOrLeftSpace);
                make.centerX.equalTo(self);
                break;
            case ZYButtonImagePositionTypeImageBottom:
                make.top.equalTo(self.titleLabel.mas_bottom).offset(self.imageLabelSpace);
                make.centerX.equalTo(self);
                break;
            default:
                break;
        }
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        switch (self.imagePositionType) {
            case ZYButtonImagePositionTypeImageLeft:
                make.left.equalTo(self.imageView.mas_right).offset(self.imageLabelSpace);
                make.centerY.equalTo(self);
                break;
            case ZYButtonImagePositionTypeImageRight:
                make.left.offset(self.topOrLeftSpace);
                make.centerY.equalTo(self);
                break;
            case ZYButtonImagePositionTypeImageTop:
                make.top.equalTo(self.imageView.mas_bottom).offset(self.imageLabelSpace);
                make.centerX.equalTo(self);
                break;
            case ZYButtonImagePositionTypeImageBottom:
                make.top.offset(self.topOrLeftSpace);
                make.centerX.equalTo(self);
                break;
            default:
                break;
        }
    }];

    
#ifdef DEBUG
    [self checkButtonSize];
#endif
}

#pragma mark - checkSize
- (void)closeDebugCheckButtonSize {
    _closeCheckButtonSize = true;
}

- (void)checkButtonSize {
    if (_closeCheckButtonSize) return;
        
    [self layoutIfNeeded];

    switch (_imagePositionType) {
        case ZYButtonImagePositionTypeImageTop:
        case ZYButtonImagePositionTypeImageBottom: {
            CGFloat height = _imageView.frame.size.height + _titleLabel.frame.size.height + _topOrLeftSpace + _imageLabelSpace;
            if (height > self.frame.size.height) {
                NSLog(@"建议高度大于%lf",height);
                NSAssert(height < self.frame.size.height, @"ZYButton高度超出了预设范围，会导致超出预设范围无法点击的问题，请重新设置高度，建议高度查询*建议宽度大于*");
            }
        }
            break;
        case ZYButtonImagePositionTypeImageLeft:
        case ZYButtonImagePositionTypeImageRight: {
            CGFloat width = _imageView.frame.size.width + _titleLabel.frame.size.width + _topOrLeftSpace + _imageLabelSpace;
            if (width > self.frame.size.width) {
                NSLog(@"建议宽度大于%lf",width);
                NSAssert(width < self.frame.size.width, @"ZYButton布局后的宽度超出了预设范围，会导致超出预设范围无法点击的问题，请重新设置宽度，建议宽度请查询*建议宽度大于*");
            }
        }
            break;
        default:
            break;
    }
}

#pragma mark - event
- (void)click {
    if (_selectedDisabled && self.isSelected) return;
    if (self.selectedImage) self.isSelected = !self.isSelected;
    !self.clickBlock ?:self.clickBlock();
}

- (void)selectedDisabled {
    _selectedDisabled = true;
}

#pragma mark - setter
- (void)setTitleLabelFont:(UIFont *)titleLabelFont {
    _titleLabelFont = titleLabelFont;
    _titleLabel.font = titleLabelFont;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor {
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}

- (void)setSelectedImage:(UIImage *)selectedImage {
    _selectedImage = selectedImage;
    if (self.isSelected) _imageView.image = selectedImage;
}

- (void)setIsSelected:(BOOL)isSelected {
    _isSelected = isSelected;
    _imageView.image = self.isSelected ? self.selectedImage : _normalImage;
}

@end
