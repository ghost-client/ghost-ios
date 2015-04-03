//
//  ZHAllUserResponseRoles.m
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHAllUserResponseRoles.h"


NSString *const kZHAllUserResponseRolesCreatedBy = @"created_by";
NSString *const kZHAllUserResponseRolesId = @"id";
NSString *const kZHAllUserResponseRolesCreatedAt = @"created_at";
NSString *const kZHAllUserResponseRolesUpdatedBy = @"updated_by";
NSString *const kZHAllUserResponseRolesUuid = @"uuid";
NSString *const kZHAllUserResponseRolesUpdatedAt = @"updated_at";
NSString *const kZHAllUserResponseRolesDescription = @"description";
NSString *const kZHAllUserResponseRolesName = @"name";


@interface ZHAllUserResponseRoles ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHAllUserResponseRoles

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
            self.createdBy = [[self objectOrNilForKey:kZHAllUserResponseRolesCreatedBy fromDictionary:dict] doubleValue];
            self.rolesIdentifier = [[self objectOrNilForKey:kZHAllUserResponseRolesId fromDictionary:dict] doubleValue];
            self.createdAt = [self objectOrNilForKey:kZHAllUserResponseRolesCreatedAt fromDictionary:dict];
            self.updatedBy = [[self objectOrNilForKey:kZHAllUserResponseRolesUpdatedBy fromDictionary:dict] doubleValue];
            self.uuid = [self objectOrNilForKey:kZHAllUserResponseRolesUuid fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHAllUserResponseRolesUpdatedAt fromDictionary:dict];
            self.rolesDescription = [self objectOrNilForKey:kZHAllUserResponseRolesDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHAllUserResponseRolesName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHAllUserResponseRolesCreatedBy];
    [mutableDict setValue:[NSNumber numberWithDouble:self.rolesIdentifier] forKey:kZHAllUserResponseRolesId];
    [mutableDict setValue:self.createdAt forKey:kZHAllUserResponseRolesCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHAllUserResponseRolesUpdatedBy];
    [mutableDict setValue:self.uuid forKey:kZHAllUserResponseRolesUuid];
    [mutableDict setValue:self.updatedAt forKey:kZHAllUserResponseRolesUpdatedAt];
    [mutableDict setValue:self.rolesDescription forKey:kZHAllUserResponseRolesDescription];
    [mutableDict setValue:self.name forKey:kZHAllUserResponseRolesName];

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

    self.createdBy = [aDecoder decodeDoubleForKey:kZHAllUserResponseRolesCreatedBy];
    self.rolesIdentifier = [aDecoder decodeDoubleForKey:kZHAllUserResponseRolesId];
    self.createdAt = [aDecoder decodeObjectForKey:kZHAllUserResponseRolesCreatedAt];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHAllUserResponseRolesUpdatedBy];
    self.uuid = [aDecoder decodeObjectForKey:kZHAllUserResponseRolesUuid];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHAllUserResponseRolesUpdatedAt];
    self.rolesDescription = [aDecoder decodeObjectForKey:kZHAllUserResponseRolesDescription];
    self.name = [aDecoder decodeObjectForKey:kZHAllUserResponseRolesName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_createdBy forKey:kZHAllUserResponseRolesCreatedBy];
    [aCoder encodeDouble:_rolesIdentifier forKey:kZHAllUserResponseRolesId];
    [aCoder encodeObject:_createdAt forKey:kZHAllUserResponseRolesCreatedAt];
    [aCoder encodeDouble:_updatedBy forKey:kZHAllUserResponseRolesUpdatedBy];
    [aCoder encodeObject:_uuid forKey:kZHAllUserResponseRolesUuid];
    [aCoder encodeObject:_updatedAt forKey:kZHAllUserResponseRolesUpdatedAt];
    [aCoder encodeObject:_rolesDescription forKey:kZHAllUserResponseRolesDescription];
    [aCoder encodeObject:_name forKey:kZHAllUserResponseRolesName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHAllUserResponseRoles *copy = [[ZHAllUserResponseRoles alloc] init];
    
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
