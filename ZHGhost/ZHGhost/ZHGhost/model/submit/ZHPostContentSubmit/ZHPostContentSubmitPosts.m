//
//  ZHPostContentSubmitPosts.m
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHPostContentSubmitPosts.h"


NSString *const kZHPostContentSubmitPostsId = @"id";
NSString *const kZHPostContentSubmitPostsPublishedAt = @"published_at";
NSString *const kZHPostContentSubmitPostsMetaDescription = @"meta_description";
NSString *const kZHPostContentSubmitPostsPublishedBy = @"published_by";
NSString *const kZHPostContentSubmitPostsAuthor = @"author";
NSString *const kZHPostContentSubmitPostsCreatedAt = @"created_at";
NSString *const kZHPostContentSubmitPostsFeatured = @"featured";
NSString *const kZHPostContentSubmitPostsCreatedBy = @"created_by";
NSString *const kZHPostContentSubmitPostsTags = @"tags";
NSString *const kZHPostContentSubmitPostsTitle = @"title";
NSString *const kZHPostContentSubmitPostsImage = @"image";
NSString *const kZHPostContentSubmitPostsMarkdown = @"markdown";
NSString *const kZHPostContentSubmitPostsSlug = @"slug";
NSString *const kZHPostContentSubmitPostsLanguage = @"language";
NSString *const kZHPostContentSubmitPostsUpdatedAt = @"updated_at";
NSString *const kZHPostContentSubmitPostsPage = @"page";
NSString *const kZHPostContentSubmitPostsUpdatedBy = @"updated_by";
NSString *const kZHPostContentSubmitPostsMetaTitle = @"meta_title";
NSString *const kZHPostContentSubmitPostsStatus = @"status";


@interface ZHPostContentSubmitPosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHPostContentSubmitPosts

@synthesize postsIdentifier = _postsIdentifier;
@synthesize publishedAt = _publishedAt;
@synthesize metaDescription = _metaDescription;
@synthesize publishedBy = _publishedBy;
@synthesize author = _author;
@synthesize createdAt = _createdAt;
@synthesize featured = _featured;
@synthesize createdBy = _createdBy;
@synthesize tags = _tags;
@synthesize title = _title;
@synthesize image = _image;
@synthesize markdown = _markdown;
@synthesize slug = _slug;
@synthesize language = _language;
@synthesize updatedAt = _updatedAt;
@synthesize page = _page;
@synthesize updatedBy = _updatedBy;
@synthesize metaTitle = _metaTitle;
@synthesize status = _status;


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
            self.postsIdentifier = [self objectOrNilForKey:kZHPostContentSubmitPostsId fromDictionary:dict];
            self.publishedAt = [self objectOrNilForKey:kZHPostContentSubmitPostsPublishedAt fromDictionary:dict];
            self.metaDescription = [self objectOrNilForKey:kZHPostContentSubmitPostsMetaDescription fromDictionary:dict];
            self.publishedBy = [self objectOrNilForKey:kZHPostContentSubmitPostsPublishedBy fromDictionary:dict];
            self.author = [self objectOrNilForKey:kZHPostContentSubmitPostsAuthor fromDictionary:dict];
            self.createdAt = [self objectOrNilForKey:kZHPostContentSubmitPostsCreatedAt fromDictionary:dict];
            self.featured = [[self objectOrNilForKey:kZHPostContentSubmitPostsFeatured fromDictionary:dict] boolValue];
            self.createdBy = [[self objectOrNilForKey:kZHPostContentSubmitPostsCreatedBy fromDictionary:dict] doubleValue];
            self.tags = [self objectOrNilForKey:kZHPostContentSubmitPostsTags fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZHPostContentSubmitPostsTitle fromDictionary:dict];
            self.image = [self objectOrNilForKey:kZHPostContentSubmitPostsImage fromDictionary:dict];
            self.markdown = [self objectOrNilForKey:kZHPostContentSubmitPostsMarkdown fromDictionary:dict];
            self.slug = [self objectOrNilForKey:kZHPostContentSubmitPostsSlug fromDictionary:dict];
            self.language = [self objectOrNilForKey:kZHPostContentSubmitPostsLanguage fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHPostContentSubmitPostsUpdatedAt fromDictionary:dict];
            self.page = [[self objectOrNilForKey:kZHPostContentSubmitPostsPage fromDictionary:dict] boolValue];
            self.updatedBy = [[self objectOrNilForKey:kZHPostContentSubmitPostsUpdatedBy fromDictionary:dict] doubleValue];
            self.metaTitle = [self objectOrNilForKey:kZHPostContentSubmitPostsMetaTitle fromDictionary:dict];
            self.status = [self objectOrNilForKey:kZHPostContentSubmitPostsStatus fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.postsIdentifier forKey:kZHPostContentSubmitPostsId];
    [mutableDict setValue:self.publishedAt forKey:kZHPostContentSubmitPostsPublishedAt];
    [mutableDict setValue:self.metaDescription forKey:kZHPostContentSubmitPostsMetaDescription];
    [mutableDict setValue:self.publishedBy forKey:kZHPostContentSubmitPostsPublishedBy];
    [mutableDict setValue:self.author forKey:kZHPostContentSubmitPostsAuthor];
    [mutableDict setValue:self.createdAt forKey:kZHPostContentSubmitPostsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.featured] forKey:kZHPostContentSubmitPostsFeatured];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHPostContentSubmitPostsCreatedBy];
    NSMutableArray *tempArrayForTags = [NSMutableArray array];
    for (NSObject *subArrayObject in self.tags) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForTags addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForTags addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kZHPostContentSubmitPostsTags];
    [mutableDict setValue:self.title forKey:kZHPostContentSubmitPostsTitle];
    [mutableDict setValue:self.image forKey:kZHPostContentSubmitPostsImage];
    [mutableDict setValue:self.markdown forKey:kZHPostContentSubmitPostsMarkdown];
    [mutableDict setValue:self.slug forKey:kZHPostContentSubmitPostsSlug];
    [mutableDict setValue:self.language forKey:kZHPostContentSubmitPostsLanguage];
    [mutableDict setValue:self.updatedAt forKey:kZHPostContentSubmitPostsUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithBool:self.page] forKey:kZHPostContentSubmitPostsPage];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHPostContentSubmitPostsUpdatedBy];
    [mutableDict setValue:self.metaTitle forKey:kZHPostContentSubmitPostsMetaTitle];
    [mutableDict setValue:self.status forKey:kZHPostContentSubmitPostsStatus];

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

    self.postsIdentifier = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsId];
    self.publishedAt = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsPublishedAt];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsMetaDescription];
    self.publishedBy = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsPublishedBy];
    self.author = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsAuthor];
    self.createdAt = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsCreatedAt];
    self.featured = [aDecoder decodeBoolForKey:kZHPostContentSubmitPostsFeatured];
    self.createdBy = [aDecoder decodeDoubleForKey:kZHPostContentSubmitPostsCreatedBy];
    self.tags = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsTags];
    self.title = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsTitle];
    self.image = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsImage];
    self.markdown = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsMarkdown];
    self.slug = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsSlug];
    self.language = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsLanguage];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsUpdatedAt];
    self.page = [aDecoder decodeBoolForKey:kZHPostContentSubmitPostsPage];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHPostContentSubmitPostsUpdatedBy];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsMetaTitle];
    self.status = [aDecoder decodeObjectForKey:kZHPostContentSubmitPostsStatus];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_postsIdentifier forKey:kZHPostContentSubmitPostsId];
    [aCoder encodeObject:_publishedAt forKey:kZHPostContentSubmitPostsPublishedAt];
    [aCoder encodeObject:_metaDescription forKey:kZHPostContentSubmitPostsMetaDescription];
    [aCoder encodeObject:_publishedBy forKey:kZHPostContentSubmitPostsPublishedBy];
    [aCoder encodeObject:_author forKey:kZHPostContentSubmitPostsAuthor];
    [aCoder encodeObject:_createdAt forKey:kZHPostContentSubmitPostsCreatedAt];
    [aCoder encodeBool:_featured forKey:kZHPostContentSubmitPostsFeatured];
    [aCoder encodeDouble:_createdBy forKey:kZHPostContentSubmitPostsCreatedBy];
    [aCoder encodeObject:_tags forKey:kZHPostContentSubmitPostsTags];
    [aCoder encodeObject:_title forKey:kZHPostContentSubmitPostsTitle];
    [aCoder encodeObject:_image forKey:kZHPostContentSubmitPostsImage];
    [aCoder encodeObject:_markdown forKey:kZHPostContentSubmitPostsMarkdown];
    [aCoder encodeObject:_slug forKey:kZHPostContentSubmitPostsSlug];
    [aCoder encodeObject:_language forKey:kZHPostContentSubmitPostsLanguage];
    [aCoder encodeObject:_updatedAt forKey:kZHPostContentSubmitPostsUpdatedAt];
    [aCoder encodeBool:_page forKey:kZHPostContentSubmitPostsPage];
    [aCoder encodeDouble:_updatedBy forKey:kZHPostContentSubmitPostsUpdatedBy];
    [aCoder encodeObject:_metaTitle forKey:kZHPostContentSubmitPostsMetaTitle];
    [aCoder encodeObject:_status forKey:kZHPostContentSubmitPostsStatus];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHPostContentSubmitPosts *copy = [[ZHPostContentSubmitPosts alloc] init];
    
    if (copy) {

        copy.postsIdentifier = [self.postsIdentifier copyWithZone:zone];
        copy.publishedAt = [self.publishedAt copyWithZone:zone];
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.publishedBy = [self.publishedBy copyWithZone:zone];
        copy.author = [self.author copyWithZone:zone];
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.featured = self.featured;
        copy.createdBy = self.createdBy;
        copy.tags = [self.tags copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.markdown = [self.markdown copyWithZone:zone];
        copy.slug = [self.slug copyWithZone:zone];
        copy.language = [self.language copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.page = self.page;
        copy.updatedBy = self.updatedBy;
        copy.metaTitle = [self.metaTitle copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
    }
    
    return copy;
}


@end
