//
//  HMBaseAlignFlowLayout.m
//  LYHM
//
//  Created by chenxiaojie on 2019/11/13.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "HMBaseAlignFlowLayout.h"

@interface HMBaseAlignFlowLayout()
/* 在居中对齐的时候需要知道这行所有cell的宽度总和 */
@property (nonatomic, assign) CGFloat sumCellWidth;
@end

@implementation HMBaseAlignFlowLayout

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.headerReferenceSize = CGSizeZero;
    self.footerReferenceSize = CGSizeZero;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.minimumLineSpacing = 0;//上下边距
    self.minimumInteritemSpacing = 0;//左右边距
    self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    
    _cellType = AlignWithLeft;
}

- (instancetype)init {
    return [self initWithType:AlignWithLeft betweenOfCell:8.0];
}

- (void)setBetweenOfCell:(CGFloat)betweenOfCell{
    _betweenOfCell = betweenOfCell;
    self.minimumInteritemSpacing = betweenOfCell;
}

-(instancetype)initWthType:(AlignType)cellType{
    return [self initWithType:cellType betweenOfCell:8.0];
}

-(instancetype)initWithType:(AlignType)cellType betweenOfCell:(CGFloat)betweenOfCell{
    self = [super init];
    if (self){
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        _betweenOfCell = betweenOfCell;
        _cellType = cellType;
    }
    return self;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSArray * layoutAttributes_t = [super layoutAttributesForElementsInRect:rect];
    NSArray * layoutAttributes = [[NSArray alloc]initWithArray:layoutAttributes_t copyItems:YES];
    //用来临时存放一行的Cell数组
    NSMutableArray * layoutAttributesTemp = [[NSMutableArray alloc]init];
    for (NSUInteger index = 0; index < layoutAttributes.count ; index++) {
        
        UICollectionViewLayoutAttributes *currentAttr = layoutAttributes[index]; // 当前cell的位置信息
        UICollectionViewLayoutAttributes *previousAttr = index == 0 ? nil : layoutAttributes[index-1]; // 上一个cell 的位置信
        UICollectionViewLayoutAttributes *nextAttr = index + 1 == layoutAttributes.count ?
        nil : layoutAttributes[index+1];//下一个cell 位置信息
        
        //加入临时数组
        [layoutAttributesTemp addObject:currentAttr];
        self.sumCellWidth += currentAttr.frame.size.width;
        
        CGFloat previousY = previousAttr == nil ? 0 : CGRectGetMaxY(previousAttr.frame);
        CGFloat currentY = CGRectGetMaxY(currentAttr.frame);
        CGFloat nextY = nextAttr == nil ? 0 : CGRectGetMaxY(nextAttr.frame);
        //如果当前cell是单独一行
        if (currentY != previousY && currentY != nextY){
            if ([currentAttr.representedElementKind isEqualToString:UICollectionElementKindSectionHeader]) {
                [layoutAttributesTemp removeAllObjects];
                self.sumCellWidth = 0.0;
            }else if ([currentAttr.representedElementKind isEqualToString:UICollectionElementKindSectionFooter]){
                [layoutAttributesTemp removeAllObjects];
                self.sumCellWidth = 0.0;
            }else{
                [self setCellFrameWith:layoutAttributesTemp];
            }
        }
        //如果下一个cell在本行，这开始调整Frame位置
        else if( currentY != nextY) {
            [self setCellFrameWith:layoutAttributesTemp];
        }
    }
    return layoutAttributes;
}

//调整属于同一行的cell的位置frame
- (void)setCellFrameWith:(NSMutableArray*)layoutAttributes {
    CGFloat nowWidth = 0.0;
    switch (_cellType) {
        case AlignWithLeft:
            nowWidth = self.sectionInset.left;
            for (UICollectionViewLayoutAttributes * attributes in layoutAttributes) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.betweenOfCell;
            }
            self.sumCellWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
            
        case AlignWithCenter:
            nowWidth = (self.collectionView.frame.size.width - self.sumCellWidth - ((layoutAttributes.count - 1) * _betweenOfCell)) / 2;
            for (UICollectionViewLayoutAttributes * attributes in layoutAttributes) {
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth;
                attributes.frame = nowFrame;
                nowWidth += nowFrame.size.width + self.betweenOfCell;
            }
            self.sumCellWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
            
        case AlignWithRight:
            nowWidth = self.collectionView.frame.size.width - self.sectionInset.right;
            for (NSInteger index = layoutAttributes.count - 1 ; index >= 0 ; index-- ) {
                UICollectionViewLayoutAttributes * attributes = layoutAttributes[index];
                CGRect nowFrame = attributes.frame;
                nowFrame.origin.x = nowWidth - nowFrame.size.width;
                attributes.frame = nowFrame;
                nowWidth = nowWidth - nowFrame.size.width - _betweenOfCell;
            }
            self.sumCellWidth = 0.0;
            [layoutAttributes removeAllObjects];
            break;
    }
}

@end
