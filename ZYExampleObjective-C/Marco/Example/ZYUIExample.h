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
    make.top.offset(0);
    make.center.equalTo(self.view).offset(0);
}];
 
*/

/// UIImageView
/*
UIImageView * imageBGView = UIImageView.new;
[self addSubview:imageBGView];
imageBGView.cornerRadius = 5;
imageBGView.layer.masksToBounds = true;
imageBGView.backgroundColor = UIColor.whiteColor;
[imageBGView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.offset(0);
    make.top.offset(0);
    make.center.equalTo(self.view).offset(0);
 }];
 */

/// UILabel
/*
UILabel * titleLabel = UILabel.new;
[whiteView addSubview:titleLabel];
titleLabel.text = @"";
titleLabel.textAlignment = NSTextAlignmentCenter;
titleLabel.textColor = UIColor.redColor;
titleLabel.font = PingFangSCRegularSize(14);;
[titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.offset(0);
    make.top.offset(0);
    make.center.equalTo(self.view).offset(0);
 
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
sureButton.backgroundColor = UIColor.redColor;
[sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.right.bottom.offset(0);
    make.top.offset(0);
    make.center.equalTo(self.view).offset(0);
}];
*/

/// 懒加载
/*
@property (strong, nonatomic) UIButton * deleteButton;

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        _deleteButton = UIButton.new;
        [self.view addSubview:_deleteButton];
        [_deleteButton addTarget:self action:@selector(sureClilck) forControlEvents:UIControlEventTouchUpInside];
        [_deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
        }];
    }
    return _deleteButton;
}
*/




#endif /* ZYUIExample_h */
