//
//  UIImageView+SDCategory.m
//  ShopMobile
//
//  Created by chenxiaojie on 2019/1/21.
//  Copyright © 2019年 soubao. All rights reserved.
//

#import "UIImageView+SDCategory.h"
#import "UIImageView+WebCache.h"
#import <SDWebImage/SDWebImageDownloader.h>

@implementation UIImageView (SDCategory)

- (void)sd_setFadeImageWithURL:(NSURL *)url
{
    [self sd_setFadeImageWithURL:url placeholderImage:nil options:0 progress:nil completed:nil];
}

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder
{
    [self sd_setFadeImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:nil];
}

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options
{
    [self sd_setFadeImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:nil];
}

- (void)sd_setFadeImageWithURL:(NSURL *)url completed:(SDExternalCompletionBlock)completedBlock
{
    [self sd_setFadeImageWithURL:url placeholderImage:nil options:0 progress:nil completed:completedBlock];
}

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock
{
    [self sd_setFadeImageWithURL:url placeholderImage:placeholder options:0 progress:nil completed:completedBlock];
}

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDExternalCompletionBlock)completedBlock
{
    [self sd_setFadeImageWithURL:url placeholderImage:placeholder options:options progress:nil completed:completedBlock];
}

-(void)sd_setFadeImageWithURL:(NSURL *__nullable)url placeholderImage:(UIImage *__nullable)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock __nullable)progressBlock completed:(SDExternalCompletionBlock __nullable)completedBlock
{
    __weak __typeof(self)wself = self;
    [self sd_setImageWithURL:url placeholderImage:placeholder options:options progress:progressBlock completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        if (image) {
            CATransition *animation = [CATransition animation];
            [animation setDuration:0.5f];
            [animation setType:kCATransitionFade];
            animation.removedOnCompletion = YES;
            [wself.layer addAnimation:animation forKey:@"transition"];
        }
        if (completedBlock) {
            completedBlock(image, error, cacheType, url);
        }
    }];
    [self.layer removeAnimationForKey:@"transition"];
}

@end
