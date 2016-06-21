//
//  SunSearchBar.h
//  SunSearchBar
//
//  Created by sunbohong on 16/6/16.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SunUIButton : UIControl

@property (nonatomic, readonly, strong) UILabel *titleLabel;
@property (nonatomic, readonly, strong) UIImageView *imageView;

@end

@interface SunSearchBar : UIView<UITextFieldDelegate>

@property (nonatomic, readonly, strong) SunUIButton *titleButton;
@property (nonatomic, readonly, strong) UITextField *textField;
@property (nonatomic, readonly, strong) UIButton *rightButton;

@property (nonatomic, copy) void (^titlePressBlock)(NSString *title);
@property (nonatomic, copy) void (^searchBlock)(NSString *keyword);
@property (nonatomic, copy) void (^rightButtonBlock)(NSString *title);

@end
