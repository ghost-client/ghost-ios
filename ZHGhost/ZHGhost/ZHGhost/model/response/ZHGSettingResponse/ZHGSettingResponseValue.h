//
//  ZHGSettingResponseValue.h
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGSettingResponsePackage;

@interface ZHGSettingResponseValue : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) ZHGSettingResponsePackage *package;
@property (nonatomic, assign) BOOL active;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
