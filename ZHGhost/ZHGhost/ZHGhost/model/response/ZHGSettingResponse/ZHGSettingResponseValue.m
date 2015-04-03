//
//  ZHGSettingResponseValue.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGSettingResponseValue.h"
#import "ZHGSettingResponsePackage.h"


NSString *const kZHGSettingResponseValueName = @"name";
NSString *const kZHGSettingResponseValuePackage = @"package";
NSString *const kZHGSettingResponseValueActive = @"active";


@interface ZHGSettingResponseValue ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGSettingResponseValue

@synthesize name = _name;
@synthesize package = _package;
@synthesize active = _active;


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
            self.name = [self objectOrNilForKey:kZHGSettingResponseValueName fromDictionary:dict];
            self.package = [ZHGSettingResponsePackage modelObjectWithDictionary:[dict objectForKey:kZHGSettingResponseValuePackage]];
            self.active = [[self objectOrNilForKey:kZHGSettingResponseValueActive fromDictionary:dict] boolValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.name forKey:kZHGSettingResponseValueName];
    [mutableDict setValue:[self.package dictionaryRepresentation] forKey:kZHGSettingResponseValuePackage];
    [mutableDict setValue:[NSNumber numberWithBool:self.active] forKey:kZHGSettingResponseValueActive];

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

    self.name = [aDecoder decodeObjectForKey:kZHGSettingResponseValueName];
    self.package = [aDecoder decodeObjectForKey:kZHGSettingResponseValuePackage];
    self.active = [aDecoder decodeBoolForKey:kZHGSettingResponseValueActive];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_name forKey:kZHGSettingResponseValueName];
    [aCoder encodeObject:_package forKey:kZHGSettingResponseValuePackage];
    [aCoder encodeBool:_active forKey:kZHGSettingResponseValueActive];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGSettingResponseValue *copy = [[ZHGSettingResponseValue alloc] init];
    
    if (copy) {

        copy.name = [self.name copyWithZone:zone];
        copy.package = [self.package copyWithZone:zone];
        copy.active = self.active;
    }
    
    return copy;
}


@end
