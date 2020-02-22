//
//  HMBaseModel.h
//  LYHM
//
//  Created by chenxiaojie on 2019/8/5.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HMBaseModel : NSObject

///** 跳转类型 0:H5,1:原生 */
//@property (nonatomic, strong) NSString *jumpType;
/** 跳转h5 */
@property (nonatomic, strong) NSString *jumpUrl;
/** 跳转原生参数 */
@property (nonatomic, strong) NSString *jumpParam;

@end

NS_ASSUME_NONNULL_END
