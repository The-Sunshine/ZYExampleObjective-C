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
whiteView.cornerRadius = <#radius#>;
whiteView.layer.masksToBounds = true;
whiteView.backgroundColor = <#color#>;
[whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.offset(0);
    make.top.offset(0);
    make.right.offset(0);
    make.bottom.offset(0);
}];
 
*/

/// UIImageView
/*
UIImageView * imageBGView = UIImageView.new;
[self addSubview:imageBGView];
imageBGView.cornerRadius = <#radius#>;
imageBGView.layer.masksToBounds = true;
imageBGView.backgroundColor = <#color#>;
[imageBGView mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.offset(0);
    make.top.offset(0);
    make.right.offset(0);
    make.bottom.offset(0);
}];
 */

/// UILabel
/*
UILabel * titleLabel = UILabel.new;
[whiteView addSubview:titleLabel];
titleLabel.text = <#text#>;
titleLabel.textAlignment = NSTextAlignmentCenter;
titleLabel.textColor = <#color#>;
titleLabel.font = <#font#>;
[titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.offset(0);
    make.top.offset(0);
    make.right.offset(0);
    make.bottom.offset(0);
}];
*/

/// UIButton
/*
UIButton * sureButton = UIButton.new;
[whiteView addSubview:sureButton];
[sureButton setTitle:<#text#> forState:UIControlStateNormal];
[sureButton setTitleColor:<#color#> forState:UIControlStateNormal];
[sureButton addTarget:self action:@selector(<#sel#>) forControlEvents:UIControlEventTouchUpInside];
sureButton.cornerRadius = <#radius#>;
sureButton.layer.masksToBounds = true;
sureButton.titleLabel.font = <#font#>;
sureButton.backgroundColor = <#color#>;
[sureButton mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.offset(0);
    make.top.offset(0);
    make.right.offset(0);
    make.bottom.offset(0);
}];
*/

/// UITextField
/*
UITextField * textField = UITextField.new;
[searchView addSubview:textField];
textField.placeholder = @"<#placeholder#>";
textField.textColor = <#color#>;
textField.font = <#font#>;
textField.backgroundColor = <#color#>;
// [textField becomeFirstResponder];
[textField addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
[textField mas_makeConstraints:^(MASConstraintMaker *make) {
    make.left.offset(0);
    make.top.offset(0);
    make.right.offset(0);
    make.bottom.offset(0);
 }];
- (void)textFieldChanged:(UITextField *)textField {}
 
 */

/// 懒加载
/*
@property (strong, nonatomic) UIButton * deleteButton;

- (UIButton *)deleteButton {
    if (!_deleteButton) {
        UIButton * button = UIButton.new;
        [self.view addSubview:button];
        _deleteButton = button;
        [button setTitle:<#text#> forState:UIControlStateNormal];
        [button setTitleColor:<#color#> forState:UIControlStateNormal];
        button.titleLabel.font = <#font#>;
        button.backgroundColor = <#color#>;
        [button addTarget:self action:@selector(<#sel#>) forControlEvents:UIControlEventTouchUpInside];
        button.cornerRadius = <#radius#>;
        button.layer.masksToBounds = true;
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(0);
            make.top.offset(0);
            make.right.offset(0);
            make.bottom.offset(0);
        }];
    }
    return _deleteButton;
}
*/




#endif /* ZYUIExample_h */
