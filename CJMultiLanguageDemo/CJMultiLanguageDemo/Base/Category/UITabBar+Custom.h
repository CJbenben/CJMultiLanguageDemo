//
//  UITabBar+Custom.h
//  LYHM
//
//  Created by greenleaf on 2019/9/18.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITabBar (Custom)
/**
 *  该方法的调用一定要在设置了tabBarItem.badgeValue 之后使用
 */
- (void)badgeViews:(void (^)(UIView *badgeView, UILabel *badgeLabel, UIView *badgeBackground))block;
@end

NS_ASSUME_NONNULL_END
