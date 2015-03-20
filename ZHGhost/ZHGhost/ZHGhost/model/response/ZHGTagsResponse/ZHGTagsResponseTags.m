//
//  ZHGTagsResponseTags.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGTagsResponseTags.h"


NSString *const kZHGTagsResponseTagsId = @"id";
NSString *const kZHGTagsResponseTagsMetaDescription = @"meta_description";
NSString *const kZHGTagsResponseTagsUuid = @"uuid";
NSString *const kZHGTagsResponseTagsDescription = @"description";
NSString *const kZHGTagsResponseTagsCreatedAt = @"created_at";
NSString *const kZHGTagsResponseTagsParent = @"parent";
NSString *const kZHGTagsResponseTagsCreatedBy = @"created_by";
NSString *const kZHGTagsResponseTagsImage = @"image";
NSString *const kZHGTagsResponseTagsSlug = @"slug";
NSString *const kZHGTagsResponseTagsUpdatedAt = @"updated_at";
NSString *const kZHGTagsResponseTagsHidden = @"hidden";
NSString *const kZHGTagsResponseTagsUpdatedBy = @"updated_by";
NSString *const kZHGTagsResponseTagsMetaTitle = @"meta_title";
NSString *const kZHGTagsResponseTagsName = @"name";


@interface ZHGTagsResponseTags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGTagsResponseTags

@synthesize tagsIdentifier = _tagsIdentifier;
@synthesize metaDescription = _metaDescription;
@synthesize uuid = _uuid;
@synthesize tagsDescription = _tagsDescription;
@synthesize createdAt = _createdAt;
@synthesize parent = _parent;
@synthesize createdBy = _createdBy;
@synthesize image = _image;
@synthesize slug = _slug;
@synthesize updatedAt = _updatedAt;
@synthesize hidden = _hidden;
@synthesize updatedBy = _updatedBy;
@synthesize metaTitle = _metaTitle;
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
            self.tagsIdentifier = [[self objectOrNilForKey:kZHGTagsResponseTagsId fromDictionary:dict] doubleValue];
            self.metaDescription = [self objectOrNilForKey:kZHGTagsResponseTagsMetaDescription fromDictionary:dict];
            self.uuid = [self objectOrNilForKey:kZHGTagsResponseTagsUuid fromDictionary:dict];
            self.tagsDescription = [self objectOrNilForKey:kZHGTagsResponseTagsDescription fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kZHGTagsResponseTagsCreatedAt fromDictionary:dict];
            self.parent = [self objectOrNilForKey:kZHGTagsResponseTagsParent fromDictionary:dict];
            self.createdBy = [[self objectOrNilForKey:kZHGTagsResponseTagsCreatedBy fromDictionary:dict] doubleValue];
            self.image = [self objectOrNilForKey:kZHGTagsResponseTagsImage fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kZHGTagsResponseTagsSlug fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHGTagsResponseTagsUpdatedAt fromDictionary:dict];
            self.hidden = [[self objectOrNilForKey:kZHGTagsResponseTagsHidden fromDictionary:dict] boolValue];
            self.updatedBy = [[self objectOrNilForKey:kZHGTagsResponseTagsUpdatedBy fromDictionary:dict] doubleValue];
            self.metaTitle = [self objectOrNilForKey:kZHGTagsResponseTagsMetaTitle fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHGTagsResponseTagsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagsIdentifier] forKey:kZHGTagsResponseTagsId];
    [mutableDict setValue:self.metaDescription forKey:kZHGTagsResponseTagsMetaDescription];
    [mutableDict setValue:self.uuid forKey:kZHGTagsResponseTagsUuid];
    [mutableDict setValue:self.tagsDescription forKey:kZHGTagsResponseTagsDescription];
    [mutableDict setValue:self.createdAt forKey:kZHGTagsResponseTagsCreatedAt];
    [mutableDict setValue:self.parent forKey:kZHGTagsResponseTagsParent];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHGTagsResponseTagsCreatedBy];
    [mutableDict setValue:self.image forKey:kZHGTagsResponseTagsImage];
    [mutableDict setValue:self.slug forKey:kZHGTagsResponseTagsSlug];
    [mutableDict setValue:self.updatedAt forKey:kZHGTagsResponseTagsUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.hidden] forKey:kZHGTagsResponseTagsHidden];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHGTagsResponseTagsUpdatedBy];
    [mutableDict setValue:self.metaTitle forKey:kZHGTagsResponseTagsMetaTitle];
    [mutableDict setValue:self.name forKey:kZHGTagsResponseTagsName];

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

    self.tagsIdentifier = [aDecoder decodeDoubleForKey:kZHGTagsResponseTagsId];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsMetaDescription];
    self.uuid = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsUuid];
    self.tagsDescription = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsDescription];
    self.createdAt = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsCreatedAt];
    self.parent = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsParent];
    self.createdBy = [aDecoder decodeDoubleForKey:kZHGTagsResponseTagsCreatedBy];
    self.image = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsImage];
    self.slug = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsSlug];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsUpdatedAt];
    self.hidden = [aDecoder decodeBoolForKey:kZHGTagsResponseTagsHidden];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHGTagsResponseTagsUpdatedBy];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsMetaTitle];
    self.name = [aDecoder decodeObjectForKey:kZHGTagsResponseTagsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tagsIdentifier forKey:kZHGTagsResponseTagsId];
    [aCoder encodeObject:_metaDescription forKey:kZHGTagsResponseTagsMetaDescription];
    [aCoder encodeObject:_uuid forKey:kZHGTagsResponseTagsUuid];
    [aCoder encodeObject:_tagsDescription forKey:kZHGTagsResponseTagsDescription];
    [aCoder encodeObject:_createdAt forKey:kZHGTagsResponseTagsCreatedAt];
    [aCoder encodeObject:_parent forKey:kZHGTagsResponseTagsParent];
    [aCoder encodeDouble:_createdBy forKey:kZHGTagsResponseTagsCreatedBy];
    [aCoder encodeObject:_image forKey:kZHGTagsResponseTagsImage];
    [aCoder encodeObject:_slug forKey:kZHGTagsResponseTagsSlug];
    [aCoder encodeObject:_updatedAt forKey:kZHGTagsResponseTagsUpdatedAt];
    [aCoder encodeBool:_hidden forKey:kZHGTagsResponseTagsHidden];
    [aCoder encodeDouble:_updatedBy forKey:kZHGTagsResponseTagsUpdatedBy];
    [aCoder encodeObject:_metaTitle forKey:kZHGTagsResponseTagsMetaTitle];
    [aCoder encodeObject:_name forKey:kZHGTagsResponseTagsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGTagsResponseTags *copy = [[ZHGTagsResponseTags alloc] init];
    
    if (copy) {

        copy.tagsIdentifier = self.tagsIdentifier;
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.uuid = [self.uuid copyWithZone:zone];
        copy.tagsDescription = [self.tagsDescription copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.parent = [self.parent copyWithZone:zone];
        copy.createdBy = self.createdBy;
        copy.image = [self.image copyWithZone:zone];
        copy.slug = [self.slug copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.hidden = self.hidden;
        copy.updatedBy = self.updatedBy;
        copy.metaTitle = [self.metaTitle copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
    }
    
    return copy;
}


@end
