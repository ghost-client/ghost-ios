//
//  ZHAllUserResponseUsers.m
//
//  Created by  自己联通 on 15/3/26
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHAllUserResponseUsers.h"


NSString *const kZHAllUserResponseUsersLocation = @"location";
NSString *const kZHAllUserResponseUsersSlug = @"slug";
NSString *const kZHAllUserResponseUsersLanguage = @"language";
NSString *const kZHAllUserResponseUsersStatus = @"status";
NSString *const kZHAllUserResponseUsersImage = @"image";
NSString *const kZHAllUserResponseUsersUpdatedBy = @"updated_by";
NSString *const kZHAllUserResponseUsersUpdatedAt = @"updated_at";
NSString *const kZHAllUserResponseUsersUuid = @"uuid";
NSString *const kZHAllUserResponseUsersBio = @"bio";
NSString *const kZHAllUserResponseUsersMetaDescription = @"meta_description";
NSString *const kZHAllUserResponseUsersLastLogin = @"last_login";
NSString *const kZHAllUserResponseUsersCover = @"cover";
NSString *const kZHAllUserResponseUsersName = @"name";
NSString *const kZHAllUserResponseUsersId = @"id";
NSString *const kZHAllUserResponseUsersAccessibility = @"accessibility";
NSString *const kZHAllUserResponseUsersEmail = @"email";
NSString *const kZHAllUserResponseUsersWebsite = @"website";
NSString *const kZHAllUserResponseUsersMetaTitle = @"meta_title";
NSString *const kZHAllUserResponseUsersCreatedAt = @"created_at";
NSString *const kZHAllUserResponseUsersCreatedBy = @"created_by";


@interface ZHAllUserResponseUsers ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHAllUserResponseUsers

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
            self.location = [self objectOrNilForKey:kZHAllUserResponseUsersLocation fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kZHAllUserResponseUsersSlug fromDictionary:dict];
            self.language = [self objectOrNilForKey:kZHAllUserResponseUsersLanguage fromDictionary:dict];
            self.status = [self objectOrNilForKey:kZHAllUserResponseUsersStatus fromDictionary:dict];
            self.image = [self objectOrNilForKey:kZHAllUserResponseUsersImage fromDictionary:dict];
            self.updatedBy = [[self objectOrNilForKey:kZHAllUserResponseUsersUpdatedBy fromDictionary:dict] doubleValue];
            self.updatedAt = [self objectOrNilForKey:kZHAllUserResponseUsersUpdatedAt fromDictionary:dict];
            self.uuid = [self objectOrNilForKey:kZHAllUserResponseUsersUuid fromDictionary:dict];
            self.bio = [self objectOrNilForKey:kZHAllUserResponseUsersBio fromDictionary:dict];
            self.metaDescription = [self objectOrNilForKey:kZHAllUserResponseUsersMetaDescription fromDictionary:dict];
            self.lastLogin = [self objectOrNilForKey:kZHAllUserResponseUsersLastLogin fromDictionary:dict];
            self.cover = [self objectOrNilForKey:kZHAllUserResponseUsersCover fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHAllUserResponseUsersName fromDictionary:dict];
            self.usersIdentifier = [[self objectOrNilForKey:kZHAllUserResponseUsersId fromDictionary:dict] doubleValue];
            self.accessibility = [self objectOrNilForKey:kZHAllUserResponseUsersAccessibility fromDictionary:dict];
            self.email = [self objectOrNilForKey:kZHAllUserResponseUsersEmail fromDictionary:dict];
            self.website = [self objectOrNilForKey:kZHAllUserResponseUsersWebsite fromDictionary:dict];
            self.metaTitle = [self objectOrNilForKey:kZHAllUserResponseUsersMetaTitle fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kZHAllUserResponseUsersCreatedAt fromDictionary:dict];
            self.createdBy = [[self objectOrNilForKey:kZHAllUserResponseUsersCreatedBy fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.location forKey:kZHAllUserResponseUsersLocation];
    [mutableDict setValue:self.slug forKey:kZHAllUserResponseUsersSlug];
    [mutableDict setValue:self.language forKey:kZHAllUserResponseUsersLanguage];
    [mutableDict setValue:self.status forKey:kZHAllUserResponseUsersStatus];
    [mutableDict setValue:self.image forKey:kZHAllUserResponseUsersImage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHAllUserResponseUsersUpdatedBy];
    [mutableDict setValue:self.updatedAt forKey:kZHAllUserResponseUsersUpdatedAt];
    [mutableDict setValue:self.uuid forKey:kZHAllUserResponseUsersUuid];
    [mutableDict setValue:self.bio forKey:kZHAllUserResponseUsersBio];
    [mutableDict setValue:self.metaDescription forKey:kZHAllUserResponseUsersMetaDescription];
    [mutableDict setValue:self.lastLogin forKey:kZHAllUserResponseUsersLastLogin];
    [mutableDict setValue:self.cover forKey:kZHAllUserResponseUsersCover];
    [mutableDict setValue:self.name forKey:kZHAllUserResponseUsersName];
    [mutableDict setValue:[NSNumber numberWithDouble:self.usersIdentifier] forKey:kZHAllUserResponseUsersId];
    [mutableDict setValue:self.accessibility forKey:kZHAllUserResponseUsersAccessibility];
    [mutableDict setValue:self.email forKey:kZHAllUserResponseUsersEmail];
    [mutableDict setValue:self.website forKey:kZHAllUserResponseUsersWebsite];
    [mutableDict setValue:self.metaTitle forKey:kZHAllUserResponseUsersMetaTitle];
    [mutableDict setValue:self.createdAt forKey:kZHAllUserResponseUsersCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHAllUserResponseUsersCreatedBy];

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

    self.location = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersLocation];
    self.slug = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersSlug];
    self.language = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersLanguage];
    self.status = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersStatus];
    self.image = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersImage];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHAllUserResponseUsersUpdatedBy];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersUpdatedAt];
    self.uuid = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersUuid];
    self.bio = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersBio];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersMetaDescription];
    self.lastLogin = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersLastLogin];
    self.cover = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersCover];
    self.name = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersName];
    self.usersIdentifier = [aDecoder decodeDoubleForKey:kZHAllUserResponseUsersId];
    self.accessibility = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersAccessibility];
    self.email = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersEmail];
    self.website = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersWebsite];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersMetaTitle];
    self.createdAt = [aDecoder decodeObjectForKey:kZHAllUserResponseUsersCreatedAt];
    self.createdBy = [aDecoder decodeDoubleForKey:kZHAllUserResponseUsersCreatedBy];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_location forKey:kZHAllUserResponseUsersLocation];
    [aCoder encodeObject:_slug forKey:kZHAllUserResponseUsersSlug];
    [aCoder encodeObject:_language forKey:kZHAllUserResponseUsersLanguage];
    [aCoder encodeObject:_status forKey:kZHAllUserResponseUsersStatus];
    [aCoder encodeObject:_image forKey:kZHAllUserResponseUsersImage];
    [aCoder encodeDouble:_updatedBy forKey:kZHAllUserResponseUsersUpdatedBy];
    [aCoder encodeObject:_updatedAt forKey:kZHAllUserResponseUsersUpdatedAt];
    [aCoder encodeObject:_uuid forKey:kZHAllUserResponseUsersUuid];
    [aCoder encodeObject:_bio forKey:kZHAllUserResponseUsersBio];
    [aCoder encodeObject:_metaDescription forKey:kZHAllUserResponseUsersMetaDescription];
    [aCoder encodeObject:_lastLogin forKey:kZHAllUserResponseUsersLastLogin];
    [aCoder encodeObject:_cover forKey:kZHAllUserResponseUsersCover];
    [aCoder encodeObject:_name forKey:kZHAllUserResponseUsersName];
    [aCoder encodeDouble:_usersIdentifier forKey:kZHAllUserResponseUsersId];
    [aCoder encodeObject:_accessibility forKey:kZHAllUserResponseUsersAccessibility];
    [aCoder encodeObject:_email forKey:kZHAllUserResponseUsersEmail];
    [aCoder encodeObject:_website forKey:kZHAllUserResponseUsersWebsite];
    [aCoder encodeObject:_metaTitle forKey:kZHAllUserResponseUsersMetaTitle];
    [aCoder encodeObject:_createdAt forKey:kZHAllUserResponseUsersCreatedAt];
    [aCoder encodeDouble:_createdBy forKey:kZHAllUserResponseUsersCreatedBy];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHAllUserResponseUsers *copy = [[ZHAllUserResponseUsers alloc] init];
    
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
