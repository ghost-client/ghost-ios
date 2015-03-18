//
//  ZHGTokenResponseBaseClass.h
//
//  Created by  自己联通 on 15/3/18
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHGTokenResponseBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *refreshToken;
@property (nonatomic, assign) double expiresIn;
@property (nonatomic, strong) NSString *accessToken;
@property (nonatomic, strong) NSString *tokenType;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
