//
//  ZHDefine.h
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/21.
//  Copyright (c) 2014 物流商户端. All rights reserved.
//
//屏幕的宽度
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
//屏幕的高度
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
//默认背景的颜色
#define SCREEN_DEFINE_COLOR [UIColor colorWithRed:0.941 green:0.941 blue:0.949 alpha:1];
//登陆segmemeberControl背景的配色
#define LOGIN_SEG_BGCOLOR [UIColor colorWithRed:0.188f green:0.357f blue:0.722f alpha:1.00f]

#define LOGIN_SEG_TEXTCOLOR [UIColor whiteColor]

#define LOGIN_SEG_BOARDCOLOR [UIColor colorWithRed:0.188f green:0.357f blue:0.722f alpha:1.00f]

#define LOGIN_REMEMBER_COLOR [UIColor colorWithRed:0.271f green:0.427f blue:0.792f alpha:1.00f]//记着密码控件的配色

typedef void (^didSelectedAtIndexPathBlock)(NSIndexPath *indexPath);

typedef void (^DidSelectExpressionWithNameBlock)(NSString *name);

typedef void (^DidCannelViewBlock)(NSMutableArray *array);

#define MAX_HEIGHT_OR_WIDTH  1000000


#define DEFINE_TEXT_INPUT_COLOR [UIColor colorWithRed:0.345 green:0.345 blue:0.345 alpha:1]

//默认的蓝色
#define DEFINE_BLUE_COLOR [UIColor colorWithRed:0.0706 green:0.435 blue:0.867 alpha:1]

//#define REQUEST_HOST @"http://192.168.1.30:6033"

#define REQUEST_HOST @"http://58.251.48.25:6033"


#define BASE_HOST(TEXT)  [NSString stringWithFormat:@"%@%@",REQUEST_HOST,TEXT]
//注册
#define REQUEST_ZHU_CE @"/user/regist"

//发送验证码

#define REQUEST_SEND_VALIDATE_CODE @"/vcode/send"
//登陆
#define REQUET_LOGIN @"/user/login"
//登出
#define REQUEST_DENG_CHU @"/user/layout"

//修改新的头像

#define REQUEST_EDIT_HEAD_IMAGE @"/user/head_image"
//获取地址薄的数据
#define REQUEST_ADRESS_LIST @"/addr/list"

//新增地址薄
#define REQUEST_ADD_ADRESS @"/addr/add"

//删除地址薄
#define REQUEST_DEL_ADRESS @"/addr/del"

//修改地址薄

#define REQUSET_EDIT_ADRESS @"/addr/change"

//获取卡号

#define REQUEST_CARD_LIST @"/card/list"

//**查询联行号

#define REQUEST_CARD_INFO @"/bank/search"

//新增卡号

#define REQUEST_ADD_CARD @"/card/add"

//删除用户卡号
#define  REQUEST_DEL_CARD @"/card/del"

#define REQUEST_EXPRESSION_LIST @"/lgc/list"

//**运费查询
#define REQUEST_FREIGHT @"/lgc/freight"

/**查询快递信息
*
*
*/


#define REQUEST_EXPRESS_INFO @"/lgc/track"

//意见反馈
#define REQUEST_FEED_BACK @"/feedback/add"

//新增订单
#define REQUEST_ADD_ORDER @"/order/add"

#define REQUEST_CHANGE_CARD @"/card/change"//修改用户卡号


//修改密码
#define REQUSET_RESET_PASSWORD @"/user/cpwd"

//获取订单的列表
#define REQUEST_ORDER_LIST @"/order/list"

//修改用户的手机号
#define REQUEST_EDIT_PHONE @"/user/cphone"

//获取订单的详情
#define REQUSET_ORDER_INFO @"/order/info"

#define REQUEST_HOME_BANNER @"/banner/list"

//获取消息列表
#define REQUEST_MESSAGE_LIST @"/msg/list"

//取消订单
#define REQUEST_CANNEL_ORDER @"/order/cancel"

//更新订单
#define REQUEST_UPDATA_ORDER @"/order/update"

//更新消息
#define REQUEST_UPDATA_MESSAGE @"/msg/read"

#define APP_VERSION [NSString stringWithFormat:@"%@", [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString*)kCFBundleVersionKey]]

#define DEFAULT_REQ_NO [[NSDate date] timeIntervalSince1970]

#define DEFAULT_REQUEST_TIME [[NSDate date] descriptionWithLocale:[NSLocale localeWithLocaleIdentifier:NSCalendarIdentifierChinese]]


#define ZHLOG(string)     NSLog(@"%@🆘rror-当前错误类==%@,当前错误行==%@",string, [NSString stringWithUTF8String:__FUNCTION__], [NSNumber numberWithInt:__LINE__]);


//**订单订单的类型

//0：全部，1：未收件2：待派件3：已完成4：已取消 5：未发送

#define MYORDER_STATUES_ARRAY @[@"全部",@"待收件",@"待派件",@"已完成",@"已取消",@"未提交"]

#define MYORDER_STATUE_COLOR_ARRAY @[[UIColor colorWithRed:0.118 green:0.482 blue:0.855 alpha:1],[UIColor colorWithRed:0.925 green:0.514 blue:0.22 alpha:1],[UIColor colorWithRed:0.345 green:0.635 blue:0.776 alpha:1],[UIColor colorWithRed:0.322 green:0.718 blue:0.298 alpha:1],[UIColor colorWithRed:0.988 green:0.318 blue:0.329 alpha:1],[UIColor colorWithRed:0.447 green:0.447 blue:0.447 alpha:1]]

//设置支持的下载的文件的类型
#define DEFINE_DOWNLOAD_FILE_TYPES @[@"image/png",@"image/jpeg",@"image/jpg"]

///-----------------------------------------------------
///@name 方便调试
///------------------------------------------------------
#define ZHASSERT(string,isYes) if (!isYes){ZHLOG(ZHString(string));return;}
#define ZHASSERT_TYPE(string,isYes,type) if(!isYes){ZHLOG(ZHString(string));return type;}

#define ZHString(string)  [NSString stringWithFormat:@"🆘君赏LOG🆘:  %@",string]
#define ZHORDER_OFFLINE_IDS @"new_order_offline_ids"
//定义手机版本
typedef NS_ENUM(NSInteger , ZHIOSVersion){

    ZHIOSVersion_6_0,
    ZHIOSVersion_6_1,
    ZHIOSVersion_7_0,
    ZHIOSVersion_7_1,
    ZHIOSVersion_8_0,
    ZHIOSVersion_8_1


};

#define NAV_COLOR [UIColor colorWithRed:0.188 green:0.675 blue:0.78 alpha:1]
#define HOME_BG_COLOR [UIColor colorWithRed:0.953 green:0.965 blue:0.969 alpha:1]

