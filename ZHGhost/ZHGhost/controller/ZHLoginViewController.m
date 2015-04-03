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
#import "ZHBaseHomeViewController.h"
#import "ZHSegmentController.h"
#import "ZHInputTextFiled.h"

@interface ZHLoginViewController()


@end


@implementation ZHLoginViewController {

    ZHTokenSuccess _loginSuccess;
    UIImageView *_headImageView;
    ZHSegmentController *_segmentController;
    ZHInputTextFiled *_loginTextFiled;
    UIButton *_loginButton;
    ZHInputTextFiled *_configTextFiled;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.backgroundColor= NAV_COLOR;

    self.view.backgroundColor= HOME_BG_COLOR;

    self.navgationView.titleLabel.text=@"登陆";


    if ([ZHGhostManger manger].currentLoginUserName && [[ZHGhostManger manger] isLogin:[ZHGhostManger manger].currentLoginUserName]){


        [self.navgationView.leftButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];

    } else{
        [self.navgationView.leftButton setTitle:@"" forState:UIControlStateNormal];
    }



    [self.view addSubview:self.headImageView];

    [self.view addSubview:self.segmentController];

    [self.view addSubview:self.loginTextFiled];

    [self.view addSubview:self.loginButton];

    __weak typeof(self) safeSelf = self;

    [self.segmentController setSegmentControllerComplete:^(NSUInteger selectIndex) {

        [safeSelf changeFrame:selectIndex];

    }];

    [self.loginButton addTarget:self action:@selector(gotoLogin) forControlEvents:UIControlEventTouchUpInside];


}

- (void)changeFrame:(NSUInteger)selectIndex {
    if (selectIndex==0){

            [self.configTextFiled removeFromSuperview];

        [self.view addSubview:self.loginTextFiled];

            self.loginButton.frame= CGRectMake(ZHFrameX(self.loginButton), ZHFrameNextY(self.loginTextFiled)+20, ZHFrameWidth(self.loginButton), ZHFrameHeight(self.loginButton));

        } else{

            [self.loginTextFiled removeFromSuperview];

        [self.view addSubview:self.configTextFiled];

            self.loginButton.frame= CGRectMake(ZHFrameX(self.loginButton), ZHFrameNextY(self.configTextFiled)+20, ZHFrameWidth(self.loginButton), ZHFrameHeight(self.loginButton));


        }
}

- (void)gotoLogin {



    [[ZHGhostManger manger] congfigHost:@"http://js.uiapple.com"];




    __weak typeof(self) safeSelf = self;

    [self HUDShow:@"正在登陆"];

    [[ZHGhostManger manger] loginWithUserName:@"15038777234@163.com" passWord:@"zhanghang1990823" success:^{

        [safeSelf HUDHide:@"登陆成功" afterDealy:.3];

        [self showLoginSuccess];

    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {


        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];

    }];


}

- (void)showLoginSuccess {
    if (_loginSuccess){
        _loginSuccess(nil);
    }

    [self dismiss];
}

- (void)dismiss {

    if (self.navigationController){

        ZHBaseHomeViewController *controller= [[ZHBaseHomeViewController alloc] init];

        [controller contentItems];

        [controller setHomeNavgationController:self.navigationController];

        [self.navigationController pushViewController:controller animated:YES];

        return;
    }

    [self dismissViewControllerAnimated:YES completion:^{

    }];

}


- (ZHSegmentController *)segmentController {
    if (_segmentController== nil){
        _segmentController= [[ZHSegmentController alloc] initWithFrame:CGRectMake((SCREEN_WIDTH- ZHUINT(250* NumberSize()))/2, ZHFrameNextY(self.headImageView)+20, ZHUINT(250* NumberSize()), 40) itemTitles:@[@"登陆",@"配置"]];
    }
    return _segmentController;
}

- (ZHInputTextFiled *)loginTextFiled {

    if (_loginTextFiled == nil){
        _loginTextFiled = [[ZHInputTextFiled alloc] initWithFrame:CGRectMake(ZHFrameX(self.segmentController), ZHFrameNextY(self.segmentController)+30, ZHFrameWidth(self.segmentController), 80.5) titles:@[@"用户名:",@"密码:"]];
    }

    return _loginTextFiled;
}

- (UIImageView *)headImageView {
    if (_headImageView== nil){
        _headImageView= [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH- ZHUINT(130* NumberSize()))/2, ZHFrameNextY(self.navgationView)+30, ZHUINT(130* NumberSize()), ZHUINT(130* NumberSize()))];

        _headImageView.backgroundColor= NAV_COLOR;
        _headImageView.layer.masksToBounds= YES;
        _headImageView.layer.cornerRadius= ZHFrameHeight(_headImageView)/2;
        _headImageView.layer.borderColor=[UIColor whiteColor].CGColor;
        _headImageView.layer.borderWidth=10;
    }
    return _headImageView;
}

- (UIButton *)loginButton {
    if (_loginButton== nil){

        _loginButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame= CGRectMake(ZHFrameX(self.loginTextFiled), ZHFrameNextY(self.loginTextFiled)+20, ZHFrameWidth(self.loginTextFiled), 40);


        _loginButton.layer.borderWidth=0.5;
        _loginButton.layer.borderColor= NAV_COLOR.CGColor;
        _loginButton.layer.masksToBounds= YES;
        _loginButton.layer.cornerRadius=20;
        [_loginButton setTitleColor:NAV_COLOR forState:UIControlStateNormal];

        [_loginButton setTitle:@"登陆" forState:UIControlStateNormal];
    }
    return _loginButton;
}

- (ZHInputTextFiled *)configTextFiled {
    if (_configTextFiled == nil){
        _configTextFiled = [[ZHInputTextFiled alloc] initWithFrame:CGRectMake(ZHFrameX(self.segmentController), ZHFrameNextY(self.segmentController)+30, ZHFrameWidth(self.segmentController), 121) titles:@[@"网址:",@"用户名:",@"密码"]];
    }

    return _configTextFiled;
}

- (void)loginSuccess:(ZHTokenSuccess)success {

    _loginSuccess=success;

}


@end

