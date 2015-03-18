//
//  ZHGTokenResponseBaseClass.m
//
//  Created by  自己联通 on 15/3/18
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGTokenResponseBaseClass.h"


NSString *const kZHGTokenResponseBaseClassRefreshToken = @"refresh_token";
NSString *const kZHGTokenResponseBaseClassExpiresIn = @"expires_in";
NSString *const kZHGTokenResponseBaseClassAccessToken = @"access_token";
NSString *const kZHGTokenResponseBaseClassTokenType = @"token_type";


@interface ZHGTokenResponseBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGTokenResponseBaseClass

@synthesize refreshToken = _refreshToken;
@synthesize expiresIn = _expiresIn;
@synthesize accessToken = _accessToken;
@synthesize tokenType = _tokenType;


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
            self.refreshToken = [self objectOrNilForKey:kZHGTokenResponseBaseClassRefreshToken fromDictionary:dict];
            self.expiresIn = [[self objectOrNilForKey:kZHGTokenResponseBaseClassExpiresIn fromDictionary:dict] doubleValue];
            self.accessToken = [self objectOrNilForKey:kZHGTokenResponseBaseClassAccessToken fromDictionary:dict];
            self.tokenType = [self objectOrNilForKey:kZHGTokenResponseBaseClassTokenType fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.refreshToken forKey:kZHGTokenResponseBaseClassRefreshToken];
    [mutableDict setValue:[NSNumber numberWithDouble:self.expiresIn] forKey:kZHGTokenResponseBaseClassExpiresIn];
    [mutableDict setValue:self.accessToken forKey:kZHGTokenResponseBaseClassAccessToken];
    [mutableDict setValue:self.tokenType forKey:kZHGTokenResponseBaseClassTokenType];

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

    self.refreshToken = [aDecoder decodeObjectForKey:kZHGTokenResponseBaseClassRefreshToken];
    self.expiresIn = [aDecoder decodeDoubleForKey:kZHGTokenResponseBaseClassExpiresIn];
    self.accessToken = [aDecoder decodeObjectForKey:kZHGTokenResponseBaseClassAccessToken];
    self.tokenType = [aDecoder decodeObjectForKey:kZHGTokenResponseBaseClassTokenType];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_refreshToken forKey:kZHGTokenResponseBaseClassRefreshToken];
    [aCoder encodeDouble:_expiresIn forKey:kZHGTokenResponseBaseClassExpiresIn];
    [aCoder encodeObject:_accessToken forKey:kZHGTokenResponseBaseClassAccessToken];
    [aCoder encodeObject:_tokenType forKey:kZHGTokenResponseBaseClassTokenType];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGTokenResponseBaseClass *copy = [[ZHGTokenResponseBaseClass alloc] init];
    
    if (copy) {

        copy.refreshToken = [self.refreshToken copyWithZone:zone];
        copy.expiresIn = self.expiresIn;
        copy.accessToken = [self.accessToken copyWithZone:zone];
        copy.tokenType = [self.tokenType copyWithZone:zone];
    }
    
    return copy;
}


@end
