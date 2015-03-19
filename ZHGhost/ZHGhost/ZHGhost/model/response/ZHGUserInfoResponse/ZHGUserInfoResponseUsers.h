//
//  ZHGUserInfoResponseUsers.h
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGUserInfoResponseUsers : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) id location;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, assign) id image;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, assign) id bio;
@property (nonatomic, assign) id metaDescription;
@property (nonatomic, strong) NSString *lastLogin;
@property (nonatomic, assign) id cover;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double usersIdentifier;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, assign) id accessibility;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, assign) id website;
@property (nonatomic, assign) id metaTitle;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double createdBy;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
