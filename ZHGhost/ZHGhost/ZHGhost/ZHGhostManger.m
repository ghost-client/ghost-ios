//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 IOS版GHOST. All rights reserved.
//

#import "ZHGhostManger.h"
#import "AFHTTPRequestOperationManager.h"
#import "ZHGhostApiConfig.h"
#import "JSONKit.h"

static NSString * BaseUrl(NSString *url,NSString *host){

    return [NSString stringWithFormat:@"%@/%@",host,url];

}

@implementation ZHGhostManger {

    NSString *_ghostHost;//主机地址
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
- (void)loginWithUserName:(NSString *)userName passWord:(NSString *)passWord {


    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];

    NSDictionary *dictionary=@{
            @"grant_type":@"password",
            @"username":userName,
            @"password":passWord,
            @"client_id":@"ghost-admin",

    };


  [manager POST:BaseUrl(ZH_LOGIN_URL, _ghostHost) parameters:dictionary success:^(AFHTTPRequestOperation *operation, id responseObject) {

      NSLog(@"%@",[responseObject JSONString]);
  } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"%@",error.userInfo);

  }];

}


//http://js.uiapple.com/ghost/api/v0.1/authentication/token
@end