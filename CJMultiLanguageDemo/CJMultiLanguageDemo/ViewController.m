//
//  ViewController.m
//  CJMultiLanguageDemo
//
//  Created by chenxiaojie on 2020/2/21.
//  Copyright © 2020 chenxiaojie. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "AppDelegate.h"

@interface ViewController ()

@property (nonatomic, strong) UILabel *testLabel;

@end

@implementation ViewController

- (UILabel *)testLabel {
    if (_testLabel == nil) {
        _testLabel = [[UILabel alloc] init];
    }
    return _testLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.testLabel];
    self.testLabel.text = NSLocalizedString(@"test_text", @"");
    
    [self.testLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.mas_equalTo(self.view);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
}


@end
