//
//  ZHGUserInfoResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGUserInfoResponseBaseClass.h"
#import "ZHGUserInfoResponseUsers.h"


NSString *const kZHGUserInfoResponseBaseClassUsers = @"users";


@interface ZHGUserInfoResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGUserInfoResponseBaseClass

@synthesize users = _users;


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
    NSObject *receivedZHGUserInfoResponseUsers = [dict objectForKey:kZHGUserInfoResponseBaseClassUsers];
    NSMutableArray *parsedZHGUserInfoResponseUsers = [NSMutableArray array];
    if ([receivedZHGUserInfoResponseUsers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHGUserInfoResponseUsers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHGUserInfoResponseUsers addObject:[ZHGUserInfoResponseUsers modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHGUserInfoResponseUsers isKindOfClass:[NSDictionary class]]) {
       [parsedZHGUserInfoResponseUsers addObject:[ZHGUserInfoResponseUsers modelObjectWithDictionary:(NSDictionary *)receivedZHGUserInfoResponseUsers]];
    }

    self.users = [NSArray arrayWithArray:parsedZHGUserInfoResponseUsers];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    NSMutableArray *tempArrayForUsers = [NSMutableArray array];
    for (NSObject *subArrayObject in self.users) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForUsers addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForUsers addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUsers] forKey:kZHGUserInfoResponseBaseClassUsers];

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

    self.users = [aDecoder decodeObjectForKey:kZHGUserInfoResponseBaseClassUsers];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_users forKey:kZHGUserInfoResponseBaseClassUsers];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGUserInfoResponseBaseClass *copy = [[ZHGUserInfoResponseBaseClass alloc] init];
    
    if (copy) {

        copy.users = [self.users copyWithZone:zone];
    }
    
    return copy;
}


@end
