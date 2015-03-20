//
//  ZHGContentItemResponseBaseClass.h
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGContentItemResponseMeta;

@interface ZHGContentItemResponseBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZHGContentItemResponseMeta *meta;
@property (nonatomic, strong) NSArray *posts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
