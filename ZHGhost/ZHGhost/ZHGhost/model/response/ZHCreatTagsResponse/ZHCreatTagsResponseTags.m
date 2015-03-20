//
//  ZHCreatTagsResponseTags.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHCreatTagsResponseTags.h"


NSString *const kZHCreatTagsResponseTagsId = @"id";
NSString *const kZHCreatTagsResponseTagsMetaDescription = @"meta_description";
NSString *const kZHCreatTagsResponseTagsUuid = @"uuid";
NSString *const kZHCreatTagsResponseTagsDescription = @"description";
NSString *const kZHCreatTagsResponseTagsCreatedAt = @"created_at";
NSString *const kZHCreatTagsResponseTagsCreatedBy = @"created_by";
NSString *const kZHCreatTagsResponseTagsImage = @"image";
NSString *const kZHCreatTagsResponseTagsSlug = @"slug";
NSString *const kZHCreatTagsResponseTagsUpdatedAt = @"updated_at";
NSString *const kZHCreatTagsResponseTagsHidden = @"hidden";
NSString *const kZHCreatTagsResponseTagsUpdatedBy = @"updated_by";
NSString *const kZHCreatTagsResponseTagsMetaTitle = @"meta_title";
NSString *const kZHCreatTagsResponseTagsName = @"name";


@interface ZHCreatTagsResponseTags ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHCreatTagsResponseTags

@synthesize tagsIdentifier = _tagsIdentifier;
@synthesize metaDescription = _metaDescription;
@synthesize uuid = _uuid;
@synthesize tagsDescription = _tagsDescription;
@synthesize createdAt = _createdAt;
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
            self.tagsIdentifier = [[self objectOrNilForKey:kZHCreatTagsResponseTagsId fromDictionary:dict] doubleValue];
            self.metaDescription = [self objectOrNilForKey:kZHCreatTagsResponseTagsMetaDescription fromDictionary:dict];
            self.uuid = [self objectOrNilForKey:kZHCreatTagsResponseTagsUuid fromDictionary:dict];
            self.tagsDescription = [self objectOrNilForKey:kZHCreatTagsResponseTagsDescription fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kZHCreatTagsResponseTagsCreatedAt fromDictionary:dict];
            self.createdBy = [[self objectOrNilForKey:kZHCreatTagsResponseTagsCreatedBy fromDictionary:dict] doubleValue];
            self.image = [self objectOrNilForKey:kZHCreatTagsResponseTagsImage fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kZHCreatTagsResponseTagsSlug fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHCreatTagsResponseTagsUpdatedAt fromDictionary:dict];
            self.hidden = [[self objectOrNilForKey:kZHCreatTagsResponseTagsHidden fromDictionary:dict] boolValue];
            self.updatedBy = [[self objectOrNilForKey:kZHCreatTagsResponseTagsUpdatedBy fromDictionary:dict] doubleValue];
            self.metaTitle = [self objectOrNilForKey:kZHCreatTagsResponseTagsMetaTitle fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHCreatTagsResponseTagsName fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.tagsIdentifier] forKey:kZHCreatTagsResponseTagsId];
    [mutableDict setValue:self.metaDescription forKey:kZHCreatTagsResponseTagsMetaDescription];
    [mutableDict setValue:self.uuid forKey:kZHCreatTagsResponseTagsUuid];
    [mutableDict setValue:self.tagsDescription forKey:kZHCreatTagsResponseTagsDescription];
    [mutableDict setValue:self.createdAt forKey:kZHCreatTagsResponseTagsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHCreatTagsResponseTagsCreatedBy];
    [mutableDict setValue:self.image forKey:kZHCreatTagsResponseTagsImage];
    [mutableDict setValue:self.slug forKey:kZHCreatTagsResponseTagsSlug];
    [mutableDict setValue:self.updatedAt forKey:kZHCreatTagsResponseTagsUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.hidden] forKey:kZHCreatTagsResponseTagsHidden];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHCreatTagsResponseTagsUpdatedBy];
    [mutableDict setValue:self.metaTitle forKey:kZHCreatTagsResponseTagsMetaTitle];
    [mutableDict setValue:self.name forKey:kZHCreatTagsResponseTagsName];

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

    self.tagsIdentifier = [aDecoder decodeDoubleForKey:kZHCreatTagsResponseTagsId];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsMetaDescription];
    self.uuid = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsUuid];
    self.tagsDescription = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsDescription];
    self.createdAt = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsCreatedAt];
    self.createdBy = [aDecoder decodeDoubleForKey:kZHCreatTagsResponseTagsCreatedBy];
    self.image = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsImage];
    self.slug = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsSlug];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsUpdatedAt];
    self.hidden = [aDecoder decodeBoolForKey:kZHCreatTagsResponseTagsHidden];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHCreatTagsResponseTagsUpdatedBy];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsMetaTitle];
    self.name = [aDecoder decodeObjectForKey:kZHCreatTagsResponseTagsName];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_tagsIdentifier forKey:kZHCreatTagsResponseTagsId];
    [aCoder encodeObject:_metaDescription forKey:kZHCreatTagsResponseTagsMetaDescription];
    [aCoder encodeObject:_uuid forKey:kZHCreatTagsResponseTagsUuid];
    [aCoder encodeObject:_tagsDescription forKey:kZHCreatTagsResponseTagsDescription];
    [aCoder encodeObject:_createdAt forKey:kZHCreatTagsResponseTagsCreatedAt];
    [aCoder encodeDouble:_createdBy forKey:kZHCreatTagsResponseTagsCreatedBy];
    [aCoder encodeObject:_image forKey:kZHCreatTagsResponseTagsImage];
    [aCoder encodeObject:_slug forKey:kZHCreatTagsResponseTagsSlug];
    [aCoder encodeObject:_updatedAt forKey:kZHCreatTagsResponseTagsUpdatedAt];
    [aCoder encodeBool:_hidden forKey:kZHCreatTagsResponseTagsHidden];
    [aCoder encodeDouble:_updatedBy forKey:kZHCreatTagsResponseTagsUpdatedBy];
    [aCoder encodeObject:_metaTitle forKey:kZHCreatTagsResponseTagsMetaTitle];
    [aCoder encodeObject:_name forKey:kZHCreatTagsResponseTagsName];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHCreatTagsResponseTags *copy = [[ZHCreatTagsResponseTags alloc] init];
    
    if (copy) {

        copy.tagsIdentifier = self.tagsIdentifier;
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.uuid = [self.uuid copyWithZone:zone];
        copy.tagsDescription = [self.tagsDescription copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
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
