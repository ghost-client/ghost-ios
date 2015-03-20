//
//  ZHCreatTagsResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHCreatTagsResponseBaseClass.h"
#import "ZHCreatTagsResponseTags.h"


NSString *const kZHCreatTagsResponseBaseClassTags = @"tags";


@interface ZHCreatTagsResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHCreatTagsResponseBaseClass

@synthesize tags = _tags;


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
    NSObject *receivedZHCreatTagsResponseTags = [dict objectForKey:kZHCreatTagsResponseBaseClassTags];
    NSMutableArray *parsedZHCreatTagsResponseTags = [NSMutableArray array];
    if ([receivedZHCreatTagsResponseTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHCreatTagsResponseTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHCreatTagsResponseTags addObject:[ZHCreatTagsResponseTags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHCreatTagsResponseTags isKindOfClass:[NSDictionary class]]) {
       [parsedZHCreatTagsResponseTags addObject:[ZHCreatTagsResponseTags modelObjectWithDictionary:(NSDictionary *)receivedZHCreatTagsResponseTags]];
    }

    self.tags = [NSArray arrayWithArray:parsedZHCreatTagsResponseTags];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kZHCreatTagsResponseBaseClassTags];

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

    self.tags = [aDecoder decodeObjectForKey:kZHCreatTagsResponseBaseClassTags];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_tags forKey:kZHCreatTagsResponseBaseClassTags];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHCreatTagsResponseBaseClass *copy = [[ZHCreatTagsResponseBaseClass alloc] init];
    
    if (copy) {

        copy.tags = [self.tags copyWithZone:zone];
    }
    
    return copy;
}


@end
