//
//  HMTabBarController.m
//  LYHM
//
//  Created by greenleaf on 2019/8/9.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "HMTabBarController.h"
#import "HMBaseNaviViewController.h"
#import "TXHomeViewController.h"
#import "TXPersonViewController.h"
//#import "HMLoginViewController.h"
//#import "UITabBar+Custom.h"
#import <AVKit/AVKit.h>
typedef enum {
    TabbarItemTag_Type0 = 0,
    TabbarItemTag_Type1,
    TabbarItemTag_Type2,
    TabbarItemTag_Type3,
    TabbarItemTag_Type4
}TabbarItemTag;

@interface HMTabBarController () <UITabBarControllerDelegate>

@end

@implementation HMTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    CGFloat systemVolume = [[AVAudioSession sharedInstance] outputVolume];
    [CJDefaultTool setDefaultsValue:@(systemVolume) for:@"systemVolume"];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(volumeChange:) name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];

    [self setRootViewControllers];
}

- (void)volumeChange:(NSNotification *)notification {
    NSString *volume = [notification.userInfo objectForKey:@"AVSystemController_AudioVolumeNotificationParameter"];
    NSLog(@"FlyElephant-系统音量:%@", volume);
    if ([volume floatValue]) {
        [CJDefaultTool setDefaultsValue:@([volume floatValue]) for:@"systemVolume"];
    }
}

- (void)setRootViewControllers {
    //设置TabBarItem的文字样式
    NSDictionary *textAttrs = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    NSDictionary *selectedTextAttrs = @{NSForegroundColorAttributeName:RGBCOLOR(220, 195, 144)};
    
    
    TXHomeViewController *homeVC = [[TXHomeViewController alloc] init];
    HMBaseNaviViewController *homeNavC = [[HMBaseNaviViewController alloc] initWithRootViewController:homeVC];
    
    UITabBarItem *tabHome = [[UITabBarItem alloc] initWithTitle:@"首页"
                                                          image:[[UIImage imageNamed:@"ic_tabbar_home_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                  selectedImage:[[UIImage imageNamed:@"ic_tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tabHome.tag = TabbarItemTag_Type0;
    [tabHome setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [tabHome setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    homeNavC.tabBarItem = tabHome;
    
    //我的
    TXPersonViewController *mineVC = [[TXPersonViewController alloc] init];
    HMBaseNaviViewController *mineNavC = [[HMBaseNaviViewController alloc] initWithRootViewController:mineVC];
    UITabBarItem *tabMine = [[UITabBarItem alloc] initWithTitle:@"我的"
                                                          image:[[UIImage imageNamed:@"ic_tabbar_mine_normal"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]
                                                  selectedImage:[[UIImage imageNamed:@"ic_tabbar_mine_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    tabMine.tag = TabbarItemTag_Type4;
    [tabMine setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [tabMine setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    mineNavC.tabBarItem = tabMine;
    
    self.viewControllers = @[homeNavC, mineNavC];
    self.tabBar.translucent = NO;
    if (@available(iOS 10.0, *)) {
        self.tabBar.unselectedItemTintColor = [UIColor blackColor];
    }
    self.delegate = self;
}

#pragma mark - UITabBarControllerDelegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    return YES;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"AVSystemController_SystemVolumeDidChangeNotification" object:nil];
}
@end
