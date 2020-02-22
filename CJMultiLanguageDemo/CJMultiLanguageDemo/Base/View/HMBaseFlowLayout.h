//
//  HMBaseFlowLayout.h
//  LYHM
//
//  Created by chenxiaojie on 2019/8/12.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,AlignType){
    AlignWithLeft,
    AlignWithCenter,
    AlignWithRight
};

/** 已废弃，191113之后使用 HMBaseAlignFlowLayout */
@interface HMBaseFlowLayout : UICollectionViewFlowLayout

- (instancetype)initAndSize:(CGSize)size;

@end

NS_ASSUME_NONNULL_END
