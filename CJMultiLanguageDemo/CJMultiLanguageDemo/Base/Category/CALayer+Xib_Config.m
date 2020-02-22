//
//  CALayer+Xib_Config.m
//  eShop
//
//  Created by kede on 16/9/28.
//  Copyright © 2016年 Keede. All rights reserved.
//

#import "CALayer+Xib_Config.h"

@implementation CALayer (Xib_Config)
@dynamic borderUIColor;
- (void)setBorderUIColor:(UIColor *)borderUIColor
{
    self.borderColor = borderUIColor.CGColor;
}

@end
