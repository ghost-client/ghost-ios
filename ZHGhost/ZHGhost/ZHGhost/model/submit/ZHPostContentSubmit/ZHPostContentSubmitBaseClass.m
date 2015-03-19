//
//  ZHPostContentSubmitBaseClass.m
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHPostContentSubmitBaseClass.h"
#import "ZHPostContentSubmitPosts.h"


NSString *const kZHPostContentSubmitBaseClassPosts = @"posts";


@interface ZHPostContentSubmitBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHPostContentSubmitBaseClass

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
    NSObject *receivedZHPostContentSubmitPosts = [dict objectForKey:kZHPostContentSubmitBaseClassPosts];
    NSMutableArray *parsedZHPostContentSubmitPosts = [NSMutableArray array];
    if ([receivedZHPostContentSubmitPosts isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHPostContentSubmitPosts) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHPostContentSubmitPosts addObject:[ZHPostContentSubmitPosts modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHPostContentSubmitPosts isKindOfClass:[NSDictionary class]]) {
       [parsedZHPostContentSubmitPosts addObject:[ZHPostContentSubmitPosts modelObjectWithDictionary:(NSDictionary *)receivedZHPostContentSubmitPosts]];
    }

    self.posts = [NSArray arrayWithArray:parsedZHPostContentSubmitPosts];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForPosts] forKey:kZHPostContentSubmitBaseClassPosts];

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

    self.posts = [aDecoder decodeObjectForKey:kZHPostContentSubmitBaseClassPosts];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_posts forKey:kZHPostContentSubmitBaseClassPosts];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHPostContentSubmitBaseClass *copy = [[ZHPostContentSubmitBaseClass alloc] init];
    
    if (copy) {

        copy.posts = [self.posts copyWithZone:zone];
    }
    
    return copy;
}


@end
