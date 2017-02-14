//
//  LocalizationSystem.m
//  LocalizationSystem
//
//  Created by Yuchi Chen on 2017/2/8.
//  Copyright © 2017年 Yuchi Chen. All rights reserved.
//

#import "LocalizationSystem.h"

static NSString *kPreferredLanguage = @"PreferredLanguage";
static NSString *kDeviceLanguage = @"DeviceLanguage";

@interface LocalizationSystem()
{
    NSBundle *bundle;
    NSUserDefaults *userDefaults;
}
@end

@implementation LocalizationSystem

+ (LocalizationSystem *)sharedInstance
{
    static LocalizationSystem *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[LocalizationSystem alloc] init];
    });
    return instance;
}

- (id)init
{
    self = [super init];
    if (self) {
        bundle = [NSBundle mainBundle];
        userDefaults = [NSUserDefaults standardUserDefaults];
        
        if ([userDefaults objectForKey:kPreferredLanguage]) {
            self.language = [userDefaults objectForKey:kPreferredLanguage];
        }
        else {
            NSString *currentDeviceLangugae = [[NSLocale preferredLanguages] firstObject];
            [userDefaults setObject:currentDeviceLangugae forKey:kDeviceLanguage];
            [userDefaults synchronize];
            self.language = currentDeviceLangugae;
        }
    }
    return self;
}

- (NSString *)deviceLanguage
{
    return [[NSLocale preferredLanguages] firstObject];
}

- (void)setLanguage:(NSString *)language
{
    _language = language;
    
    NSString *currentDeviceLangugae = [[NSLocale preferredLanguages] firstObject];
    NSString *deviceLangugae = [userDefaults objectForKey:kDeviceLanguage];
    if (![currentDeviceLangugae isEqualToString:deviceLangugae]) {
        [userDefaults setObject:currentDeviceLangugae forKey:kDeviceLanguage];
        [userDefaults synchronize];
        _language = currentDeviceLangugae;
    }
    
    [userDefaults setObject:_language forKey:kPreferredLanguage];
    [userDefaults synchronize];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:_language ofType:@"lproj"];
    if (path) {
        bundle = [NSBundle bundleWithPath:path];
    }
    else {
        bundle = [NSBundle mainBundle];
    }
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    @try {
        return [bundle localizedStringForKey:key value:value table:tableName];
    }
    @catch (NSException *exception) {
        
    }
    return key;
}

@end
