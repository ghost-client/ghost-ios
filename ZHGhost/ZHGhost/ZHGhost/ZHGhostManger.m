//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 IOS版GHOST. All rights reserved.
//

#import "ZHGhostManger.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZHGhostApiConfig.h"
#import "JSONKit.h"
#import "ZHGTokenResponseBaseClass.h"
#import "ZHFailedBaseClass.h"
#import "ZHFailedErrors.h"

static NSString * BaseUrl(NSString *url,NSString *host){

    return [NSString stringWithFormat:@"%@%@",host,url];

}

@implementation ZHGhostManger {

    NSString *_ghostHost;//主机地址
    void (^_tokenSuccess)();//获取Token成功的返回

    ZHFailed _failed;
}
+ (instancetype)manger {

    static ZHGhostManger *ghostManger= nil;
    if (ghostManger== nil){
        ghostManger=[[ZHGhostManger alloc]init];
    }

    return ghostManger;
}

- (void)congfigHost:(NSString *)host {

    _ghostHost=[NSString stringWithFormat:@"%@/ghost/api/v0.1/",host];

}

/**
* grant_type	password
username	15038777234@163.com
password	zhanghang1990823
client_id	ghost-admin
*
*/
-(void)loginWithUserName:(NSString *)userName
                passWord:(NSString *)passWord
                 success:(void(^)(void))success
                  failed:(ZHFailed)failed {


    _tokenSuccess=success;
    
    _failed=failed;
    
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];

    NSDictionary *dictionary=@{
            @"grant_type":@"password",
            @"username":userName,
            @"password":passWord,
            @"client_id":@"ghost-admin",

    };

    __weak typeof(self) safeSelf = self;


  [manager POST:BaseUrl(ZH_LOGIN_URL, _ghostHost) parameters:dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {


      NSLog(@"%@",[responseObject JSONString]);

      if (responseObject){

         // ZHGTokenResponseBaseClass *tokenResponseBaseClass=[ZHGTokenResponseBaseClass modelObjectWithDictionary:responseObject];




      } else{
          [safeSelf showError:nil errorMessage:VAILED_JSON_MESSAGE errorCode:ZHGhostErrorCodeVailedJsonFormatter];
      }


  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {


      [safeSelf showRequestErrorMessage:safeSelf error:error];


  }];

}

- (void)showRequestErrorMessage:(ZHGhostManger *)safeSelf error:(NSError *)error {
    NSData *data=error.userInfo[@"com.alamofire.serialization.response.error.data"];

    NSString *string= [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];


    NSDictionary *dictionary1=[string objectFromJSONString];

    ZHFailedBaseClass *failedBaseClass=[ZHFailedBaseClass modelObjectWithDictionary:dictionary1];


    NSString *errorMessage= nil;
    if (failedBaseClass.errors.count>0){
          ZHFailedErrors *errors=failedBaseClass.errors[0];
          errorMessage=errors.message;
      }


    [safeSelf showError:error errorMessage:errorMessage errorCode:0];
}

- (void)showError:(NSError *)error errorMessage:(NSString *)errorMessage errorCode:(NSInteger)erroorCode {
    if (_failed){
          _failed(error, errorMessage,erroorCode);
      }
}


//http://js.uiapple.com/ghost/api/v0.1/authentication/token
@end