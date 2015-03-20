//
//  ZHGContentItemResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGContentItemResponseBaseClass.h"
#import "ZHGContentItemResponseMeta.h"
#import "ZHGContentItemResponsePosts.h"


NSString *const kZHGContentItemResponseBaseClassMeta = @"meta";
NSString *const kZHGContentItemResponseBaseClassPosts = @"posts";


@interface ZHGContentItemResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGContentItemResponseBaseClass

@synthesize meta = _meta;
@synthesize posts = _posts;


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
            self.meta = [ZHGContentItemResponseMeta modelObjectWithDictionary:[dict objectForKey:kZHGContentItemResponseBaseClassMeta]];
    NSObject *receivedZHGContentItemResponsePosts = [dict objectForKey:kZHGContentItemResponseBaseClassPosts];
    NSMutableArray *parsedZHGContentItemResponsePosts = [NSMutableArray array];
    if ([receivedZHGContentItemResponsePosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHGContentItemResponsePosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHGContentItemResponsePosts addObject:[ZHGContentItemResponsePosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHGContentItemResponsePosts isKindOfClass:[NSDictionary class]]) {
       [parsedZHGContentItemResponsePosts addObject:[ZHGContentItemResponsePosts modelObjectWithDictionary:(NSDictionary *)receivedZHGContentItemResponsePosts]];
    }

    self.posts = [NSArray arrayWithArray:parsedZHGContentItemResponsePosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kZHGContentItemResponseBaseClassMeta];
    NSMutableArray *tempArrayForPosts = [NSMutableArray array];
    for (NSObject *subArrayObject in self.posts) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForPosts addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForPosts addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPosts] forKey:kZHGContentItemResponseBaseClassPosts];

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

    self.meta = [aDecoder decodeObjectForKey:kZHGContentItemResponseBaseClassMeta];
    self.posts = [aDecoder decodeObjectForKey:kZHGContentItemResponseBaseClassPosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_meta forKey:kZHGContentItemResponseBaseClassMeta];
    [aCoder encodeObject:_posts forKey:kZHGContentItemResponseBaseClassPosts];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGContentItemResponseBaseClass *copy = [[ZHGContentItemResponseBaseClass alloc] init];
    
    if (copy) {

        copy.meta = [self.meta copyWithZone:zone];
        copy.posts = [self.posts copyWithZone:zone];
    }
    
    return copy;
}


@end
