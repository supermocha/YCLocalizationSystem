//
//  LocalizationSystem.m
//  LocalizationSystem
//
//  Created by Yuchi Chen on 2017/2/8.
//  Copyright © 2017年 Yuchi Chen. All rights reserved.
//

#import "LocalizationSystem.h"

@interface LocalizationSystem()

@property (nonatomic, strong) NSBundle *bundle;

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
        self.bundle = [NSBundle mainBundle];
        [self setLanguage:[[NSLocale preferredLanguages] firstObject]];
    }
    return self;
}

- (NSString *)deviceLanguage
{
    return [[NSLocale preferredLanguages] firstObject];
}

- (void)setLanguage:(NSString *)lang
{
    NSString *path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"];
    if (path) {
        self.bundle = [NSBundle bundleWithPath:path];
    }
    if ([lang rangeOfString:@"-"].location != NSNotFound) {
        lang = [[lang componentsSeparatedByString:@"-"] firstObject];
        path = [[NSBundle mainBundle] pathForResource:lang ofType:@"lproj"];
        if (path) {
            self.bundle = [NSBundle bundleWithPath:path];
        }
    }
}

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    @try {
        return [self.bundle localizedStringForKey:key value:value table:tableName];
    }
    @catch (NSException *exception) {
        
    }
    return key;
}

@end
