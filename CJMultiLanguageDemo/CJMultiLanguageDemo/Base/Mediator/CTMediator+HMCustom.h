//
//  CTMediator+HMCustom.h
//  LYHM
//
//  Created by chenxiaojie on 2019/9/21.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import <CTMediator/CTMediator.h>

NS_ASSUME_NONNULL_BEGIN

@interface CTMediator (HMCustom)

/**
 @brief 进入客服
 @param targetId    技能组id
 */
- (void)CTMediator_customClickActionWithTargetId:(NSString *)targetId;

@end

NS_ASSUME_NONNULL_END
