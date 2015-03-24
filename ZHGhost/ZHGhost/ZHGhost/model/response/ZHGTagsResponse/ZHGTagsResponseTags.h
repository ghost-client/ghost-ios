//
//  ZHGTagsResponseTags.h
//
//  Created by  自己联通 on 15/3/24
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGTagsResponseTags : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double tagsIdentifier;
@property (nonatomic, assign) id metaDescription;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, assign) id tagsDescription;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) id parent;
@property (nonatomic, assign) double createdBy;
@property (nonatomic, assign) id image;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, assign) id metaTitle;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double postCount;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
