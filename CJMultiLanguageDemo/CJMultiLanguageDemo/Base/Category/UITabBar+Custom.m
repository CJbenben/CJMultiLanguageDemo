//
//  UITabBar+Custom.m
//  LYHM
//
//  Created by greenleaf on 2019/9/18.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "UITabBar+Custom.h"

@implementation UITabBar (Custom)
/**
 *  该方法的调用一定要在设置了tabBarItem.badgeValue 之后使用
 */
- (void)badgeViews:(void (^)(UIView *badgeView, UILabel *badgeLabel, UIView *badgeBackground))block {
    
    if (block) {
        
        for (UIView *tabBarButton in self.subviews)
        {
            /** 设置badgeView背景色就可设置角标的背景色 */
            for (UIView *badgeView in tabBarButton.subviews)
            {
                NSString *className = NSStringFromClass([badgeView class]);
                
                if ([className rangeOfString:@"BadgeView"].location != NSNotFound)
                {
                    /** badgeLabel 就是角标上数字显示框 */
                    UILabel *badgeLabel;
                    
                    /** badgeBackground 在badgeView上可能不存在，如果存在就可以进行自定义修改 */
                    UIView *badgeBackground;
                    
                    for (UIView *badgeSubview in badgeView.subviews)
                    {
                        NSString *className = NSStringFromClass([badgeSubview class]);
                        
                        if ([badgeSubview isKindOfClass:[UILabel class]])
                        {
                            badgeLabel = (UILabel *)badgeSubview;
                            
                        } else if ([className rangeOfString:@"BadgeBackground"].location != NSNotFound) {
                            
                            badgeBackground = badgeSubview;
                        }
                    }
                    
                    block(badgeView, badgeLabel, badgeBackground);
                }
            }
        }
    }
}
@end
