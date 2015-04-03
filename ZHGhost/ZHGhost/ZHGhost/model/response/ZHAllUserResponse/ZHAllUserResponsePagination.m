//
//  ZHAllUserResponsePagination.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHAllUserResponsePagination.h"


NSString *const kZHAllUserResponsePaginationPrev = @"prev";
NSString *const kZHAllUserResponsePaginationPages = @"pages";
NSString *const kZHAllUserResponsePaginationLimit = @"limit";
NSString *const kZHAllUserResponsePaginationNext = @"next";
NSString *const kZHAllUserResponsePaginationTotal = @"total";
NSString *const kZHAllUserResponsePaginationPage = @"page";


@interface ZHAllUserResponsePagination ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHAllUserResponsePagination

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
            self.prev = [[self objectOrNilForKey:kZHAllUserResponsePaginationPrev fromDictionary:dict] doubleValue];
            self.pages = [[self objectOrNilForKey:kZHAllUserResponsePaginationPages fromDictionary:dict] doubleValue];
            self.limit = [[self objectOrNilForKey:kZHAllUserResponsePaginationLimit fromDictionary:dict] doubleValue];
            self.next = [[self objectOrNilForKey:kZHAllUserResponsePaginationNext fromDictionary:dict] doubleValue];
            self.total = [[self objectOrNilForKey:kZHAllUserResponsePaginationTotal fromDictionary:dict] doubleValue];
            self.page = [[self objectOrNilForKey:kZHAllUserResponsePaginationPage fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.prev] forKey:kZHAllUserResponsePaginationPrev];
    [mutableDict setValue:[NSNumber numberWithDouble:self.pages] forKey:kZHAllUserResponsePaginationPages];
    [mutableDict setValue:[NSNumber numberWithDouble:self.limit] forKey:kZHAllUserResponsePaginationLimit];
    [mutableDict setValue:[NSNumber numberWithDouble:self.next] forKey:kZHAllUserResponsePaginationNext];
    [mutableDict setValue:[NSNumber numberWithDouble:self.total] forKey:kZHAllUserResponsePaginationTotal];
    [mutableDict setValue:[NSNumber numberWithDouble:self.page] forKey:kZHAllUserResponsePaginationPage];

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

    self.prev = [aDecoder decodeDoubleForKey:kZHAllUserResponsePaginationPrev];
    self.pages = [aDecoder decodeDoubleForKey:kZHAllUserResponsePaginationPages];
    self.limit = [aDecoder decodeDoubleForKey:kZHAllUserResponsePaginationLimit];
    self.next = [aDecoder decodeDoubleForKey:kZHAllUserResponsePaginationNext];
    self.total = [aDecoder decodeDoubleForKey:kZHAllUserResponsePaginationTotal];
    self.page = [aDecoder decodeDoubleForKey:kZHAllUserResponsePaginationPage];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_prev forKey:kZHAllUserResponsePaginationPrev];
    [aCoder encodeDouble:_pages forKey:kZHAllUserResponsePaginationPages];
    [aCoder encodeDouble:_limit forKey:kZHAllUserResponsePaginationLimit];
    [aCoder encodeDouble:_next forKey:kZHAllUserResponsePaginationNext];
    [aCoder encodeDouble:_total forKey:kZHAllUserResponsePaginationTotal];
    [aCoder encodeDouble:_page forKey:kZHAllUserResponsePaginationPage];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHAllUserResponsePagination *copy = [[ZHAllUserResponsePagination alloc] init];
    
    if (copy) {

        copy.prev = self.prev;
        copy.pages = self.pages;
        copy.limit = self.limit;
        copy.next = self.next;
        copy.total = self.total;
        copy.page = self.page;
    }
    
    return copy;
}


@end
