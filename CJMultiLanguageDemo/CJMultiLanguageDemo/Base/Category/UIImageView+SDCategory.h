//
//  UIImageView+SDCategory.h
//  ShopMobile
//
//  Created by chenxiaojie on 2019/1/21.
//  Copyright © 2019年 soubao. All rights reserved.
//  https://www.jianshu.com/p/7d759aec1bee

#import <UIKit/UIKit.h>
#import "SDWebImageManager.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (SDCategory)

- (void)sd_setFadeImageWithURL:(NSURL *)url;

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options;

- (void)sd_setFadeImageWithURL:(NSURL *)url completed:(SDExternalCompletionBlock)completedBlock;

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder completed:(SDExternalCompletionBlock)completedBlock;

- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options completed:(SDExternalCompletionBlock)completedBlock;

//- (void)sd_setFadeImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder options:(SDWebImageOptions)options progress:(SDWebImageDownloaderProgressBlock)progressBlock completed:(SDExternalCompletionBlock)completedBlock;

@end

NS_ASSUME_NONNULL_END
