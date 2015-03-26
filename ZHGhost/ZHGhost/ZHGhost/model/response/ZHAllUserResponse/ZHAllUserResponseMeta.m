//
//  ZHAllUserResponseMeta.m
//
//  Created by  自己联通 on 15/3/26
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHAllUserResponseMeta.h"
#import "ZHAllUserResponsePagination.h"


NSString *const kZHAllUserResponseMetaPagination = @"pagination";


@interface ZHAllUserResponseMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHAllUserResponseMeta

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
            self.pagination = [ZHAllUserResponsePagination modelObjectWithDictionary:[dict objectForKey:kZHAllUserResponseMetaPagination]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.pagination dictionaryRepresentation] forKey:kZHAllUserResponseMetaPagination];

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

    self.pagination = [aDecoder decodeObjectForKey:kZHAllUserResponseMetaPagination];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_pagination forKey:kZHAllUserResponseMetaPagination];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHAllUserResponseMeta *copy = [[ZHAllUserResponseMeta alloc] init];
    
    if (copy) {

        copy.pagination = [self.pagination copyWithZone:zone];
    }
    
    return copy;
}


@end
