//
//  ZHGSettingResponsePackage.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGSettingResponsePackage.h"


NSString *const kZHGSettingResponsePackageName = @"name";
NSString *const kZHGSettingResponsePackageVersion = @"version";


@interface ZHGSettingResponsePackage ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGSettingResponsePackage

@synthesize name = _name;
@synthesize version = _version;


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
            self.name = [self objectOrNilForKey:kZHGSettingResponsePackageName fromDictionary:dict];
            self.version = [self objectOrNilForKey:kZHGSettingResponsePackageVersion fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kZHGSettingResponsePackageName];
    [mutableDict setValue:self.version forKey:kZHGSettingResponsePackageVersion];

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

    self.name = [aDecoder decodeObjectForKey:kZHGSettingResponsePackageName];
    self.version = [aDecoder decodeObjectForKey:kZHGSettingResponsePackageVersion];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kZHGSettingResponsePackageName];
    [aCoder encodeObject:_version forKey:kZHGSettingResponsePackageVersion];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGSettingResponsePackage *copy = [[ZHGSettingResponsePackage alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.version = [self.version copyWithZone:zone];
    }
    
    return copy;
}


@end
