//
//  ZYUIExample.h
//  ZYExampleObjective-C
//
//  Created by zy on 2021/12/1.
//

#ifndef ZYUIExample_h
#define ZYUIExample_h

/// UIView
/*
UIView * whiteView = UIView.new;
[self addSubview:whiteView];
whiteView.cornerRadius = 10;
whiteView.layer.masksToBounds = true;
whiteView.backgroundColor = UIColor.whiteColor;
[whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.offset(0);
    make.top.offset(34);
}];
*/

/// UIImageView
/*
UIImageView * imageBGView = UIImageView.new;
[self addSubview:imageBGView];
imageBGView.cornerRadius = 62.5 / 2;
imageBGView.layer.masksToBounds = true;
imageBGView.backgroundColor = UIColor.whiteColor;
[imageBGView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.width.height.offset(62.5);
    make.top.offset(0);
    make.centerX.equalTo(self);
}];
 */

/// UILabel
/*
UILabel * titleLabel = UILabel.new;
[whiteView addSubview:titleLabel];
titleLabel.text = @"清除缓存4MB";
titleLabel.textAlignment = NSTextAlignmentCenter;
titleLabel.textColor = RGBCOLOR(156, 156, 156);
titleLabel.font = PingFangSCRegularSize(19.5);
[titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.offset(37);
    make.left.right.offset(0);
}];
*/

/// UIButton
/*
UIButton * sureButton = UIButton.new;
[whiteView addSubview:sureButton];
[sureButton setTitle:@"确定" forState:UIControlStateNormal];
[sureButton addTarget:self action:@selector(sureClilck) forControlEvents:UIControlEventTouchUpInside];
sureButton.cornerRadius = 5;
sureButton.layer.masksToBounds = true;
sureButton.titleLabel.font = PingFangSCRegularSize(14);
sureButton.backgroundColor = RGBCOLOR(85, 85, 85);
[sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.top.equalTo(contentLabel.mas_bottom).offset(14);
    make.left.right.equalTo(contentLabel);
    make.height.offset(34);
}];
*/

/// 懒加载
/*
@property (strong, nonatomic) UIButton * deleteButton;

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = UIButton.new;
        [self.view addSubview:_deleteButton];
        [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        }];
    }
    return _deleteButton;
}
*/




#endif /* ZYUIExample_h */
