//
//  ZHGContentItemResponseMeta.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGContentItemResponseMeta.h"
#import "ZHGContentItemResponsePagination.h"


NSString *const kZHGContentItemResponseMetaPagination = @"pagination";


@interface ZHGContentItemResponseMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGContentItemResponseMeta

@synthesize pagination = _pagination;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.pagination = [ZHGContentItemResponsePagination modelObjectWithDictionary:[dict objectForKey:kZHGContentItemResponseMetaPagination]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pagination dictionaryRepresentation] forKey:kZHGContentItemResponseMetaPagination];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.pagination = [aDecoder decodeObjectForKey:kZHGContentItemResponseMetaPagination];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pagination forKey:kZHGContentItemResponseMetaPagination];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGContentItemResponseMeta *copy = [[ZHGContentItemResponseMeta alloc] init];
    
    if (copy) {

        copy.pagination = [self.pagination copyWithZone:zone];
    }
    
    return copy;
}


@end
