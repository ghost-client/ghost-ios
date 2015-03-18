//
//  ZHFounction.h
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/21.
//  Copyright (c) 2014 物流商户端. All rights reserved.
//


#import <UIKit/UIKit.h>

@class AFHTTPRequestOperationManager;
/**获取大小的倍数*/
FOUNDATION_EXPORT CGFloat NumberSize(void);

#pragma mark -view试图
/**
* 获取试图的X的坐标
*/
FOUNDATION_EXPORT float ZHFrameX(UIView *view);

/**
* 获取试图的Y的坐标
*/
FOUNDATION_EXPORT float ZHFrameY(UIView *view);
/**
* 获取试图的宽度width
*/
FOUNDATION_EXPORT float ZHFrameWidth(UIView *view);
/**
* 获取试图的高度Height
*/
FOUNDATION_EXPORT float ZHFrameHeight(UIView * view);
/**
* 获取相对于上一个试图的X坐标
*/
FOUNDATION_EXPORT float ZHFrameNextX(UIView *view);
/**
* 获取相对于上一个试图的Y坐标
*/
FOUNDATION_EXPORT float ZHFrameNextY(UIView *view);

/**
* 根据手机屏幕的不同加载不同的图片
*/
FOUNDATION_EXPORT NSString *ZHLoadImageName(NSString *name);


FOUNDATION_EXPORT float ZHSystemVersion(void);


/**
* 适配7以下的导航条
*/
FOUNDATION_EXPORT float ZHIOS7(void);


FOUNDATION_EXPORT void   ZHAddLineView(CGRect rect,UIColor *bgColor,UIView *superView);

FOUNDATION_EXPORT void MoveViewToTop(UIView * view,float moveLenght);

FOUNDATION_EXPORT void MoveViewToFoot(UIView * view,float moveLenght);

/**
* 计算字符串的宽度和高度
* string 字符串
* font 字体大小
* defaultWidth 字符串最大的宽的和高度
* isGetWidth 是不是获取宽度
*/

FOUNDATION_EXPORT CGSize LabelSizeWithFont(NSString *string,UIFont *font,float defaultWidth,BOOL isGetWidth);

/**
* 根据屏幕返回对应的视图的尺寸
*  包含所有屏幕的尺寸
*/
FOUNDATION_EXPORT float  ScreenSizeWithSizes(float screen4,float screen5,float screen6,float scrren6plu);


FOUNDATION_EXPORT BOOL isResponseSuccess(NSDictionary *dictionary);


FOUNDATION_EXPORT void SetAFHttpManger(AFHTTPRequestOperationManager *manager ,BOOL isSetSessionNo);

FOUNDATION_EXPORT NSString *StringFromArrayItem(NSArray *array);
///-----------------------------------------------------
///@name 从服务器返回的原图片地址获取小图片的地址
///------------------------------------------------------
/**
* @param bigString 大图片的地址
*/
FOUNDATION_EXPORT NSString *smallImageFromBigString(NSString *bigString);


