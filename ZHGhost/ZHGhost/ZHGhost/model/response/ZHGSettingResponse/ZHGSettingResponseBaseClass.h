//
//  ZHGSettingResponseBaseClass.h
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGSettingResponseMeta;

@interface ZHGSettingResponseBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZHGSettingResponseMeta *meta;
@property (nonatomic, strong) NSArray *settings;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
