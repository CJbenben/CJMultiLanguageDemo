//
//  HMBaseAlignFlowLayout.h
//  LYHM
//
//  Created by chenxiaojie on 2019/11/13.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, AlignType){
    AlignWithLeft,
    AlignWithCenter,
    AlignWithRight
};

@interface HMBaseAlignFlowLayout : UICollectionViewFlowLayout

/* 两个Cell之间的距离, 默认值：8 */
@property (nonatomic, assign) CGFloat betweenOfCell;
/* cell对齐方式 默认：左对齐 */
@property (nonatomic, assign) AlignType cellType;

- (instancetype)initWthType:(AlignType)cellType;
/**
@brief 全能初始化方法 其他方式初始化最终都会�走到这里
@param cellType                      对齐方式
@param betweenOfCell            两个Cell之间的距离
@return     FlowLayout
*/
- (instancetype)initWithType:(AlignType) cellType betweenOfCell:(CGFloat)betweenOfCell;

@end

NS_ASSUME_NONNULL_END
