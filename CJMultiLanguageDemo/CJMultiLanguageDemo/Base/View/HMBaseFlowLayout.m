//
//  HMBaseFlowLayout.m
//  LYHM
//
//  Created by chenxiaojie on 2019/8/12.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "HMBaseFlowLayout.h"

@implementation HMBaseFlowLayout

- (instancetype)init {
    if (self = [super init]) {
        self.headerReferenceSize = CGSizeZero;
        self.footerReferenceSize = CGSizeZero;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

- (instancetype)initAndSize:(CGSize)size {
    if (self = [super init]) {
        self.headerReferenceSize = CGSizeZero;
        self.footerReferenceSize = CGSizeZero;
        self.scrollDirection = UICollectionViewScrollDirectionVertical;
        
        self.itemSize = size;
        self.minimumLineSpacing = 0;
        self.minimumInteritemSpacing = 0;
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    }
    return self;
}

@end
