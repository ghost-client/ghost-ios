//
//  ZHAllUserResponseBaseClass.h
//
//  Created by  自己联通 on 15/3/26
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ZHAllUserResponseMeta;

@interface ZHAllUserResponseBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *users;
@property (nonatomic, strong) ZHAllUserResponseMeta *meta;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
