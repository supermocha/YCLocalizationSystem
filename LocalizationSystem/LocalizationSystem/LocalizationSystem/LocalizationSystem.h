//
//  LocalizationSystem.h
//  LocalizationSystem
//
//  Created by Yuchi Chen on 2017/2/8.
//  Copyright © 2017年 Yuchi Chen. All rights reserved.
//

#define YCLocalizedString(key) \
[[LocalizationSystem sharedInstance] localizedStringForKey:(key) value:@"UNDEFINED KEY" table:nil]

#define YCLocalizedStringFromTable(key, tbl) \
[[LocalizationSystem sharedInstance] localizedStringForKey:(key) value:@"UNDEFINED KEY" table:(tbl)]

#define YCLocalizedStringWithDefaultValue(key, tbl, val) \
[[LocalizationSystem sharedInstance] localizedStringForKey:(key) value:(val) table:(tbl)]

#define YCSetLanguage(lang) \
[[LocalizationSystem sharedInstance] setLanguage:(lang)]

#define YCDeviceLanguage \
[[LocalizationSystem sharedInstance] deviceLanguage]

#import <Foundation/Foundation.h>

@interface LocalizationSystem : NSObject

+ (LocalizationSystem *)sharedInstance;
- (NSString *)deviceLanguage;
- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName;
- (void)setLanguage:(NSString *)lang;

@end
