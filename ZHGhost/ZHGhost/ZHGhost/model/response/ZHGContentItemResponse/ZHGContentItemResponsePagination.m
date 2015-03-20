//
//  ZHGContentItemResponsePagination.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGContentItemResponsePagination.h"


NSString *const kZHGContentItemResponsePaginationPrev = @"prev";
NSString *const kZHGContentItemResponsePaginationPages = @"pages";
NSString *const kZHGContentItemResponsePaginationLimit = @"limit";
NSString *const kZHGContentItemResponsePaginationNext = @"next";
NSString *const kZHGContentItemResponsePaginationTotal = @"total";
NSString *const kZHGContentItemResponsePaginationPage = @"page";


@interface ZHGContentItemResponsePagination ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGContentItemResponsePagination

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
            self.prev = [self objectOrNilForKey:kZHGContentItemResponsePaginationPrev fromDictionary:dict];
            self.pages = [[self objectOrNilForKey:kZHGContentItemResponsePaginationPages fromDictionary:dict] doubleValue];
            self.limit = [[self objectOrNilForKey:kZHGContentItemResponsePaginationLimit fromDictionary:dict] doubleValue];
            self.next = [self objectOrNilForKey:kZHGContentItemResponsePaginationNext fromDictionary:dict];
            self.total = [[self objectOrNilForKey:kZHGContentItemResponsePaginationTotal fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kZHGContentItemResponsePaginationPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.prev forKey:kZHGContentItemResponsePaginationPrev];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kZHGContentItemResponsePaginationPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limit] forKey:kZHGContentItemResponsePaginationLimit];
    [mutableDict setValue:self.next forKey:kZHGContentItemResponsePaginationNext];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kZHGContentItemResponsePaginationTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kZHGContentItemResponsePaginationPage];

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

    self.prev = [aDecoder decodeObjectForKey:kZHGContentItemResponsePaginationPrev];
    self.pages = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePaginationPages];
    self.limit = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePaginationLimit];
    self.next = [aDecoder decodeObjectForKey:kZHGContentItemResponsePaginationNext];
    self.total = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePaginationTotal];
    self.page = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePaginationPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_prev forKey:kZHGContentItemResponsePaginationPrev];
    [aCoder encodeDouble:_pages forKey:kZHGContentItemResponsePaginationPages];
    [aCoder encodeDouble:_limit forKey:kZHGContentItemResponsePaginationLimit];
    [aCoder encodeObject:_next forKey:kZHGContentItemResponsePaginationNext];
    [aCoder encodeDouble:_total forKey:kZHGContentItemResponsePaginationTotal];
    [aCoder encodeDouble:_page forKey:kZHGContentItemResponsePaginationPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGContentItemResponsePagination *copy = [[ZHGContentItemResponsePagination alloc] init];
    
    if (copy) {

        copy.prev = [self.prev copyWithZone:zone];
        copy.pages = self.pages;
        copy.limit = self.limit;
        copy.next = [self.next copyWithZone:zone];
        copy.total = self.total;
        copy.page = self.page;
    }
    
    return copy;
}


@end
