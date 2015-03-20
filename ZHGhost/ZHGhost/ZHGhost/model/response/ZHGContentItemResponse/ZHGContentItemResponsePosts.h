//
//  ZHGContentItemResponsePosts.h
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGContentItemResponsePosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *slug;
@property (nonatomic, assign) double publishedBy;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, assign) id image;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, strong) NSString *html;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *markdown;
@property (nonatomic, assign) id metaDescription;
@property (nonatomic, assign) double postsIdentifier;
@property (nonatomic, assign) id metaTitle;
@property (nonatomic, assign) BOOL page;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double createdBy;
@property (nonatomic, assign) BOOL featured;
@property (nonatomic, assign) double author;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
