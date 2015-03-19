//
//  ZHPostContentSubmitPosts.h
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHPostContentSubmitPosts : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *postsIdentifier;
@property (nonatomic, strong) NSString *publishedAt;
@property (nonatomic, assign) id metaDescription;
@property (nonatomic, strong) NSString *publishedBy;
@property (nonatomic, strong) NSString *author;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) BOOL featured;
@property (nonatomic, assign) double createdBy;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) id image;
@property (nonatomic, strong) NSString *markdown;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) BOOL page;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, assign) id metaTitle;
@property (nonatomic, strong) NSString *status;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
