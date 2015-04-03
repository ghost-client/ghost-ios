//
//  ZHGSettingResponseMeta.h
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGSettingResponseFilters;

@interface ZHGSettingResponseMeta : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZHGSettingResponseFilters *filters;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
