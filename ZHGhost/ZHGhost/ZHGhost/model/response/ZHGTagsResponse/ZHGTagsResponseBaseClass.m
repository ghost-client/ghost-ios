//
//  ZHGTagsResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGTagsResponseBaseClass.h"
#import "ZHGTagsResponseMeta.h"
#import "ZHGTagsResponseTags.h"


NSString *const kZHGTagsResponseBaseClassMeta = @"meta";
NSString *const kZHGTagsResponseBaseClassTags = @"tags";


@interface ZHGTagsResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGTagsResponseBaseClass

@synthesize meta = _meta;
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
            self.meta = [ZHGTagsResponseMeta modelObjectWithDictionary:[dict objectForKey:kZHGTagsResponseBaseClassMeta]];
    NSObject *receivedZHGTagsResponseTags = [dict objectForKey:kZHGTagsResponseBaseClassTags];
    NSMutableArray *parsedZHGTagsResponseTags = [NSMutableArray array];
    if ([receivedZHGTagsResponseTags isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHGTagsResponseTags) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHGTagsResponseTags addObject:[ZHGTagsResponseTags modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHGTagsResponseTags isKindOfClass:[NSDictionary class]]) {
       [parsedZHGTagsResponseTags addObject:[ZHGTagsResponseTags modelObjectWithDictionary:(NSDictionary *)receivedZHGTagsResponseTags]];
    }

    self.tags = [NSArray arrayWithArray:parsedZHGTagsResponseTags];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kZHGTagsResponseBaseClassMeta];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kZHGTagsResponseBaseClassTags];

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

    self.meta = [aDecoder decodeObjectForKey:kZHGTagsResponseBaseClassMeta];
    self.tags = [aDecoder decodeObjectForKey:kZHGTagsResponseBaseClassTags];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_meta forKey:kZHGTagsResponseBaseClassMeta];
    [aCoder encodeObject:_tags forKey:kZHGTagsResponseBaseClassTags];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGTagsResponseBaseClass *copy = [[ZHGTagsResponseBaseClass alloc] init];
    
    if (copy) {

        copy.meta = [self.meta copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
    }
    
    return copy;
}


@end
