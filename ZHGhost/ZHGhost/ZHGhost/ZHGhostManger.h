//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 IOS版GHOST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBlockConfig.h"

typedef NS_ENUM(NSInteger , ZHGhostErrorCode){

   ZHGhostErrorCodeVailedJsonFormatter=99999

};
typedef NS_ENUM(NSInteger , ZHGhostTagsLimit){

    ZHGhostTagsLimitDefault=15,
    ZHGhostTagsLimitMax=100

};
#define VAILED_JSON_MESSAGE  @"JSON解析失败"
@interface ZHGhostManger : NSObject{

     NSString *_WDToken;
    NSString * _WDExpiresIn;

}

/**
* 初始化
*/
+(instancetype)manger;

@property (nonatomic, assign, readonly)BOOL isLogin;//登录之后的请求 如果此值为NO 必须重新的登录

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


/**
* 获取用户的资料
*/
-(void)userInfoSuccess:(ZHUserInfoSuccess)success
                failed:(ZHFailed)failed;


//获取所有的通知列表
-(void)allNotication;

//获取所有的文章列表
- (void)allPostContentStatus:(NSString *)status
                 staticPages:(NSString *)staticPages
                        page:(NSInteger)page
                     include:(NSString *)include
                     success:(ZHContentItemSuccess)success
                      failed:(ZHFailed)failed;

//上传图片
-(void)uploadImage:(NSData*)imageData
           success:(ZHUploadSuccess)success
            failed:(ZHFailed)failed;

/**
* 获取所有的的TAG
* @param limit 查询限制 默认和0都为限制15条 最大限制为100条
*/
- (void)allTags:(NSUInteger)limit success:(ZHTagsSuccess)success failed:(ZHFailed)failed;

/**
* 创建一个新的TAG
* @param tags 包含ZHCreatTagsSubmitBaseClass类的元素
*/
- (void)creatTags:(NSArray *)tags success:(ZHCreatTagsSuccess)success failed:(ZHFailed)failed;
@end