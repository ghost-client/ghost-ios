//
//  ZHGTagsResponsePagination.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGTagsResponsePagination.h"


NSString *const kZHGTagsResponsePaginationPrev = @"prev";
NSString *const kZHGTagsResponsePaginationPages = @"pages";
NSString *const kZHGTagsResponsePaginationLimit = @"limit";
NSString *const kZHGTagsResponsePaginationNext = @"next";
NSString *const kZHGTagsResponsePaginationTotal = @"total";
NSString *const kZHGTagsResponsePaginationPage = @"page";


@interface ZHGTagsResponsePagination ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGTagsResponsePagination

@synthesize prev = _prev;
@synthesize pages = _pages;
@synthesize limit = _limit;
@synthesize next = _next;
@synthesize total = _total;
@synthesize page = _page;


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
            self.prev = [self objectOrNilForKey:kZHGTagsResponsePaginationPrev fromDictionary:dict];
            self.pages = [[self objectOrNilForKey:kZHGTagsResponsePaginationPages fromDictionary:dict] doubleValue];
            self.limit = [[self objectOrNilForKey:kZHGTagsResponsePaginationLimit fromDictionary:dict] doubleValue];
            self.next = [[self objectOrNilForKey:kZHGTagsResponsePaginationNext fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kZHGTagsResponsePaginationTotal fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kZHGTagsResponsePaginationPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.prev forKey:kZHGTagsResponsePaginationPrev];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kZHGTagsResponsePaginationPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limit] forKey:kZHGTagsResponsePaginationLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.next] forKey:kZHGTagsResponsePaginationNext];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kZHGTagsResponsePaginationTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kZHGTagsResponsePaginationPage];

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

    self.prev = [aDecoder decodeObjectForKey:kZHGTagsResponsePaginationPrev];
    self.pages = [aDecoder decodeDoubleForKey:kZHGTagsResponsePaginationPages];
    self.limit = [aDecoder decodeDoubleForKey:kZHGTagsResponsePaginationLimit];
    self.next = [aDecoder decodeDoubleForKey:kZHGTagsResponsePaginationNext];
    self.total = [aDecoder decodeDoubleForKey:kZHGTagsResponsePaginationTotal];
    self.page = [aDecoder decodeDoubleForKey:kZHGTagsResponsePaginationPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_prev forKey:kZHGTagsResponsePaginationPrev];
    [aCoder encodeDouble:_pages forKey:kZHGTagsResponsePaginationPages];
    [aCoder encodeDouble:_limit forKey:kZHGTagsResponsePaginationLimit];
    [aCoder encodeDouble:_next forKey:kZHGTagsResponsePaginationNext];
    [aCoder encodeDouble:_total forKey:kZHGTagsResponsePaginationTotal];
    [aCoder encodeDouble:_page forKey:kZHGTagsResponsePaginationPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGTagsResponsePagination *copy = [[ZHGTagsResponsePagination alloc] init];
    
    if (copy) {

        copy.prev = [self.prev copyWithZone:zone];
        copy.pages = self.pages;
        copy.limit = self.limit;
        copy.next = self.next;
        copy.total = self.total;
        copy.page = self.page;
    }
    
    return copy;
}


@end
