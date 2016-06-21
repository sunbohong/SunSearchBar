//
//  SunViewController.m
//  SunSearchBar
//
//  Created by sunbohong on 06/16/2016.
//  Copyright (c) 2016 sunbohong. All rights reserved.
//

#import "SunViewController.h"

#import <SunSearchBar/SunSearchBar.h>

#import <YYKit/YYKit.h>
#import <Masonry/Masonry.h>

@interface SunViewController ()

@end

@implementation SunViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    SunSearchBar *bar = [SunSearchBar new];

    bar.textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"请输入搜索内容" attributes:@{
                                               NSForegroundColorAttributeName:[UIColor lightGrayColor],
                                           }];

    NSArray *titles = @[@"二手房", @"出租房", @"新房"];
    bar.titleButton.titleLabel.text = @"二手房";
    __weak typeof(bar) weakBar      = bar;

    bar.titlePressBlock = ^(NSString *title){
        NSLog(@"点击了%@", title);
        __strong typeof(bar) strongBar = weakBar;
        strongBar.titleButton.titleLabel.text = titles[([titles indexOfObject:title]+1)%titles.count];
    };


    [self.view addSubview:bar];

    [bar mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.right.equalTo(@0);
         make.top.equalTo(@20);
         make.height.equalTo(@48);
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
