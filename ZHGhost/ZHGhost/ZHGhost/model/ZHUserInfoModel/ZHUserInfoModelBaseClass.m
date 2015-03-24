//
//  ZHUserInfoModelBaseClass.m
//
//  Created by  自己联通 on 15/3/24
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHUserInfoModelBaseClass.h"


NSString *const kZHUserInfoModelBaseClassToken = @"Token";
NSString *const kZHUserInfoModelBaseClassPassWord = @"passWord";
NSString *const kZHUserInfoModelBaseClassHost = @"host";
NSString *const kZHUserInfoModelBaseClassExpresionIN = @"expresionIN";
NSString *const kZHUserInfoModelBaseClassUserName = @"userName";


@interface ZHUserInfoModelBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHUserInfoModelBaseClass

@synthesize token = _token;
@synthesize passWord = _passWord;
@synthesize host = _host;
@synthesize expresionIN = _expresionIN;
@synthesize userName = _userName;


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
            self.token = [self objectOrNilForKey:kZHUserInfoModelBaseClassToken fromDictionary:dict];
            self.passWord = [self objectOrNilForKey:kZHUserInfoModelBaseClassPassWord fromDictionary:dict];
            self.host = [self objectOrNilForKey:kZHUserInfoModelBaseClassHost fromDictionary:dict];
            self.expresionIN = [self objectOrNilForKey:kZHUserInfoModelBaseClassExpresionIN fromDictionary:dict];
            self.userName = [self objectOrNilForKey:kZHUserInfoModelBaseClassUserName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.token forKey:kZHUserInfoModelBaseClassToken];
    [mutableDict setValue:self.passWord forKey:kZHUserInfoModelBaseClassPassWord];
    [mutableDict setValue:self.host forKey:kZHUserInfoModelBaseClassHost];
    [mutableDict setValue:self.expresionIN forKey:kZHUserInfoModelBaseClassExpresionIN];
    [mutableDict setValue:self.userName forKey:kZHUserInfoModelBaseClassUserName];

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

    self.token = [aDecoder decodeObjectForKey:kZHUserInfoModelBaseClassToken];
    self.passWord = [aDecoder decodeObjectForKey:kZHUserInfoModelBaseClassPassWord];
    self.host = [aDecoder decodeObjectForKey:kZHUserInfoModelBaseClassHost];
    self.expresionIN = [aDecoder decodeObjectForKey:kZHUserInfoModelBaseClassExpresionIN];
    self.userName = [aDecoder decodeObjectForKey:kZHUserInfoModelBaseClassUserName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_token forKey:kZHUserInfoModelBaseClassToken];
    [aCoder encodeObject:_passWord forKey:kZHUserInfoModelBaseClassPassWord];
    [aCoder encodeObject:_host forKey:kZHUserInfoModelBaseClassHost];
    [aCoder encodeObject:_expresionIN forKey:kZHUserInfoModelBaseClassExpresionIN];
    [aCoder encodeObject:_userName forKey:kZHUserInfoModelBaseClassUserName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHUserInfoModelBaseClass *copy = [[ZHUserInfoModelBaseClass alloc] init];
    
    if (copy) {

        copy.token = [self.token copyWithZone:zone];
        copy.passWord = [self.passWord copyWithZone:zone];
        copy.host = [self.host copyWithZone:zone];
        copy.expresionIN = [self.expresionIN copyWithZone:zone];
        copy.userName = [self.userName copyWithZone:zone];
    }
    
    return copy;
}


@end
