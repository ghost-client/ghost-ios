//
//  ZHCreatTagsSubmitBaseClass.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHCreatTagsSubmitBaseClass.h"


NSString *const kZHCreatTagsSubmitBaseClassSlug = @"slug";
NSString *const kZHCreatTagsSubmitBaseClassHidden = @"hidden";
NSString *const kZHCreatTagsSubmitBaseClassMetaDescription = @"meta_description";
NSString *const kZHCreatTagsSubmitBaseClassImage = @"image";
NSString *const kZHCreatTagsSubmitBaseClassDescription = @"description";
NSString *const kZHCreatTagsSubmitBaseClassName = @"name";
NSString *const kZHCreatTagsSubmitBaseClassMetaTitle = @"meta_title";


@interface ZHCreatTagsSubmitBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHCreatTagsSubmitBaseClass

@synthesize slug = _slug;
@synthesize hidden = _hidden;
@synthesize metaDescription = _metaDescription;
@synthesize image = _image;
@synthesize internalBaseClassDescription = _internalBaseClassDescription;
@synthesize name = _name;
@synthesize metaTitle = _metaTitle;


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
            self.slug = [self objectOrNilForKey:kZHCreatTagsSubmitBaseClassSlug fromDictionary:dict];
            self.hidden = [[self objectOrNilForKey:kZHCreatTagsSubmitBaseClassHidden fromDictionary:dict] boolValue];
            self.metaDescription = [self objectOrNilForKey:kZHCreatTagsSubmitBaseClassMetaDescription fromDictionary:dict];
            self.image = [self objectOrNilForKey:kZHCreatTagsSubmitBaseClassImage fromDictionary:dict];
            self.internalBaseClassDescription = [self objectOrNilForKey:kZHCreatTagsSubmitBaseClassDescription fromDictionary:dict];
            self.name = [self objectOrNilForKey:kZHCreatTagsSubmitBaseClassName fromDictionary:dict];
            self.metaTitle = [self objectOrNilForKey:kZHCreatTagsSubmitBaseClassMetaTitle fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.slug forKey:kZHCreatTagsSubmitBaseClassSlug];
    [mutableDict setValue:[NSNumber numberWithBool:self.hidden] forKey:kZHCreatTagsSubmitBaseClassHidden];
    [mutableDict setValue:self.metaDescription forKey:kZHCreatTagsSubmitBaseClassMetaDescription];
    [mutableDict setValue:self.image forKey:kZHCreatTagsSubmitBaseClassImage];
    [mutableDict setValue:self.internalBaseClassDescription forKey:kZHCreatTagsSubmitBaseClassDescription];
    [mutableDict setValue:self.name forKey:kZHCreatTagsSubmitBaseClassName];
    [mutableDict setValue:self.metaTitle forKey:kZHCreatTagsSubmitBaseClassMetaTitle];

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

    self.slug = [aDecoder decodeObjectForKey:kZHCreatTagsSubmitBaseClassSlug];
    self.hidden = [aDecoder decodeBoolForKey:kZHCreatTagsSubmitBaseClassHidden];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHCreatTagsSubmitBaseClassMetaDescription];
    self.image = [aDecoder decodeObjectForKey:kZHCreatTagsSubmitBaseClassImage];
    self.internalBaseClassDescription = [aDecoder decodeObjectForKey:kZHCreatTagsSubmitBaseClassDescription];
    self.name = [aDecoder decodeObjectForKey:kZHCreatTagsSubmitBaseClassName];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHCreatTagsSubmitBaseClassMetaTitle];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_slug forKey:kZHCreatTagsSubmitBaseClassSlug];
    [aCoder encodeBool:_hidden forKey:kZHCreatTagsSubmitBaseClassHidden];
    [aCoder encodeObject:_metaDescription forKey:kZHCreatTagsSubmitBaseClassMetaDescription];
    [aCoder encodeObject:_image forKey:kZHCreatTagsSubmitBaseClassImage];
    [aCoder encodeObject:_internalBaseClassDescription forKey:kZHCreatTagsSubmitBaseClassDescription];
    [aCoder encodeObject:_name forKey:kZHCreatTagsSubmitBaseClassName];
    [aCoder encodeObject:_metaTitle forKey:kZHCreatTagsSubmitBaseClassMetaTitle];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHCreatTagsSubmitBaseClass *copy = [[ZHCreatTagsSubmitBaseClass alloc] init];
    
    if (copy) {

        copy.slug = [self.slug copyWithZone:zone];
        copy.hidden = self.hidden;
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.internalBaseClassDescription = [self.internalBaseClassDescription copyWithZone:zone];
        copy.name = [self.name copyWithZone:zone];
        copy.metaTitle = [self.metaTitle copyWithZone:zone];
    }
    
    return copy;
}


@end
