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

typedef void (^ZHFailed)(NSError *error,NSString *errorMessage,NSInteger errorCode);

/**
* 获取Token 成功的返回
* response 返回Token的数据
*/
typedef void (^ZHTokenSuccess)(ZHGTokenResponseBaseClass * response);

typedef void (^ZHUserInfoSuccess)(ZHGUserInfoResponseBaseClass *response);

typedef void (^ZHUploadSuccess)(NSString *url);

#endif
