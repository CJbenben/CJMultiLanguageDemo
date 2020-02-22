//
//  UIImage+ImgSize.h
//  ShopMobile
//
//  Created by greenleaf on 2019/1/22.
//  Copyright © 2019 soubao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (ImgSize)

/**
@brief 根据图片url获取网络图片尺寸（缺点：卡顿）
@param URL          网络图片地址，可为 NSURL or NSString 类型
*/
+ (CGSize)getImageSizeWithURL:(id)URL;

/**
 @brief  根据图片url获取网络图片尺寸（缺点：需要 sd 先加载此图片后才可以获取到）
 @param URLStr          网络图片地址，可为 NSURL or NSString 类型
 */
+ (CGSize)getImageSizeWithURLStr:(id)URLStr;

/**
@brief  获取视频第一帧图片
@param path          网络视频地址， NSURL  类型
*/
+ (UIImage*)getVideoFirstViewImage:(NSURL *)path;

+ (UIImage *)base64StrToUIImage:(NSString *)encodedImageStr;

+ (UIImage *)imageAddLocalImage:(UIImage *)useImage addMsakImage:(UIImage *)maskImage addFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
