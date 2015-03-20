//
//  ZHGTagsResponseMeta.h
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGTagsResponsePagination;

@interface ZHGTagsResponseMeta : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZHGTagsResponsePagination *pagination;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
