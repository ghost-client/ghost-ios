//
//  ZHBlockConfig.h
//  ZHGhost
//
//  Created by hangzhang on 15/3/18.
//  Copyright (c) 2015 hangzhang. All rights reserved.
//

#ifndef ZHGhost_ZHBlockConfig____FILEEXTENSION___
#define ZHGhost_ZHBlockConfig____FILEEXTENSION___

#import <UIKit/UIKit.h>

@class ZHGTokenResponseBaseClass;
@class ZHGUserInfoResponseBaseClass;
@class ZHGContentItemResponseBaseClass;
@class ZHGTagsResponseBaseClass;
@class ZHCreatTagsResponseBaseClass;
@class ZHGTagsResponseTags;

typedef void (^ZHFailed)(NSError *error,NSString *errorMessage,NSInteger errorCode);

/**
* 获取Token 成功的返回
* response 返回Token的数据
*/
typedef void (^ZHTokenSuccess)(ZHGTokenResponseBaseClass * response);

typedef void (^ZHUserInfoSuccess)(ZHGUserInfoResponseBaseClass *response);

typedef void (^ZHUploadSuccess)(NSString *url);

/**
* 获取文章列表的返回
*/
typedef void (^ZHContentItemSuccess)(ZHGContentItemResponseBaseClass *response);

/**
* 获取TAG的返回
*/
typedef void (^ZHTagsSuccess)(ZHGTagsResponseBaseClass *response);

/**
* 创建TAG的返回
*/
typedef void (^ZHCreatTagsSuccess)(ZHCreatTagsResponseBaseClass *response);

/**
* 删除TAG的返回
*
*/

typedef void (^ZHDeleteTagsSuccess)(ZHGTagsResponseTags *tags);



/**
* 编辑TAG的返回
*/

typedef void (^ZHEditTagsSuccess)(ZHGTagsResponseTags *tags);


#endif
