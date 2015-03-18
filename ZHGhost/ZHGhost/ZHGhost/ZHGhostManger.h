//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 IOS版GHOST. All rights reserved.
//

#import <UIKit/UIKit.h>


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
-(void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord;


@end