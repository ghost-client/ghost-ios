//
//  ZHGUserInfoResponseUsers.m
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGUserInfoResponseUsers.h"
#import "ZHGUserInfoResponseRoles.h"


NSString *const kZHGUserInfoResponseUsersLocation = @"location";
NSString *const kZHGUserInfoResponseUsersSlug = @"slug";
NSString *const kZHGUserInfoResponseUsersLanguage = @"language";
NSString *const kZHGUserInfoResponseUsersStatus = @"status";
NSString *const kZHGUserInfoResponseUsersImage = @"image";
NSString *const kZHGUserInfoResponseUsersUpdatedBy = @"updated_by";
NSString *const kZHGUserInfoResponseUsersUpdatedAt = @"updated_at";
NSString *const kZHGUserInfoResponseUsersUuid = @"uuid";
NSString *const kZHGUserInfoResponseUsersBio = @"bio";
NSString *const kZHGUserInfoResponseUsersMetaDescription = @"meta_description";
NSString *const kZHGUserInfoResponseUsersLastLogin = @"last_login";
NSString *const kZHGUserInfoResponseUsersCover = @"cover";
NSString *const kZHGUserInfoResponseUsersName = @"name";
NSString *const kZHGUserInfoResponseUsersId = @"id";
NSString *const kZHGUserInfoResponseUsersRoles = @"roles";
NSString *const kZHGUserInfoResponseUsersAccessibility = @"accessibility";
NSString *const kZHGUserInfoResponseUsersEmail = @"email";
NSString *const kZHGUserInfoResponseUsersWebsite = @"website";
NSString *const kZHGUserInfoResponseUsersMetaTitle = @"meta_title";
NSString *const kZHGUserInfoResponseUsersCreatedAt = @"created_at";
NSString *const kZHGUserInfoResponseUsersCreatedBy = @"created_by";


@interface ZHGUserInfoResponseUsers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGUserInfoResponseUsers

@synthesize location = _location;
@synthesize slug = _slug;
@synthesize language = _language;
@synthesize status = _status;
@synthesize image = _image;
@synthesize updatedBy = _updatedBy;
@synthesize updatedAt = _updatedAt;
@synthesize uuid = _uuid;
@synthesize bio = _bio;
@synthesize metaDescription = _metaDescription;
@synthesize lastLogin = _lastLogin;
@synthesize cover = _cover;
@synthesize name = _name;
@synthesize usersIdentifier = _usersIdentifier;
@synthesize roles = _roles;
@synthesize accessibility = _accessibility;
@synthesize email = _email;
@synthesize website = _website;
@synthesize metaTitle = _metaTitle;
@synthesize createdAt = _createdAt;
@synthesize createdBy = _createdBy;


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
            self.location = [self objectOrNilForKey:kZHGUserInfoResponseUsersLocation fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kZHGUserInfoResponseUsersSlug fromDictionary:dict];
            self.language = [self objectOrNilForKey:kZHGUserInfoResponseUsersLanguage fromDictionary:dict];
            self.status = [self objectOrNilForKey:kZHGUserInfoResponseUsersStatus fromDictionary:dict];
            self.image = [self objectOrNilForKey:kZHGUserInfoResponseUsersImage fromDictionary:dict];
            self.updatedBy = [[self objectOrNilForKey:kZHGUserInfoResponseUsersUpdatedBy fromDictionary:dict] doubleValue];
            self.updatedAt = [self objectOrNilForKey:kZHGUserInfoResponseUsersUpdatedAt fromDictionary:dict];
            self.uuid = [self objectOrNilForKey:kZHGUserInfoResponseUsersUuid fromDictionary:dict];
            self.bio = [self objectOrNilForKey:kZHGUserInfoResponseUsersBio fromDictionary:dict];
            self.metaDescription = [self objectOrNilForKey:kZHGUserInfoResponseUsersMetaDescription fromDictionary:dict];
            self.lastLogin = [self objectOrNilForKey:kZHGUserInfoResponseUsersLastLogin fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kZHGUserInfoResponseUsersCover fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHGUserInfoResponseUsersName fromDictionary:dict];
            self.usersIdentifier = [[self objectOrNilForKey:kZHGUserInfoResponseUsersId fromDictionary:dict] doubleValue];
    NSObject *receivedZHGUserInfoResponseRoles = [dict objectForKey:kZHGUserInfoResponseUsersRoles];
    NSMutableArray *parsedZHGUserInfoResponseRoles = [NSMutableArray array];
    if ([receivedZHGUserInfoResponseRoles isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedZHGUserInfoResponseRoles) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedZHGUserInfoResponseRoles addObject:[ZHGUserInfoResponseRoles modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedZHGUserInfoResponseRoles isKindOfClass:[NSDictionary class]]) {
       [parsedZHGUserInfoResponseRoles addObject:[ZHGUserInfoResponseRoles modelObjectWithDictionary:(NSDictionary *)receivedZHGUserInfoResponseRoles]];
    }

    self.roles = [NSArray arrayWithArray:parsedZHGUserInfoResponseRoles];
            self.accessibility = [self objectOrNilForKey:kZHGUserInfoResponseUsersAccessibility fromDictionary:dict];
            self.email = [self objectOrNilForKey:kZHGUserInfoResponseUsersEmail fromDictionary:dict];
            self.website = [self objectOrNilForKey:kZHGUserInfoResponseUsersWebsite fromDictionary:dict];
            self.metaTitle = [self objectOrNilForKey:kZHGUserInfoResponseUsersMetaTitle fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kZHGUserInfoResponseUsersCreatedAt fromDictionary:dict];
            self.createdBy = [[self objectOrNilForKey:kZHGUserInfoResponseUsersCreatedBy fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.location forKey:kZHGUserInfoResponseUsersLocation];
    [mutableDict setValue:self.slug forKey:kZHGUserInfoResponseUsersSlug];
    [mutableDict setValue:self.language forKey:kZHGUserInfoResponseUsersLanguage];
    [mutableDict setValue:self.status forKey:kZHGUserInfoResponseUsersStatus];
    [mutableDict setValue:self.image forKey:kZHGUserInfoResponseUsersImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHGUserInfoResponseUsersUpdatedBy];
    [mutableDict setValue:self.updatedAt forKey:kZHGUserInfoResponseUsersUpdatedAt];
    [mutableDict setValue:self.uuid forKey:kZHGUserInfoResponseUsersUuid];
    [mutableDict setValue:self.bio forKey:kZHGUserInfoResponseUsersBio];
    [mutableDict setValue:self.metaDescription forKey:kZHGUserInfoResponseUsersMetaDescription];
    [mutableDict setValue:self.lastLogin forKey:kZHGUserInfoResponseUsersLastLogin];
    [mutableDict setValue:self.cover forKey:kZHGUserInfoResponseUsersCover];
    [mutableDict setValue:self.name forKey:kZHGUserInfoResponseUsersName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.usersIdentifier] forKey:kZHGUserInfoResponseUsersId];
    NSMutableArray *tempArrayForRoles = [NSMutableArray array];
    for (NSObject *subArrayObject in self.roles) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRoles addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRoles addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRoles] forKey:kZHGUserInfoResponseUsersRoles];
    [mutableDict setValue:self.accessibility forKey:kZHGUserInfoResponseUsersAccessibility];
    [mutableDict setValue:self.email forKey:kZHGUserInfoResponseUsersEmail];
    [mutableDict setValue:self.website forKey:kZHGUserInfoResponseUsersWebsite];
    [mutableDict setValue:self.metaTitle forKey:kZHGUserInfoResponseUsersMetaTitle];
    [mutableDict setValue:self.createdAt forKey:kZHGUserInfoResponseUsersCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHGUserInfoResponseUsersCreatedBy];

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

    self.location = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersLocation];
    self.slug = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersSlug];
    self.language = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersLanguage];
    self.status = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersStatus];
    self.image = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersImage];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHGUserInfoResponseUsersUpdatedBy];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersUpdatedAt];
    self.uuid = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersUuid];
    self.bio = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersBio];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersMetaDescription];
    self.lastLogin = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersLastLogin];
    self.cover = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersCover];
    self.name = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersName];
    self.usersIdentifier = [aDecoder decodeDoubleForKey:kZHGUserInfoResponseUsersId];
    self.roles = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersRoles];
    self.accessibility = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersAccessibility];
    self.email = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersEmail];
    self.website = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersWebsite];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersMetaTitle];
    self.createdAt = [aDecoder decodeObjectForKey:kZHGUserInfoResponseUsersCreatedAt];
    self.createdBy = [aDecoder decodeDoubleForKey:kZHGUserInfoResponseUsersCreatedBy];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_location forKey:kZHGUserInfoResponseUsersLocation];
    [aCoder encodeObject:_slug forKey:kZHGUserInfoResponseUsersSlug];
    [aCoder encodeObject:_language forKey:kZHGUserInfoResponseUsersLanguage];
    [aCoder encodeObject:_status forKey:kZHGUserInfoResponseUsersStatus];
    [aCoder encodeObject:_image forKey:kZHGUserInfoResponseUsersImage];
    [aCoder encodeDouble:_updatedBy forKey:kZHGUserInfoResponseUsersUpdatedBy];
    [aCoder encodeObject:_updatedAt forKey:kZHGUserInfoResponseUsersUpdatedAt];
    [aCoder encodeObject:_uuid forKey:kZHGUserInfoResponseUsersUuid];
    [aCoder encodeObject:_bio forKey:kZHGUserInfoResponseUsersBio];
    [aCoder encodeObject:_metaDescription forKey:kZHGUserInfoResponseUsersMetaDescription];
    [aCoder encodeObject:_lastLogin forKey:kZHGUserInfoResponseUsersLastLogin];
    [aCoder encodeObject:_cover forKey:kZHGUserInfoResponseUsersCover];
    [aCoder encodeObject:_name forKey:kZHGUserInfoResponseUsersName];
    [aCoder encodeDouble:_usersIdentifier forKey:kZHGUserInfoResponseUsersId];
    [aCoder encodeObject:_roles forKey:kZHGUserInfoResponseUsersRoles];
    [aCoder encodeObject:_accessibility forKey:kZHGUserInfoResponseUsersAccessibility];
    [aCoder encodeObject:_email forKey:kZHGUserInfoResponseUsersEmail];
    [aCoder encodeObject:_website forKey:kZHGUserInfoResponseUsersWebsite];
    [aCoder encodeObject:_metaTitle forKey:kZHGUserInfoResponseUsersMetaTitle];
    [aCoder encodeObject:_createdAt forKey:kZHGUserInfoResponseUsersCreatedAt];
    [aCoder encodeDouble:_createdBy forKey:kZHGUserInfoResponseUsersCreatedBy];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGUserInfoResponseUsers *copy = [[ZHGUserInfoResponseUsers alloc] init];
    
    if (copy) {

        copy.location = [self.location copyWithZone:zone];
        copy.slug = [self.slug copyWithZone:zone];
        copy.language = [self.language copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.updatedBy = self.updatedBy;
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.uuid = [self.uuid copyWithZone:zone];
        copy.bio = [self.bio copyWithZone:zone];
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.lastLogin = [self.lastLogin copyWithZone:zone];
        copy.cover = [self.cover copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.usersIdentifier = self.usersIdentifier;
        copy.roles = [self.roles copyWithZone:zone];
        copy.accessibility = [self.accessibility copyWithZone:zone];
        copy.email = [self.email copyWithZone:zone];
        copy.website = [self.website copyWithZone:zone];
        copy.metaTitle = [self.metaTitle copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.createdBy = self.createdBy;
    }
    
    return copy;
}


@end
