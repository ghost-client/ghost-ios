//
//  ZHUserInfoModelBaseClass.h
//
//  Created by  自己联通 on 15/3/24
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHUserInfoModelBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *token;
@property (nonatomic, strong) NSString *passWord;
@property (nonatomic, strong) NSString *host;
@property (nonatomic, strong) NSString *expresionIN;
@property (nonatomic, strong) NSString *userName;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
