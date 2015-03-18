//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 IOS版GHOST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBlockConfig.h"

typedef NS_ENUM(NSInteger , ZHGhostErrorCode){

   ZHGhostErrorCodeVailedJsonFormatter=99999

};
#define VAILED_JSON_MESSAGE  @"JSON解析失败"
@interface ZHGhostManger : NSObject

/**
* 初始化
*/
+(instancetype)manger;

/**
* 配置ghost域名地址比如 http://www.baidu.com
*/
-(void)congfigHost:(NSString *)host;

/**
* 登录
*/
-(void)loginWithUserName:(NSString *)userName
                passWord:(NSString *)passWord
                 success:(void(^)(void))success
                  failed:(ZHFailed)failed;


@end