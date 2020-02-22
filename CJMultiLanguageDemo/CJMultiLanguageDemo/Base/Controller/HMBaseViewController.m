//
//  HMBaseViewController.m
//  LYHM
//
//  Created by chenxiaojie on 2019/8/5.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "HMBaseViewController.h"

@interface HMBaseViewController ()

@end

@implementation HMBaseViewController

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.backImage = [UIImage imageNamed:@"ic_public_navi_back"];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
@end
