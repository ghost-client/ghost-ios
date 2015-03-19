//
//  ZHPostContentSubmitBaseClass.h
//
//  Created by  自己联通 on 15/3/19
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHPostContentSubmitBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSArray *posts;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
