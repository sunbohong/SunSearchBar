
//
//  SunSearchBar.m
//  SunSearchBar
//
//  Created by sunbohong on 16/6/16.
//  Copyright © 2016年 sunbohong. All rights reserved.
//

#import "SunSearchBar.h"

#import <Masonry/Masonry.h>

static NSString *SunSearchBar_buttonImageName = @"SunSearchBar_buttonImage";
static NSBundle *SunSearchBarResourceBundle;

@implementation SunUIButton {
    UILabel *_titleLabel;
    UIImageView *_imageView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {

        _titleLabel = [UILabel new];

        _titleLabel.font      = [UIFont systemFontOfSize:13];
        _titleLabel.textColor = [UIColor whiteColor];

        UIImage *image = [UIImage imageNamed:SunSearchBar_buttonImageName];
        if(!image) {
            image = [UIImage imageNamed:SunSearchBar_buttonImageName inBundle:[self resourcesBundle] compatibleWithTraitCollection:nil];
        }
        _imageView = [[UIImageView alloc] initWithImage:image];

        [self addSubview:_titleLabel];
        [self addSubview:_imageView];

        self.translatesAutoresizingMaskIntoConstraints = NO;

        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.top.equalTo(@8);
             make.bottom.equalTo(@-8);
         }];

        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(@8);
             make.bottom.right.equalTo(@-8);
             make.left.equalTo(_titleLabel.mas_right).offset(8);
         }];
    }
    return self;
}

#pragma mark - private

- (NSBundle *)resourcesBundle {
    if(SunSearchBarResourceBundle) {
        return SunSearchBarResourceBundle;
    } else{
        NSBundle *classBundle = [NSBundle bundleForClass:[self class]];
        SunSearchBarResourceBundle = [NSBundle bundleWithPath:[classBundle pathForResource:@"SunSearchBar" ofType:@"bundle"]];
        if(SunSearchBarResourceBundle == nil) {

            SunSearchBarResourceBundle = classBundle;
        }
    }
    return SunSearchBarResourceBundle;
}

@end


@implementation SunSearchBar {
    SunUIButton *_titleButton;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        super.backgroundColor = [UIColor whiteColor];

        _titleButton = [SunUIButton new];
        _titleButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _titleButton.imageView.contentMode = UIViewContentModeCenter;
        _titleButton.titleLabel.textColor  = [UIColor blackColor];
        _titleButton.titleLabel.text = @"全部";
        [_titleButton addTarget:self action:@selector(titleButtonPress:) forControlEvents:UIControlEventTouchUpInside];


        _textField = [UITextField new];

        _textField.font            = [UIFont systemFontOfSize:13];
        _textField.leftView        = _titleButton;
        _textField.delegate        = self;
        _textField.textColor       = [UIColor  blackColor];
        _textField.borderStyle     = UITextBorderStyleRoundedRect;
        _textField.leftViewMode    = UITextFieldViewModeAlways;
        _textField.returnKeyType   = UIReturnKeySearch;
        _textField.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _textField.clearButtonMode = UITextFieldViewModeWhileEditing;

        _rightButton = [UIButton buttonWithType:UIButtonTypeCustom];

        _rightButton.layer.cornerRadius    = 5;
        _rightButton.titleLabel.font       = [UIFont systemFontOfSize:16];
        _rightButton.contentEdgeInsets     = UIEdgeInsetsMake(0, 16, 0, 16);
        _rightButton.layer.backgroundColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.2 alpha:1.0].CGColor;

        [_rightButton setTitle:@"搜索" forState:UIControlStateNormal];
        [_rightButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_rightButton addTarget:self action:@selector(rightButtonPressed:) forControlEvents:UIControlEventTouchUpInside];


        [self addSubview:_rightButton];

        [_rightButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [_rightButton setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
        [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(@4);
             make.bottom.equalTo(@-4);
             make.right.equalTo(@-4);
         }];

        [self addSubview:_textField];

        [_textField mas_makeConstraints:^(MASConstraintMaker *make) {
             make.left.top.equalTo(@4);
             make.bottom.equalTo(@-4);
             make.right.equalTo(_rightButton.mas_left).offset(-4);
         }];
    }
    return self;
}

#pragma mark - action

- (void)titleButtonPress:(UIButton *)sender {
    if(self.titlePressBlock) {
        self.titlePressBlock(_titleButton.titleLabel.text);
    }
}

- (void)rightButtonPressed:(UIButton *)sender {
    NSString *keyworkd = _textField.text;
    if(self.rightButtonBlock) {
        self.rightButtonBlock(keyworkd);
    }
    [self endEditing:YES];
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self endEditing:YES];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if(self.searchBlock) {
        self.searchBlock(self.textField.text);
    }
}

@end
