//
//  ZHGUserInfoResponseBaseClass.h
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGUserInfoResponseBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *users;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
