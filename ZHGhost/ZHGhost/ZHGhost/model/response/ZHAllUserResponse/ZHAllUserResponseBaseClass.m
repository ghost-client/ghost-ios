//
//  ZHAllUserResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/26
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHAllUserResponseBaseClass.h"
#import "ZHAllUserResponseUsers.h"
#import "ZHAllUserResponseMeta.h"


NSString *const kZHAllUserResponseBaseClassUsers = @"users";
NSString *const kZHAllUserResponseBaseClassMeta = @"meta";


@interface ZHAllUserResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHAllUserResponseBaseClass

@synthesize users = _users;
@synthesize meta = _meta;


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
    NSObject *receivedZHAllUserResponseUsers = [dict objectForKey:kZHAllUserResponseBaseClassUsers];
    NSMutableArray *parsedZHAllUserResponseUsers = [NSMutableArray array];
    if ([receivedZHAllUserResponseUsers isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHAllUserResponseUsers) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHAllUserResponseUsers addObject:[ZHAllUserResponseUsers modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHAllUserResponseUsers isKindOfClass:[NSDictionary class]]) {
       [parsedZHAllUserResponseUsers addObject:[ZHAllUserResponseUsers modelObjectWithDictionary:(NSDictionary *)receivedZHAllUserResponseUsers]];
    }

    self.users = [NSArray arrayWithArray:parsedZHAllUserResponseUsers];
            self.meta = [ZHAllUserResponseMeta modelObjectWithDictionary:[dict objectForKey:kZHAllUserResponseBaseClassMeta]];

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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForUsers] forKey:kZHAllUserResponseBaseClassUsers];
    [mutableDict setValue:[self.meta dictionaryRepresentation] forKey:kZHAllUserResponseBaseClassMeta];

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

    self.users = [aDecoder decodeObjectForKey:kZHAllUserResponseBaseClassUsers];
    self.meta = [aDecoder decodeObjectForKey:kZHAllUserResponseBaseClassMeta];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_users forKey:kZHAllUserResponseBaseClassUsers];
    [aCoder encodeObject:_meta forKey:kZHAllUserResponseBaseClassMeta];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHAllUserResponseBaseClass *copy = [[ZHAllUserResponseBaseClass alloc] init];
    
    if (copy) {

        copy.users = [self.users copyWithZone:zone];
        copy.meta = [self.meta copyWithZone:zone];
    }
    
    return copy;
}


@end
