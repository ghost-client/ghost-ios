//
// Created by hangzhang on 15/3/19.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "StyleKitName.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHIconTextFiled.h"
#import "ZHGhostManger.h"

@interface ZHLoginViewController()

@property (nonatomic, strong)ZHLoginConfigHostView *configHostView;

@property (nonatomic, strong)ZHLoginUserInfoView *userInfoView;

@property (nonatomic, strong)ZHLoginPasswordView *passwordView;

@end


@implementation ZHLoginViewController {

    ZHTokenSuccess _loginSuccess;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isShowNavgationView= YES;
    self.view.backgroundColor=[UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1];

    self.navgationView.titleLabel.text=@"登陆";



    [self.navgationView.rightButton setBackgroundImage:[StyleKitName homeIcon] forState:UIControlStateNormal];


    [self.navgationView.rightButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:self.configHostView];


    //[self.view addSubview:self.userInfoView];

    [self.view addSubview:self.passwordView];

    self.configHostView.hostFiled.textFiled.text=@"http://js.uiapple.com";

    self.configHostView.emailFiled.textFiled.text=@"15038777234@163.com";

    self.passwordView.passWordTextFiled.textFiled.text=@"zhanghang1990823";


    [self.passwordView.loginButton addTarget:self action:@selector(gotoLogin) forControlEvents:UIControlEventTouchUpInside];


}

- (void)gotoLogin {

    [[ZHGhostManger manger] congfigHost:self.configHostView.hostFiled.textFiled.text];


    __weak typeof(self) safeSelf = self;


    [[ZHGhostManger manger] loginWithUserName:self.configHostView.emailFiled.textFiled.text passWord:self.passwordView.passWordTextFiled.textFiled.text success:^{

        [self showLoginSuccess];

    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {


        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf showMessage:errorMessage];

    }];


}

- (void)showLoginSuccess {
    if (_loginSuccess){
            _loginSuccess(nil);
    }

    [self dismiss];
}

- (void)dismiss {

    [self dismissViewControllerAnimated:YES completion:^{

    }];

}

- (ZHLoginConfigHostView *)configHostView {

    if (_configHostView== nil){
        _configHostView= [[ZHLoginConfigHostView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, [ZHLoginUserInfoView frameHeight])];
    }

    return _configHostView;
}

- (ZHLoginUserInfoView *)userInfoView {

    if (_userInfoView== nil){
        _userInfoView= [[ZHLoginUserInfoView alloc] initWithFrame:self.configHostView.frame];
        _userInfoView.backgroundColor=self.view.backgroundColor;
    }

    return _userInfoView;
}

- (ZHLoginPasswordView *)passwordView {

    if (_passwordView== nil){
        _passwordView= [[ZHLoginPasswordView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.userInfoView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.userInfoView))];

        _passwordView.backgroundColor=self.view.backgroundColor;
    }

    return _passwordView;
}

- (void)loginSuccess:(ZHTokenSuccess)success {

    _loginSuccess=success;

}


@end

@implementation ZHLoginConfigHostView{


   CGFloat   _textFiledWidth;
    
    ZHIconTextFiled *_hostFiled;
    ZHIconTextFiled *_emailFiled;
}
- (instancetype)initWithFrame:(CGRect)frame {


    NSParameterAssert(frame.size.height>120);

    self=[super initWithFrame:frame];

    if (self){


        _textFiledWidth=250* NumberSize();

        self.backgroundColor=[UIColor clearColor];


        [self addSubview:self.hostFiled];


        [self addSubview:self.emailFiled];

    }

    return self;
}

- (ZHIconTextFiled *)emailFiled {

    if(_emailFiled== nil){
        _emailFiled= [[ZHIconTextFiled alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-_textFiledWidth)/2, ZHFrameHeight(self)-60, _textFiledWidth,40)];

        _emailFiled.iconImageView.image=[StyleKitName homeIcon];

        _emailFiled.textFiled.placeholder=@"请输入用户名";


    }



    return _emailFiled;
}



- (ZHIconTextFiled *)hostFiled {

     if(_hostFiled== nil){


        _hostFiled= [[ZHIconTextFiled alloc] initWithFrame:CGRectMake(ZHFrameX(self.emailFiled), ZHFrameY(self.emailFiled)-60, _textFiledWidth,40)];
         _hostFiled.iconImageView.image=[StyleKitName homeIcon];

        _hostFiled.textFiled.placeholder=@"请输入博客网址";


    }
    return _hostFiled;
}




@end


@implementation ZHLoginUserInfoView{


    UIImageView *_headImageView;
    UILabel *_emailLabel;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];

    if (self){

        [self addSubview:self.headImageView];

        [self addSubview:self.emailLabel];


    }

    return self;
}

- (UIImageView *)headImageView {

    if (_headImageView== nil){

        _headImageView= [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100* NumberSize())/2, 40, 100* NumberSize(), 100* NumberSize())];

    }

    
    
    return _headImageView;
    
}

- (UILabel *)emailLabel {

    if (_emailLabel== nil){

        _emailLabel= [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-250* NumberSize())/2, ZHFrameNextY(self.headImageView)+10, 250* NumberSize(), 30)];

        _emailLabel.textAlignment=NSTextAlignmentCenter;
    }
    
    return _emailLabel;
}


+ (CGFloat)frameHeight {
    return 20+100* NumberSize()+10+30+20+20;
}


@end

@implementation ZHLoginPasswordView {
    UIButton *_replaceButton;
    UIButton *_loginButton;
    ZHIconTextFiled *_passWordTextFiled;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];

    if (self){


        [self addSubview:self.passWordTextFiled];

        [self addSubview:self.loginButton];

        [self addSubview:self.replaceButton];

        [self.loginButton setTitle:@"登陆" forState:UIControlStateNormal];

        [self.replaceButton setTitle:@"更换账号" forState:UIControlStateNormal];

        self.passWordTextFiled.textFiled.placeholder=@"请输入密码";



    }

    return self;
}
- (UIButton *)replaceButton {

    if (_replaceButton== nil){

        _replaceButton=[UIButton buttonWithType:UIButtonTypeCustom];

        _replaceButton.frame= CGRectMake((SCREEN_WIDTH-250* NumberSize())/2, ZHFrameNextY(self.loginButton)+20,250* NumberSize(), 40);

        _replaceButton.backgroundColor=[UIColor colorWithRed:0.941 green:0.941 blue:0.949 alpha:1];

        _replaceButton.layer.masksToBounds= YES;

        _replaceButton.layer.cornerRadius= ZHFrameHeight(_replaceButton)/2;

        [_replaceButton setTitleColor:[UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1] forState:UIControlStateNormal];

    }

    return _replaceButton;
}


- (UIButton *)loginButton {
    
    if (_loginButton== nil){

        _loginButton=[UIButton buttonWithType:UIButtonTypeCustom];

        _loginButton.frame= CGRectMake((SCREEN_WIDTH-250* NumberSize())/2, ZHFrameNextY(self.passWordTextFiled)+20,250* NumberSize(), 40);

        _loginButton.backgroundColor=[UIColor colorWithRed:0.941 green:0.941 blue:0.949 alpha:1];

        _loginButton.layer.masksToBounds= YES;

        _loginButton.layer.cornerRadius= ZHFrameHeight(_loginButton)/2;

        [_loginButton setTitleColor:[UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1] forState:UIControlStateNormal];

    }

    return _loginButton;
    
    
}

- (ZHIconTextFiled *)passWordTextFiled {

    if (_passWordTextFiled== nil){

        _passWordTextFiled= [[ZHIconTextFiled alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-250* NumberSize())/2, 0, 250* NumberSize(), 40)];


        _passWordTextFiled.iconImageView.image=[StyleKitName homeIcon];
    }

    
    return _passWordTextFiled;
}


@end