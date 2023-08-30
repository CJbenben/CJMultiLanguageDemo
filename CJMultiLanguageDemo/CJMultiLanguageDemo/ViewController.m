//
//  ViewController.m
//  CJMultiLanguageDemo
//
//  Created by chenxiaojie on 2020/2/21.
//  Copyright © 2020 chenxiaojie. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "TXLanguageTool.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *testLabel;
@property (nonatomic, strong) UILabel *testLabel2;

@end

@implementation ViewController

- (UILabel *)testLabel {
    if (_testLabel == nil) {
        _testLabel = [[UILabel alloc] init];
    }
    return _testLabel;
}

- (UILabel *)testLabel2 {
    if (_testLabel2 == nil) {
        _testLabel2 = [[UILabel alloc] init];
    }
    return _testLabel2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testLabel];
    [self.view addSubview:self.testLabel2];
    self.testLabel.text = NSLocalizedString(@"test_text", @"手机系统语言设置");
    self.testLabel2.text = TXGetStringWithKey(@"company_name");
    
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.view).offset(150);
    }];
    [self.testLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.mas_equalTo(self.testLabel).offset(150);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


@end
