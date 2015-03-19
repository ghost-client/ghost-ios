//
// Created by hangzhang on 15/3/19.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHBaseViewController.h"


@interface ZHLoginViewController : ZHBaseViewController



@end


///-----------------------------------------------------
///@name 封装登陆界面的控件
///------------------------------------------------------
/**
* 配置的界面
*/
@interface ZHLoginConfigHostView:UIView


-(instancetype)initWithFrame:(CGRect)frame;


@end

/**
* 显示用户信息界面
*/
@interface ZHLoginUserInfoView:UIView

- (instancetype)initWithFrame:(CGRect)frame;
@end

/**
* 输入密码的界面
*/
@interface ZHLoginPasswordView:UIView

- (instancetype)initWithFrame:(CGRect)frame;


@end
