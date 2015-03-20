//
// Created by hangzhang on 15/3/19.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHBaseViewController.h"
#import "ZHBlockConfig.h"

@class ZHIconTextFiled;


@interface ZHLoginViewController : ZHBaseViewController


-(void)loginSuccess:(ZHTokenSuccess)success;


@end


///-----------------------------------------------------
///@name 封装登陆界面的控件
///------------------------------------------------------
/**
* 配置的界面
*/
@interface ZHLoginConfigHostView:UIView


@property (nonatomic, strong, readonly)ZHIconTextFiled *hostFiled;

@property (nonatomic, strong, readonly)ZHIconTextFiled *emailFiled;

-(instancetype)initWithFrame:(CGRect)frame;


@end

/**
* 显示用户信息界面
*/
@interface ZHLoginUserInfoView:UIView

- (instancetype)initWithFrame:(CGRect)frame;


@property (nonatomic, strong, readonly)UIImageView *headImageView;

@property (nonatomic, strong, readonly)UILabel *emailLabel;


+(CGFloat)frameHeight;

@end

/**
* 输入密码的界面
*/
@interface ZHLoginPasswordView:UIView

- (instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, strong, readonly)UIButton *replaceButton;

@property (nonatomic, strong, readonly)UIButton *loginButton;

@property (nonatomic, strong, readonly)ZHIconTextFiled *passWordTextFiled;



@end
