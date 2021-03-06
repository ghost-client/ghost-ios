//
//  ZHGContentItemResponseMeta.h
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHGContentItemResponsePagination;

@interface ZHGContentItemResponseMeta : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) ZHGContentItemResponsePagination *pagination;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
