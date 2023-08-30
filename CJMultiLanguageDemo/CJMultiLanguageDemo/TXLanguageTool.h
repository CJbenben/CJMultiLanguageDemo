//
//  TXLanguageTool.h
//  CJMultiLanguageDemo
//
//  Created by chenxiaojie on 2020/2/22.
//  Copyright © 2020 chenxiaojie. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define TXGetStringWithKey(key) [[TXLanguageTool sharedInstance] getStringForKey:key]

@interface TXLanguageTool : NSObject

@property (nonatomic,strong,readonly) NSBundle * bundle;

// 单例初始化方法
+ (id) sharedInstance;

// 根据key获取相应的String
- (NSString *) getStringForKey:(NSString *) key;

// 应用内设置新语言
- (void) setNewLanguage:(NSString *) language;

@end

NS_ASSUME_NONNULL_END
