//
//  ZHGUserInfoResponseRoles.h
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGUserInfoResponseRoles : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double createdBy;
@property (nonatomic, assign) double rolesIdentifier;
@property (nonatomic, strong) NSString *createdAt;
@property (nonatomic, assign) double updatedBy;
@property (nonatomic, strong) NSString *uuid;
@property (nonatomic, strong) NSString *updatedAt;
@property (nonatomic, strong) NSString *rolesDescription;
@property (nonatomic, strong) NSString *name;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
