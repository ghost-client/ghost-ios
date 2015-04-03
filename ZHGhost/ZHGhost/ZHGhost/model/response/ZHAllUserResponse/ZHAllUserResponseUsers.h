//
//  ZHAllUserResponseUsers.h
//
//  Created by  自己联通 on 15/3/27
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHAllUserResponseUsers : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *location;
@property (nonatomic, strong) NSString *slug;
@property (nonatomic, strong) NSString *language;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *image;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *bio;
@property (nonatomic, strong) NSString *metaDescription;
@property (nonatomic, strong) NSString *lastLogin;
@property (nonatomic, strong) NSString *cover;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, assign) double usersIdentifier;
@property (nonatomic, strong) NSArray *roles;
@property (nonatomic, strong) NSString *accessibility;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *website;
@property (nonatomic, strong) NSString *metaTitle;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double createdBy;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
