//
//  ZHFailedBaseClass.h
//
//  Created by  自己联通 on 15/3/18
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHFailedBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *errors;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
