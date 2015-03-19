//
//  ZHGUserInfoResponseRoles.m
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGUserInfoResponseRoles.h"


NSString *const kZHGUserInfoResponseRolesCreatedBy = @"created_by";
NSString *const kZHGUserInfoResponseRolesId = @"id";
NSString *const kZHGUserInfoResponseRolesCreatedAt = @"created_at";
NSString *const kZHGUserInfoResponseRolesUpdatedBy = @"updated_by";
NSString *const kZHGUserInfoResponseRolesUuid = @"uuid";
NSString *const kZHGUserInfoResponseRolesUpdatedAt = @"updated_at";
NSString *const kZHGUserInfoResponseRolesDescription = @"description";
NSString *const kZHGUserInfoResponseRolesName = @"name";


@interface ZHGUserInfoResponseRoles ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGUserInfoResponseRoles

@synthesize createdBy = _createdBy;
@synthesize rolesIdentifier = _rolesIdentifier;
@synthesize createdAt = _createdAt;
@synthesize updatedBy = _updatedBy;
@synthesize uuid = _uuid;
@synthesize updatedAt = _updatedAt;
@synthesize rolesDescription = _rolesDescription;
@synthesize name = _name;


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
            self.createdBy = [[self objectOrNilForKey:kZHGUserInfoResponseRolesCreatedBy fromDictionary:dict] doubleValue];
            self.rolesIdentifier = [[self objectOrNilForKey:kZHGUserInfoResponseRolesId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kZHGUserInfoResponseRolesCreatedAt fromDictionary:dict];
            self.updatedBy = [[self objectOrNilForKey:kZHGUserInfoResponseRolesUpdatedBy fromDictionary:dict] doubleValue];
            self.uuid = [self objectOrNilForKey:kZHGUserInfoResponseRolesUuid fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHGUserInfoResponseRolesUpdatedAt fromDictionary:dict];
            self.rolesDescription = [self objectOrNilForKey:kZHGUserInfoResponseRolesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHGUserInfoResponseRolesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHGUserInfoResponseRolesCreatedBy];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rolesIdentifier] forKey:kZHGUserInfoResponseRolesId];
    [mutableDict setValue:self.createdAt forKey:kZHGUserInfoResponseRolesCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHGUserInfoResponseRolesUpdatedBy];
    [mutableDict setValue:self.uuid forKey:kZHGUserInfoResponseRolesUuid];
    [mutableDict setValue:self.updatedAt forKey:kZHGUserInfoResponseRolesUpdatedAt];
    [mutableDict setValue:self.rolesDescription forKey:kZHGUserInfoResponseRolesDescription];
    [mutableDict setValue:self.name forKey:kZHGUserInfoResponseRolesName];

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

    self.createdBy = [aDecoder decodeDoubleForKey:kZHGUserInfoResponseRolesCreatedBy];
    self.rolesIdentifier = [aDecoder decodeDoubleForKey:kZHGUserInfoResponseRolesId];
    self.createdAt = [aDecoder decodeObjectForKey:kZHGUserInfoResponseRolesCreatedAt];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHGUserInfoResponseRolesUpdatedBy];
    self.uuid = [aDecoder decodeObjectForKey:kZHGUserInfoResponseRolesUuid];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHGUserInfoResponseRolesUpdatedAt];
    self.rolesDescription = [aDecoder decodeObjectForKey:kZHGUserInfoResponseRolesDescription];
    self.name = [aDecoder decodeObjectForKey:kZHGUserInfoResponseRolesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_createdBy forKey:kZHGUserInfoResponseRolesCreatedBy];
    [aCoder encodeDouble:_rolesIdentifier forKey:kZHGUserInfoResponseRolesId];
    [aCoder encodeObject:_createdAt forKey:kZHGUserInfoResponseRolesCreatedAt];
    [aCoder encodeDouble:_updatedBy forKey:kZHGUserInfoResponseRolesUpdatedBy];
    [aCoder encodeObject:_uuid forKey:kZHGUserInfoResponseRolesUuid];
    [aCoder encodeObject:_updatedAt forKey:kZHGUserInfoResponseRolesUpdatedAt];
    [aCoder encodeObject:_rolesDescription forKey:kZHGUserInfoResponseRolesDescription];
    [aCoder encodeObject:_name forKey:kZHGUserInfoResponseRolesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGUserInfoResponseRoles *copy = [[ZHGUserInfoResponseRoles alloc] init];
    
    if (copy) {

        copy.createdBy = self.createdBy;
        copy.rolesIdentifier = self.rolesIdentifier;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.updatedBy = self.updatedBy;
        copy.uuid = [self.uuid copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.rolesDescription = [self.rolesDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
