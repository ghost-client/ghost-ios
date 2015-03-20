//
//  ZHCreatTagsSubmitBaseClass.h
//
//  Created by  自己联通 on 15/3/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ZHCreatTagsSubmitBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *slug;//标签URL
@property (nonatomic, assign) BOOL hidden;//标签在文章里面是否可见
@property (nonatomic, strong) NSString *metaDescription;//标签SEO描述
@property (nonatomic, strong) NSString *image;//标签的图片
@property (nonatomic, strong) NSString *internalBaseClassDescription;
@property (nonatomic, strong) NSString *name;//标签的标题
@property (nonatomic, strong) NSString *metaTitle;//标签的描述

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
