//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 IOS版GHOST. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZHBlockConfig.h"

@class ZHGTagsResponseTags;
@class ZHGUserInfoResponseUsers;

#define USER_INFO_KEY @"users_info_key"

typedef NS_ENUM(NSInteger , ZHGhostErrorCode){

   ZHGhostErrorCodeVailedJsonFormatter=99999

};
typedef NS_ENUM(NSUInteger , ZHGhostTagsLimit){

    ZHGhostTagsLimitDefault=15,
    ZHGhostTagsLimitMax=100,
    ZHGhostTagsLimitAll= UINT_MAX

};
#define VAILED_JSON_MESSAGE  @"JSON解析失败"
@interface ZHGhostManger : NSObject{

     NSString *_WDToken;
    NSString * _WDExpiresIn;

}

@property (nonatomic, strong)ZHGUserInfoResponseUsers *currentUser;//当前登录用户的信息 如果设置就存在 否则为NIL

@property (nonatomic, strong, readonly)NSString *currentLoginUserName;

- (BOOL)isLogin:(NSString *)loginUserName;

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

/**
* 删除一个TAG
* @param tagID 要删除TAG的ID
*/
- (void)deleteTag:(NSUInteger)tagID success:(ZHTagsSuccess)success failed:(ZHFailed)failed;

/**
* 编辑一个TAG
* @param tags要编辑的tag的对象
*/

- (void)editTag:(ZHGTagsResponseTags *)tags success:(ZHEditTagsSuccess)success failed:(ZHFailed)failed;

/**
* 修改密码
* oldpassword 旧密码
* newPassword 新密码
* ne2Password 新密码
* userId 用户的ID
*/
- (void)resetPassword:(NSString *)oldPassword newPassword:(NSString *)newPassword ne2Password:(NSString *)ne2Password userId:(NSString *)userId success:(ZHGResetPasswordSuccess)success failed:(ZHFailed)failed;

/**
* 获取所有的用户的数据
* @param page 当前请求的页数
* @param limit 限制请求的大小 最大100条
*/
- (void)allUserPage:(NSUInteger)page limit:(NSUInteger)limit success:(ZHGAllUserSuccess)success failed:(ZHFailed)failed;
@end