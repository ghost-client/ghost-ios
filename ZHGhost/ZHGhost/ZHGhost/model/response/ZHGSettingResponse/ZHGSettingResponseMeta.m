//
//  ZHGSettingResponseMeta.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGSettingResponseMeta.h"
#import "ZHGSettingResponseFilters.h"


NSString *const kZHGSettingResponseMetaFilters = @"filters";


@interface ZHGSettingResponseMeta ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGSettingResponseMeta

@synthesize filters = _filters;


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
            self.filters = [ZHGSettingResponseFilters modelObjectWithDictionary:[dict objectForKey:kZHGSettingResponseMetaFilters]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.filters dictionaryRepresentation] forKey:kZHGSettingResponseMetaFilters];

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

    self.filters = [aDecoder decodeObjectForKey:kZHGSettingResponseMetaFilters];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_filters forKey:kZHGSettingResponseMetaFilters];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGSettingResponseMeta *copy = [[ZHGSettingResponseMeta alloc] init];
    
    if (copy) {

        copy.filters = [self.filters copyWithZone:zone];
    }
    
    return copy;
}


@end
