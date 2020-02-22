//
//  CTMediator+HMCustom.m
//  LYHM
//
//  Created by chenxiaojie on 2019/9/21.
//  Copyright © 2019 chenxiaojie. All rights reserved.
//

#import "CTMediator+HMCustom.h"
#import "CJCategoryKit.h"
#import "CJCommonKit.h"
NSString * const kHMCustomClickMediatorTarget      = @"Custom";
NSString * const kHMCustomClickMediatorAction      = @"customClickAction";

@implementation CTMediator (HMCustom)

- (void)CTMediator_customClickActionWithTargetId:(NSString *)targetId {
    if (targetId.length) {
        NSMutableDictionary *params = [NSMutableDictionary dictionary];
        EncodeUnEmptyObjctToDic(params, targetId, @"targetId");
        
        [self performTarget:kHMCustomClickMediatorTarget
                     action:kHMCustomClickMediatorAction
                     params:params
          shouldCacheTarget:NO];
    } else {
#ifdef kDevTest
        //[[HMUtils getCurrentViewController] showHUDMessage:@"此模块未配置图片，请联系 server 配置图片"];
#endif
    }
}

@end
