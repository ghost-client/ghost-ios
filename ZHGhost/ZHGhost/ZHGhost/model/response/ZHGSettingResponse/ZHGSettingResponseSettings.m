//
//  ZHGSettingResponseSettings.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGSettingResponseSettings.h"


NSString *const kZHGSettingResponseSettingsCreatedBy = @"created_by";
NSString *const kZHGSettingResponseSettingsId = @"id";
NSString *const kZHGSettingResponseSettingsCreatedAt = @"created_at";
NSString *const kZHGSettingResponseSettingsUpdatedBy = @"updated_by";
NSString *const kZHGSettingResponseSettingsUuid = @"uuid";
NSString *const kZHGSettingResponseSettingsKey = @"key";
NSString *const kZHGSettingResponseSettingsValue = @"value";
NSString *const kZHGSettingResponseSettingsType = @"type";
NSString *const kZHGSettingResponseSettingsUpdatedAt = @"updated_at";


@interface ZHGSettingResponseSettings ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGSettingResponseSettings

@synthesize createdBy = _createdBy;
@synthesize settingsIdentifier = _settingsIdentifier;
@synthesize createdAt = _createdAt;
@synthesize updatedBy = _updatedBy;
@synthesize uuid = _uuid;
@synthesize key = _key;
@synthesize value = _value;
@synthesize type = _type;
@synthesize updatedAt = _updatedAt;


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
            self.createdBy = [[self objectOrNilForKey:kZHGSettingResponseSettingsCreatedBy fromDictionary:dict] doubleValue];
            self.settingsIdentifier = [[self objectOrNilForKey:kZHGSettingResponseSettingsId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kZHGSettingResponseSettingsCreatedAt fromDictionary:dict];
            self.updatedBy = [[self objectOrNilForKey:kZHGSettingResponseSettingsUpdatedBy fromDictionary:dict] doubleValue];
            self.uuid = [self objectOrNilForKey:kZHGSettingResponseSettingsUuid fromDictionary:dict];
            self.key = [self objectOrNilForKey:kZHGSettingResponseSettingsKey fromDictionary:dict];
            self.value = [self objectOrNilForKey:kZHGSettingResponseSettingsValue fromDictionary:dict];
            self.type = [self objectOrNilForKey:kZHGSettingResponseSettingsType fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHGSettingResponseSettingsUpdatedAt fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHGSettingResponseSettingsCreatedBy];
    [mutableDict setValue:[NSNumber numberWithDouble:self.settingsIdentifier] forKey:kZHGSettingResponseSettingsId];
    [mutableDict setValue:self.createdAt forKey:kZHGSettingResponseSettingsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHGSettingResponseSettingsUpdatedBy];
    [mutableDict setValue:self.uuid forKey:kZHGSettingResponseSettingsUuid];
    [mutableDict setValue:self.key forKey:kZHGSettingResponseSettingsKey];
    [mutableDict setValue:self.value forKey:kZHGSettingResponseSettingsValue];
    [mutableDict setValue:self.type forKey:kZHGSettingResponseSettingsType];
    [mutableDict setValue:self.updatedAt forKey:kZHGSettingResponseSettingsUpdatedAt];

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

    self.createdBy = [aDecoder decodeDoubleForKey:kZHGSettingResponseSettingsCreatedBy];
    self.settingsIdentifier = [aDecoder decodeDoubleForKey:kZHGSettingResponseSettingsId];
    self.createdAt = [aDecoder decodeObjectForKey:kZHGSettingResponseSettingsCreatedAt];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHGSettingResponseSettingsUpdatedBy];
    self.uuid = [aDecoder decodeObjectForKey:kZHGSettingResponseSettingsUuid];
    self.key = [aDecoder decodeObjectForKey:kZHGSettingResponseSettingsKey];
    self.value = [aDecoder decodeObjectForKey:kZHGSettingResponseSettingsValue];
    self.type = [aDecoder decodeObjectForKey:kZHGSettingResponseSettingsType];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHGSettingResponseSettingsUpdatedAt];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_createdBy forKey:kZHGSettingResponseSettingsCreatedBy];
    [aCoder encodeDouble:_settingsIdentifier forKey:kZHGSettingResponseSettingsId];
    [aCoder encodeObject:_createdAt forKey:kZHGSettingResponseSettingsCreatedAt];
    [aCoder encodeDouble:_updatedBy forKey:kZHGSettingResponseSettingsUpdatedBy];
    [aCoder encodeObject:_uuid forKey:kZHGSettingResponseSettingsUuid];
    [aCoder encodeObject:_key forKey:kZHGSettingResponseSettingsKey];
    [aCoder encodeObject:_value forKey:kZHGSettingResponseSettingsValue];
    [aCoder encodeObject:_type forKey:kZHGSettingResponseSettingsType];
    [aCoder encodeObject:_updatedAt forKey:kZHGSettingResponseSettingsUpdatedAt];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGSettingResponseSettings *copy = [[ZHGSettingResponseSettings alloc] init];
    
    if (copy) {

        copy.createdBy = self.createdBy;
        copy.settingsIdentifier = self.settingsIdentifier;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.updatedBy = self.updatedBy;
        copy.uuid = [self.uuid copyWithZone:zone];
        copy.key = [self.key copyWithZone:zone];
        copy.value = [self.value copyWithZone:zone];
        copy.type = [self.type copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
    }
    
    return copy;
}


@end
