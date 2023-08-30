//
//  TXLanguageTool.m
//  CJMultiLanguageDemo
//
//  Created by chenxiaojie on 2020/2/22.
//  Copyright © 2020 chenxiaojie. All rights reserved.
//

#import "TXLanguageTool.h"
#define Language_Key @"languageKey"
#define Chinese_Simple @"zh-Hans"
#define Chinese_Traditional @"zh-Hant"
#define English_US @"en"

@implementation TXLanguageTool

+ (id)sharedInstance
{
    static dispatch_once_t onceToken;
    static TXLanguageTool * languageTool;
    dispatch_once(&onceToken, ^{
        
        languageTool = [[TXLanguageTool alloc] init];
    
        
    });
    return languageTool;
}

// 根据语言名获取bundle
- (NSBundle *)bundle
{
    NSString * setLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:Language_Key];
    //默认是简体中文
    if (setLanguage == nil) {
        setLanguage = Chinese_Simple;
    }
    NSString * bundlePath = [[NSBundle mainBundle] pathForResource:setLanguage ofType:@"lproj"];
    
    return [NSBundle bundleWithPath:bundlePath];
}

// 根据key获取value
- (NSString *)getStringForKey:(NSString *)key
{
    NSBundle * bundle = [[TXLanguageTool sharedInstance] bundle];
    if (bundle) {
        
        return NSLocalizedStringFromTableInBundle(key, @"Localizable", bundle, @"HelloWord");
    }
    return NSLocalizedString(key, @"HelloWord");
}

- (void)setNewLanguage:(NSString *)language
{
    NSString * setLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:Language_Key];
    if ([language isEqualToString:setLanguage]) {
        return;
    }
    // 简体中文
    else if ([language isEqualToString:Chinese_Simple]) {
        [[NSUserDefaults standardUserDefaults] setObject:Chinese_Simple forKey:Language_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    // 繁体中文
    else if ([language isEqualToString:Chinese_Traditional]) {
        [[NSUserDefaults standardUserDefaults] setObject:Chinese_Traditional forKey:Language_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    // 英文
    else if ([language isEqualToString:English_US]) {
        [[NSUserDefaults standardUserDefaults] setObject:English_US forKey:Language_Key];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    // 发送更新语言的通知，用于重新设置Window的RootViewController
    [[NSNotificationCenter defaultCenter] postNotificationName:@"UpDateLanguageUI" object:nil];
}

@end
