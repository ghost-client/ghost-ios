//
//  ZHAllUserResponsePagination.h
//
//  Created by  自己联通 on 15/3/26
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHAllUserResponsePagination : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double prev;
@property (nonatomic, assign) double pages;
@property (nonatomic, assign) double limit;
@property (nonatomic, assign) double next;
@property (nonatomic, assign) double total;
@property (nonatomic, assign) double page;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
