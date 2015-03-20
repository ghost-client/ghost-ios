//
//  ZHGContentItemResponsePosts.m
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ZHGContentItemResponsePosts.h"


NSString *const kZHGContentItemResponsePostsSlug = @"slug";
NSString *const kZHGContentItemResponsePostsPublishedBy = @"published_by";
NSString *const kZHGContentItemResponsePostsLanguage = @"language";
NSString *const kZHGContentItemResponsePostsTitle = @"title";
NSString *const kZHGContentItemResponsePostsUrl = @"url";
NSString *const kZHGContentItemResponsePostsTags = @"tags";
NSString *const kZHGContentItemResponsePostsImage = @"image";
NSString *const kZHGContentItemResponsePostsStatus = @"status";
NSString *const kZHGContentItemResponsePostsPublishedAt = @"published_at";
NSString *const kZHGContentItemResponsePostsUpdatedAt = @"updated_at";
NSString *const kZHGContentItemResponsePostsUpdatedBy = @"updated_by";
NSString *const kZHGContentItemResponsePostsHtml = @"html";
NSString *const kZHGContentItemResponsePostsUuid = @"uuid";
NSString *const kZHGContentItemResponsePostsMarkdown = @"markdown";
NSString *const kZHGContentItemResponsePostsMetaDescription = @"meta_description";
NSString *const kZHGContentItemResponsePostsId = @"id";
NSString *const kZHGContentItemResponsePostsMetaTitle = @"meta_title";
NSString *const kZHGContentItemResponsePostsPage = @"page";
NSString *const kZHGContentItemResponsePostsCreatedAt = @"created_at";
NSString *const kZHGContentItemResponsePostsCreatedBy = @"created_by";
NSString *const kZHGContentItemResponsePostsFeatured = @"featured";
NSString *const kZHGContentItemResponsePostsAuthor = @"author";


@interface ZHGContentItemResponsePosts ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ZHGContentItemResponsePosts

@synthesize slug = _slug;
@synthesize publishedBy = _publishedBy;
@synthesize language = _language;
@synthesize title = _title;
@synthesize url = _url;
@synthesize tags = _tags;
@synthesize image = _image;
@synthesize status = _status;
@synthesize publishedAt = _publishedAt;
@synthesize updatedAt = _updatedAt;
@synthesize updatedBy = _updatedBy;
@synthesize html = _html;
@synthesize uuid = _uuid;
@synthesize markdown = _markdown;
@synthesize metaDescription = _metaDescription;
@synthesize postsIdentifier = _postsIdentifier;
@synthesize metaTitle = _metaTitle;
@synthesize page = _page;
@synthesize createdAt = _createdAt;
@synthesize createdBy = _createdBy;
@synthesize featured = _featured;
@synthesize author = _author;


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
            self.slug = [self objectOrNilForKey:kZHGContentItemResponsePostsSlug fromDictionary:dict];
            self.publishedBy = [[self objectOrNilForKey:kZHGContentItemResponsePostsPublishedBy fromDictionary:dict] doubleValue];
            self.language = [self objectOrNilForKey:kZHGContentItemResponsePostsLanguage fromDictionary:dict];
            self.title = [self objectOrNilForKey:kZHGContentItemResponsePostsTitle fromDictionary:dict];
            self.url = [self objectOrNilForKey:kZHGContentItemResponsePostsUrl fromDictionary:dict];
            self.tags = [self objectOrNilForKey:kZHGContentItemResponsePostsTags fromDictionary:dict];
            self.image = [self objectOrNilForKey:kZHGContentItemResponsePostsImage fromDictionary:dict];
            self.status = [self objectOrNilForKey:kZHGContentItemResponsePostsStatus fromDictionary:dict];
            self.publishedAt = [self objectOrNilForKey:kZHGContentItemResponsePostsPublishedAt fromDictionary:dict];
            self.updatedAt = [self objectOrNilForKey:kZHGContentItemResponsePostsUpdatedAt fromDictionary:dict];
            self.updatedBy = [[self objectOrNilForKey:kZHGContentItemResponsePostsUpdatedBy fromDictionary:dict] doubleValue];
            self.html = [self objectOrNilForKey:kZHGContentItemResponsePostsHtml fromDictionary:dict];
            self.uuid = [self objectOrNilForKey:kZHGContentItemResponsePostsUuid fromDictionary:dict];
            self.markdown = [self objectOrNilForKey:kZHGContentItemResponsePostsMarkdown fromDictionary:dict];
            self.metaDescription = [self objectOrNilForKey:kZHGContentItemResponsePostsMetaDescription fromDictionary:dict];
            self.postsIdentifier = [[self objectOrNilForKey:kZHGContentItemResponsePostsId fromDictionary:dict] doubleValue];
            self.metaTitle = [self objectOrNilForKey:kZHGContentItemResponsePostsMetaTitle fromDictionary:dict];
            self.page = [[self objectOrNilForKey:kZHGContentItemResponsePostsPage fromDictionary:dict] boolValue];
            self.createdAt = [self objectOrNilForKey:kZHGContentItemResponsePostsCreatedAt fromDictionary:dict];
            self.createdBy = [[self objectOrNilForKey:kZHGContentItemResponsePostsCreatedBy fromDictionary:dict] doubleValue];
            self.featured = [[self objectOrNilForKey:kZHGContentItemResponsePostsFeatured fromDictionary:dict] boolValue];
            self.author = [[self objectOrNilForKey:kZHGContentItemResponsePostsAuthor fromDictionary:dict] doubleValue];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.slug forKey:kZHGContentItemResponsePostsSlug];
    [mutableDict setValue:[NSNumber numberWithDouble:self.publishedBy] forKey:kZHGContentItemResponsePostsPublishedBy];
    [mutableDict setValue:self.language forKey:kZHGContentItemResponsePostsLanguage];
    [mutableDict setValue:self.title forKey:kZHGContentItemResponsePostsTitle];
    [mutableDict setValue:self.url forKey:kZHGContentItemResponsePostsUrl];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForTags] forKey:kZHGContentItemResponsePostsTags];
    [mutableDict setValue:self.image forKey:kZHGContentItemResponsePostsImage];
    [mutableDict setValue:self.status forKey:kZHGContentItemResponsePostsStatus];
    [mutableDict setValue:self.publishedAt forKey:kZHGContentItemResponsePostsPublishedAt];
    [mutableDict setValue:self.updatedAt forKey:kZHGContentItemResponsePostsUpdatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.updatedBy] forKey:kZHGContentItemResponsePostsUpdatedBy];
    [mutableDict setValue:self.html forKey:kZHGContentItemResponsePostsHtml];
    [mutableDict setValue:self.uuid forKey:kZHGContentItemResponsePostsUuid];
    [mutableDict setValue:self.markdown forKey:kZHGContentItemResponsePostsMarkdown];
    [mutableDict setValue:self.metaDescription forKey:kZHGContentItemResponsePostsMetaDescription];
    [mutableDict setValue:[NSNumber numberWithDouble:self.postsIdentifier] forKey:kZHGContentItemResponsePostsId];
    [mutableDict setValue:self.metaTitle forKey:kZHGContentItemResponsePostsMetaTitle];
    [mutableDict setValue:[NSNumber numberWithBool:self.page] forKey:kZHGContentItemResponsePostsPage];
    [mutableDict setValue:self.createdAt forKey:kZHGContentItemResponsePostsCreatedAt];
    [mutableDict setValue:[NSNumber numberWithDouble:self.createdBy] forKey:kZHGContentItemResponsePostsCreatedBy];
    [mutableDict setValue:[NSNumber numberWithBool:self.featured] forKey:kZHGContentItemResponsePostsFeatured];
    [mutableDict setValue:[NSNumber numberWithDouble:self.author] forKey:kZHGContentItemResponsePostsAuthor];

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

    self.slug = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsSlug];
    self.publishedBy = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePostsPublishedBy];
    self.language = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsLanguage];
    self.title = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsTitle];
    self.url = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsUrl];
    self.tags = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsTags];
    self.image = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsImage];
    self.status = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsStatus];
    self.publishedAt = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsPublishedAt];
    self.updatedAt = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsUpdatedAt];
    self.updatedBy = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePostsUpdatedBy];
    self.html = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsHtml];
    self.uuid = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsUuid];
    self.markdown = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsMarkdown];
    self.metaDescription = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsMetaDescription];
    self.postsIdentifier = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePostsId];
    self.metaTitle = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsMetaTitle];
    self.page = [aDecoder decodeBoolForKey:kZHGContentItemResponsePostsPage];
    self.createdAt = [aDecoder decodeObjectForKey:kZHGContentItemResponsePostsCreatedAt];
    self.createdBy = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePostsCreatedBy];
    self.featured = [aDecoder decodeBoolForKey:kZHGContentItemResponsePostsFeatured];
    self.author = [aDecoder decodeDoubleForKey:kZHGContentItemResponsePostsAuthor];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_slug forKey:kZHGContentItemResponsePostsSlug];
    [aCoder encodeDouble:_publishedBy forKey:kZHGContentItemResponsePostsPublishedBy];
    [aCoder encodeObject:_language forKey:kZHGContentItemResponsePostsLanguage];
    [aCoder encodeObject:_title forKey:kZHGContentItemResponsePostsTitle];
    [aCoder encodeObject:_url forKey:kZHGContentItemResponsePostsUrl];
    [aCoder encodeObject:_tags forKey:kZHGContentItemResponsePostsTags];
    [aCoder encodeObject:_image forKey:kZHGContentItemResponsePostsImage];
    [aCoder encodeObject:_status forKey:kZHGContentItemResponsePostsStatus];
    [aCoder encodeObject:_publishedAt forKey:kZHGContentItemResponsePostsPublishedAt];
    [aCoder encodeObject:_updatedAt forKey:kZHGContentItemResponsePostsUpdatedAt];
    [aCoder encodeDouble:_updatedBy forKey:kZHGContentItemResponsePostsUpdatedBy];
    [aCoder encodeObject:_html forKey:kZHGContentItemResponsePostsHtml];
    [aCoder encodeObject:_uuid forKey:kZHGContentItemResponsePostsUuid];
    [aCoder encodeObject:_markdown forKey:kZHGContentItemResponsePostsMarkdown];
    [aCoder encodeObject:_metaDescription forKey:kZHGContentItemResponsePostsMetaDescription];
    [aCoder encodeDouble:_postsIdentifier forKey:kZHGContentItemResponsePostsId];
    [aCoder encodeObject:_metaTitle forKey:kZHGContentItemResponsePostsMetaTitle];
    [aCoder encodeBool:_page forKey:kZHGContentItemResponsePostsPage];
    [aCoder encodeObject:_createdAt forKey:kZHGContentItemResponsePostsCreatedAt];
    [aCoder encodeDouble:_createdBy forKey:kZHGContentItemResponsePostsCreatedBy];
    [aCoder encodeBool:_featured forKey:kZHGContentItemResponsePostsFeatured];
    [aCoder encodeDouble:_author forKey:kZHGContentItemResponsePostsAuthor];
}

- (id)copyWithZone:(NSZone *)zone
{
    ZHGContentItemResponsePosts *copy = [[ZHGContentItemResponsePosts alloc] init];
    
    if (copy) {

        copy.slug = [self.slug copyWithZone:zone];
        copy.publishedBy = self.publishedBy;
        copy.language = [self.language copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.tags = [self.tags copyWithZone:zone];
        copy.image = [self.image copyWithZone:zone];
        copy.status = [self.status copyWithZone:zone];
        copy.publishedAt = [self.publishedAt copyWithZone:zone];
        copy.updatedAt = [self.updatedAt copyWithZone:zone];
        copy.updatedBy = self.updatedBy;
        copy.html = [self.html copyWithZone:zone];
        copy.uuid = [self.uuid copyWithZone:zone];
        copy.markdown = [self.markdown copyWithZone:zone];
        copy.metaDescription = [self.metaDescription copyWithZone:zone];
        copy.postsIdentifier = self.postsIdentifier;
        copy.metaTitle = [self.metaTitle copyWithZone:zone];
        copy.page = self.page;
        copy.createdAt = [self.createdAt copyWithZone:zone];
        copy.createdBy = self.createdBy;
        copy.featured = self.featured;
        copy.author = self.author;
    }
    
    return copy;
}


@end
