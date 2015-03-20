//
//  ZHGTagsResponseMeta.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGTagsResponseMeta.h"
#import "ZHGTagsResponsePagination.h"


NSString *const kZHGTagsResponseMetaPagination = @"pagination";


@interface ZHGTagsResponseMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGTagsResponseMeta

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
            self.pagination = [ZHGTagsResponsePagination modelObjectWithDictionary:[dict objectForKey:kZHGTagsResponseMetaPagination]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pagination dictionaryRepresentation] forKey:kZHGTagsResponseMetaPagination];

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

    self.pagination = [aDecoder decodeObjectForKey:kZHGTagsResponseMetaPagination];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pagination forKey:kZHGTagsResponseMetaPagination];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGTagsResponseMeta *copy = [[ZHGTagsResponseMeta alloc] init];
    
    if (copy) {

        copy.pagination = [self.pagination copyWithZone:zone];
    }
    
    return copy;
}


@end
