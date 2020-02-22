//
//  UIImage+LaunchImage.m
//  LYHM
//
//  Created by greenleaf on 2019/8/5.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "UIImage+LaunchImage.h"

@implementation UIImage (LaunchImage)

+ (instancetype)getLaunchImage {
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    NSString *orientation = @"Portrait";
    NSString *launchImageName = nil;
    NSArray *imagesDict = [[[NSBundle mainBundle] infoDictionary] valueForKey:@"UILaunchImages"];
    for (NSDictionary *dic in imagesDict) {
        CGSize imageSize = CGSizeFromString(dic[@"UILaunchImageSize"]);
        if (CGSizeEqualToSize(screenSize, imageSize) && [dic[@"UILaunchImageOrientation"] isEqualToString:orientation]) {
            launchImageName = dic[@"UILaunchImageName"];
            break;
        }
    }
    return [UIImage imageNamed:launchImageName];
}



@end
