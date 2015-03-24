//
//  ZHGTagsResponseBaseClass.h
//
//  Created by  自己联通 on 15/3/24
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGTagsResponseMeta;

@interface ZHGTagsResponseBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZHGTagsResponseMeta *meta;
@property (nonatomic, strong) NSArray *tags;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
