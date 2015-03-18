//
//  ZHFailedErrors.m
//
//  Created by  自己联通 on 15/3/18
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHFailedErrors.h"


NSString *const kZHFailedErrorsMessage = @"message";
NSString *const kZHFailedErrorsType = @"type";


@interface ZHFailedErrors ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHFailedErrors

@synthesize message = _message;
@synthesize type = _type;


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
            self.message = [self objectOrNilForKey:kZHFailedErrorsMessage fromDictionary:dict];
            self.type = [self objectOrNilForKey:kZHFailedErrorsType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.message forKey:kZHFailedErrorsMessage];
    [mutableDict setValue:self.type forKey:kZHFailedErrorsType];

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

    self.message = [aDecoder decodeObjectForKey:kZHFailedErrorsMessage];
    self.type = [aDecoder decodeObjectForKey:kZHFailedErrorsType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_message forKey:kZHFailedErrorsMessage];
    [aCoder encodeObject:_type forKey:kZHFailedErrorsType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHFailedErrors *copy = [[ZHFailedErrors alloc] init];
    
    if (copy) {

        copy.message = [self.message copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
    }
    
    return copy;
}


@end
