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
#import "ZHGUserInfoResponseBaseClass.h"
#import "ZHGContentItemResponseBaseClass.h"
#import "ZHGTagsResponseBaseClass.h"
#import "ZHCreatTagsSubmitBaseClass.h"
#import "ZHCreatTagsResponseBaseClass.h"

#define EXPIRESIN @"expires_in"

#define WDTOKEN @"wd_token"

static NSString *BaseUrl(NSString *url, NSString *host) {

    return [NSString stringWithFormat:@"%@%@", host, url];

}

@implementation ZHGhostManger {

    NSString *_ghostHost;

    //主机地址
    void (^_tokenSuccess)();//获取Token成功的返回

    ZHFailed _failed;
    NSString *_loginUserName;
    NSString *_loginPassword;
    ZHUserInfoSuccess _userInfoSuccess;
    ZHUploadSuccess _uploadSuccess;
    NSString *_myHost;
    ZHContentItemSuccess _contentSuccess;
    ZHTagsSuccess _tagsSuccess;
    ZHCreatTagsSuccess _creatTagsSuccess;
}
- (BOOL)isLogin {

    return [self setTokenStart:_loginPassword];
}

+ (instancetype)manger {

    static ZHGhostManger *ghostManger = nil;
    if (ghostManger == nil) {
        ghostManger = [[ZHGhostManger alloc] init];
    }

    return ghostManger;
}

- (void)congfigHost:(NSString *)host {

    NSParameterAssert(host);

    _myHost = host;

    _ghostHost = [NSString stringWithFormat:@"%@/ghost/api/v0.1/", host];

}


/**
* grant_type	password
username	15038777234@163.com
password	zhanghang1990823
client_id	ghost-admin
*
*/
- (void)loginWithUserName:(NSString *)userName
                 passWord:(NSString *)passWord
                  success:(void (^)(void))success
                   failed:(ZHFailed)failed {

    _loginUserName = userName;

    _loginPassword = passWord;
    if ([self setTokenStart:userName]) {

        if (success) {
            success();
        }

        return;

    }


    NSParameterAssert(_ghostHost);
    
    _tokenSuccess = success;
    
    _failed = failed;

    NSParameterAssert(userName);

    NSParameterAssert(passWord);
    

    __weak typeof(self) safeSelf = self;

    // ghost登录 (POST http://js.uiapple.com/ghost/api/v0.1/authentication/token)

    // Create manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    // Form URL-Encoded Body
    NSDictionary *bodyParameters = @{
            @"username" : userName,
            @"password" : passWord,
            @"client_id" : @"ghost-admin",
            @"grant_type" : @"password",
    };


    NSString *urlString = BaseUrl(ZH_LOGIN_URL, _ghostHost);

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:bodyParameters error:NULL];

    // Add Headers
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];

    // Fetch Request
    AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
                                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {


                                                                                          if (responseObject) {

                                                                                              ZHGTokenResponseBaseClass *tokenResponseBaseClass = [ZHGTokenResponseBaseClass modelObjectWithDictionary:responseObject];

                                                                                              _WDToken = [NSString stringWithFormat:@"%@ %@", tokenResponseBaseClass.tokenType, tokenResponseBaseClass.accessToken];

                                                                                              NSDictionary *dictionary = @{

                                                                                                      WDTOKEN : _WDToken,

                                                                                                      EXPIRESIN : [self stringWithDate:[[NSDate date] dateByAddingTimeInterval:tokenResponseBaseClass.expiresIn - 60]]


                                                                                              };

                                                                                              [[NSUserDefaults standardUserDefaults] setObject:dictionary forKey:userName];

                                                                                              [[NSUserDefaults standardUserDefaults] synchronize];

                                                                                              if (_tokenSuccess) {
                                                                                                  _tokenSuccess();
                                                                                              }


                                                                                          } else {
                                                                                              [safeSelf showError:nil errorMessage:VAILED_JSON_MESSAGE errorCode:ZHGhostErrorCodeVailedJsonFormatter];
                                                                                          }
                                                                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [safeSelf showRequestErrorMessage:safeSelf error:error];
            }];

    [manager.operationQueue addOperation:afhttpRequestOperation];


}

- (void)userInfoSuccess:(ZHUserInfoSuccess)success
                 failed:(ZHFailed)failed {

    _userInfoSuccess = success;
    
    _failed = failed;
    if ([self setTokenStart:_loginUserName]) {

        [self getUserInfo];
    }


}

- (void)allNotication {
    // 查询通知 (GET http://js.uiapple.com/ghost/api/v0.1/notifications/)

    // Create manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];


    NSString *urlString = BaseUrl(ZHNOTICATION_URL, _ghostHost);

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:NULL error:NULL];

    // Add Headers
    [request setValue:_WDToken forHTTPHeaderField:@"Authorization"];

    // Fetch Request
    AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
                                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                                                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            }];

    [manager.operationQueue addOperation:afhttpRequestOperation];
}

- (void)allPostContentStatus:(NSString *)status
                 staticPages:(NSString *)staticPages
                        page:(NSInteger)page
                     include:(NSString *)include
                     success:(ZHContentItemSuccess)success
                      failed:(ZHFailed)failed

{

    _contentSuccess=success;

    _failed=failed;

    // 查询文章 (GET http://js.uiapple.com/ghost/api/v0.1//posts/)

    // Create manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    // Create request
    NSDictionary *URLParams = @{
            @"status" : @"all",
            @"staticPages" : @"all",
            @"page" : @"1",
            @"include" : @"tags",
    };

    NSString *urlString = BaseUrl(ZHPOST_CONTENT_URL, _ghostHost);

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:URLParams error:NULL];

    // Add Headers
    [request setValue:_WDToken forHTTPHeaderField:@"Authorization"];

    __weak typeof(self) safeSelf = self;

    // Fetch Request
    AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
                                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                                                                          if (responseObject){

                                                                                              [safeSelf showContentItemSuccess:responseObject];


                                                                                          } else{

                                                                                              [safeSelf showError:nil errorMessage:VAILED_JSON_MESSAGE errorCode:ZHGhostErrorCodeVailedJsonFormatter];

                                                                                          }


                                                                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {


                [safeSelf showRequestErrorMessage:safeSelf error:error];

            }];

    [manager.operationQueue addOperation:afhttpRequestOperation];


}

- (void)showContentItemSuccess:(id)responseObject {
    ZHGContentItemResponseBaseClass *contentItemResponseBaseClass=[ZHGContentItemResponseBaseClass modelObjectWithDictionary:responseObject];

    if (_contentSuccess){
                                                                                                  _contentSuccess(contentItemResponseBaseClass);
                                                                                              }
}

- (void)uploadImage:(NSData *)imageData
            success:(ZHUploadSuccess)success
             failed:(ZHFailed)failed {
    
    _uploadSuccess = success;
    
    _failed = failed;

    // 上传图片 (POST http://js.uiapple.com/ghost/api/v0.1/uploads/)

    // Create manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    NSString *urlString = BaseUrl(ZHUPLOAD_URL, _ghostHost);

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] multipartFormRequestWithMethod:@"POST" URLString:urlString parameters:nil constructingBodyWithBlock:^(id <AFMultipartFormData> formData) {

        [formData appendPartWithFileData:imageData name:@"uploadimage" fileName:@"uploadimage.png" mimeType:@"image/png"];

    }                                                                                             error:NULL];
    // Add Headers
    [request setValue:_WDToken forHTTPHeaderField:@"Authorization"];

    __weak typeof(self) safeSelf = self;

    // Fetch Request
    AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
                                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {
                                                                                          if (responseObject) {

                                                                                              [safeSelf showUploadSuccess:responseObject];


                                                                                          }
                                                                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [safeSelf showRequestErrorMessage:safeSelf error:error];
            }];

    [manager.operationQueue addOperation:afhttpRequestOperation];

}

- (void)allTags:(NSUInteger)limit
        success:(ZHTagsSuccess)success
         failed:(ZHFailed)failed{
    
    _tagsSuccess=success;
    
    _failed=failed;

    if (limit>100){

        limit=ZHGhostTagsLimitMax;
    }

    // 查询所有的标签 (GET http://js.uiapple.com/ghost/api/v0.1/tags/)

	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

	// Create request
	NSDictionary* URLParams = @{
		@"limit": [NSString stringWithFormat:@"%d",limit],
	};

    NSString *urlString= BaseUrl(ZHTAGS_URL, _ghostHost);

	NSMutableURLRequest* request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:URLParams error:NULL];

	// Add Headers
	[request setValue:_WDToken  forHTTPHeaderField:@"Authorization"];

    __weak typeof(self) safeSelf = self;

	// Fetch Request
	AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
	  success:^(AFHTTPRequestOperation *operation, id responseObject) {

          if (responseObject){

              [safeSelf showTagsSuccess:responseObject];

          } else{

              [safeSelf showError:nil errorMessage:VAILED_JSON_MESSAGE errorCode:ZHGhostErrorCodeVailedJsonFormatter];
          }

	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {

                [safeSelf showRequestErrorMessage:safeSelf error:error];

            }];

	[manager.operationQueue addOperation:afhttpRequestOperation];



}

-(void)creatTags:(NSArray *)tags
         success:(ZHCreatTagsSuccess)success
          failed:(ZHFailed)failed{

    _creatTagsSuccess=success;

    _failed=failed;

    NSParameterAssert(tags.count>0);

    NSMutableArray *array=[NSMutableArray array];

    for(ZHCreatTagsSubmitBaseClass *submitBaseClass in tags){

        NSParameterAssert(submitBaseClass.name);

        [array addObject:submitBaseClass.dictionaryRepresentation];

    }

    	// 新建标签 (POST http://js.uiapple.com/ghost/api/v0.1/tags/)

	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

	// JSON Body
	NSDictionary* bodyObject = @{
		@"tags": array
	};


    NSString *urlString= BaseUrl(ZHTAGS_URL, _ghostHost);

	NSMutableURLRequest* request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"POST" URLString:urlString parameters:bodyObject error:NULL];

	// Add Headers
	[request setValue:_WDToken forHTTPHeaderField:@"Authorization"];

    __weak typeof(self) safeSelf = self;

	// Fetch Request
	AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
	  success:^(AFHTTPRequestOperation *operation, id responseObject) {

          if (responseObject){

              [self showCreatTagsSuccess:responseObject];

          } else{

              [safeSelf showError:nil errorMessage:VAILED_JSON_MESSAGE errorCode:ZHGhostErrorCodeVailedJsonFormatter];

          }


	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {

                [safeSelf showRequestErrorMessage:safeSelf error:error];
            }];

	[manager.operationQueue addOperation:afhttpRequestOperation];


}

-(void)deleteTag:(NSUInteger)tagID{


	// 删除TAG (DELETE http://js.uiapple.com/ghost/api/v0.1/tags/3/)

	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    NSString *urlString= BaseUrl(ZHTAGS_URL, _ghostHost);

    urlString=[NSString stringWithFormat:@"%@%d/",urlString,tagID];

    NSMutableURLRequest* request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"DELETE" URLString:urlString parameters:nil error:NULL];


	// Add Headers
	[request setValue:_WDToken forHTTPHeaderField:@"Authorization"];

	// Fetch Request
	AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
	  success:^(AFHTTPRequestOperation *operation, id responseObject) {
	    NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
	    NSLog(@"HTTP Response Body: %@", responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"HTTP Request failed: %@", error);
	}];

	[manager.operationQueue addOperation:afhttpRequestOperation];


}

-(void)editTag:(NSUInteger)tagId{

	// 修改TAG (PUT http://js.uiapple.com/ghost/api/v0.1/tags/29/)

	// Create manager
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

	// JSON Body
	NSDictionary* bodyObject = @{
		@"tags": @[
			@{
				@"id": @"29",
				@"description": @"请问饿我去请问饿",
				@"meta_description": [NSNull null],
				@"created_at": @"2015-03-20T09:38:37.338Z",
				@"created_by": @1,
				@"image": [NSNull null],
				@"slug": @"ewqeqwewqw",
				@"updated_at": @"2015-03-20T09:38:37.338Z",
				@"hidden": @NO,
				@"updated_by": @1,
				@"meta_title": [NSNull null],
				@"name": @"1"
			}
		]
	};

	NSMutableURLRequest* request = [[AFJSONRequestSerializer serializer] requestWithMethod:@"PUT" URLString:@"http://js.uiapple.com/ghost/api/v0.1/tags/29/" parameters:bodyObject error:NULL];

	// Add Headers
	[request setValue:@"Bearer keHUAIupDU1bitHYPqYDHoFNngdx3ruCOQH1BI9PxITVxFwbfJZ3kYw4Gdr0l0BvGYUYYkYmSFSgN1E2bQdAhEGBcNjRAgDqrmf8ZBxhAipkHD5GfAYouT0SatHTcBDoBR2xdk2cJqro4mD11lPYeTCD4816ItRGPTNUktImmjMVnykBMEIcSbYXLUA6dw1wW34EDPSy2ETjTKDEVgazFJrQr33xaE3tq8xJ5CBTkil3mQyYWgtcmMFfFhQhUOp" forHTTPHeaderField:@"Authorization"];

	// Fetch Request
	AFHTTPRequestOperation *operation = [manager HTTPRequestOperationWithRequest:request
	  success:^(AFHTTPRequestOperation *operation, id responseObject) {
	    NSLog(@"HTTP Response Status Code: %ld", [operation.response statusCode]);
	    NSLog(@"HTTP Response Body: %@", responseObject);
	} failure:^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"HTTP Request failed: %@", error);
	}];

	[manager.operationQueue addOperation:operation];




}

- (void)showCreatTagsSuccess:(id)responseObject {
    ZHCreatTagsResponseBaseClass *creatTagsResponseBaseClass=[ZHCreatTagsResponseBaseClass modelObjectWithDictionary:responseObject];

    if (_creatTagsSuccess){
                  _creatTagsSuccess(creatTagsResponseBaseClass);
              }
}


- (void)showTagsSuccess:(id)responseObject {
    ZHGTagsResponseBaseClass *tagsResponseBaseClass=[ZHGTagsResponseBaseClass modelObjectWithDictionary:responseObject];

    if (_tagsSuccess){
                  _tagsSuccess(tagsResponseBaseClass);
              }
}


- (void)showUploadSuccess:(id)responseObject {
    NSString *url = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];

    url= [url stringByReplacingOccurrencesOfString:@"\"" withString:@""];

    if (_uploadSuccess) {
        _uploadSuccess(BaseUrl(url, _myHost));
    }
}


- (void)getUserInfo {
// 查询个人信息 (GET http://js.uiapple.com/ghost/api/v0.1/users/me/)

    // Create manager
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    // Create request
    NSDictionary *URLParams = @{
            @"status" : @"all",
            @"include" : @"roles",
    };

    NSString *urlString = BaseUrl(ZHUSER_URL, _ghostHost);

    NSMutableURLRequest *request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"GET" URLString:urlString parameters:URLParams error:NULL];

    // Add Headers
    [request setValue:_WDToken forHTTPHeaderField:@"Authorization"];

    __weak typeof(self) safeSelf = self;

    // Fetch Request
    AFHTTPRequestOperation *afhttpRequestOperation = [manager HTTPRequestOperationWithRequest:request
                                                                                      success:^(AFHTTPRequestOperation *operation, id responseObject) {

                                                                                          if (responseObject) {

                                                                                              ZHGUserInfoResponseBaseClass *userInfoResponseBaseClass = [ZHGUserInfoResponseBaseClass modelObjectWithDictionary:responseObject];


                                                                                              if (_userInfoSuccess) {
                                                                                                  _userInfoSuccess(userInfoResponseBaseClass);
                                                                                              }


                                                                                          } else {
                                                                                              [safeSelf showError:nil errorMessage:VAILED_JSON_MESSAGE errorCode:ZHGhostErrorCodeVailedJsonFormatter];
                                                                                          }


                                                                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                [self showRequestErrorMessage:safeSelf error:error];

            }];

    [manager.operationQueue addOperation:afhttpRequestOperation];
}


- (void)showRequestErrorMessage:(ZHGhostManger *)safeSelf error:(NSError *)error {
    NSData *data = error.userInfo[@"com.alamofire.serialization.response.error.data"];

    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];


    NSDictionary *dictionary1 = [string objectFromJSONString];

    ZHFailedBaseClass *failedBaseClass = [ZHFailedBaseClass modelObjectWithDictionary:dictionary1];


    NSString *errorMessage = nil;
    if (failedBaseClass.errors.count > 0) {
        ZHFailedErrors *errors = failedBaseClass.errors[0];
        errorMessage = errors.message;
    }


    [safeSelf showError:error errorMessage:errorMessage errorCode:0];
}

- (void)showError:(NSError *)error errorMessage:(NSString *)errorMessage errorCode:(NSInteger)erroorCode {
    if (_failed) {
        _failed(error, errorMessage, erroorCode);
    }
}

- (NSString *)stringWithDate:(NSDate *)date {

    NSParameterAssert(date);

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_US"]];

    [dateFormatter setDateFormat:@"yyyyMMDDHHmmss"];

    return [dateFormatter stringFromDate:date];


}

- (NSDate *)dateWithString:(NSString *)string {


    NSParameterAssert(string);

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];

    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"zh_US"]];

    [dateFormatter setDateFormat:@"yyyyMMDDHHmmss"];

    return [dateFormatter dateFromString:string];
}

- (BOOL)setTokenStart:(NSString *)userName {

    NSParameterAssert(userName);

    NSDictionary *dictionary = [[NSUserDefaults standardUserDefaults] objectForKey:userName];

    _WDToken = dictionary[WDTOKEN];

    _WDExpiresIn = dictionary[EXPIRESIN];

    if (_WDToken == nil) {
        return NO;
    } else if (_WDExpiresIn == nil) {
        return NO;
    }


    return _WDToken && [[NSDate date] compare:[self dateWithString:_WDExpiresIn]] == NSOrderedAscending;


}
@end