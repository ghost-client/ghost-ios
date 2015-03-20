//
//  ZHGTagsResponseTags.h
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGTagsResponseTags : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double tagsIdentifier;
@property (nonatomic, strong) NSString *metaDescription;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *tagsDescription;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) id parent;
@property (nonatomic, assign) double createdBy;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, assign) BOOL hidden;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, strong) NSString *metaTitle;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
