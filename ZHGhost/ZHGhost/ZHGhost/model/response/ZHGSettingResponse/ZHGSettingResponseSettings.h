//
//  ZHGSettingResponseSettings.h
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGSettingResponseSettings : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double createdBy;
@property (nonatomic, assign) double settingsIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *key;
@property (nonatomic, strong) NSString *value;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *updatedAt;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
