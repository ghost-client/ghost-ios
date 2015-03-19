//
// Created by hangzhang on 15/3/19.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHLoginViewController.h"
#import "StyleKitName.h"
#import "ZHFounction.h"
#import "ZHDefine.h"

@interface ZHLoginViewController()


@end


@implementation ZHLoginViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isShowNavgationView= YES;
    self.view.backgroundColor=[UIColor colorWithRed:0.251 green:0.251 blue:0.251 alpha:1];

    self.navgationView.titleLabel.text=@"登陆";



    [self.navgationView.rightButton setBackgroundImage:[StyleKitName homeIcon] forState:UIControlStateNormal];


    [self.navgationView.rightButton addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];



}

- (void)dismiss {

    [self dismissViewControllerAnimated:YES completion:^{

    }];

}
@end

@interface ZHLoginConfigHostView()

@property (nonatomic, strong)UILabel *hostLabel;

@property (nonatomic, strong)UITextField *hostFiled;

@property (nonatomic, strong)UILabel *emailLabel;

@property (nonatomic, strong)UITextField *emailFiled;


@end
@implementation ZHLoginConfigHostView
- (instancetype)initWithFrame:(CGRect)frame {


    NSParameterAssert(frame.size.height>120);

    self=[super initWithFrame:frame];

    if (self){

        self.backgroundColor=[UIColor clearColor];

        [self addSubview:self.hostLabel];

        [self addSubview:self.hostFiled];

        [self addSubview:self.emailLabel];

        [self addSubview:self.emailFiled];

        self.hostLabel.text=@"请配备博客的URL:";
        self.hostFiled.placeholder=@"例如:http://www.boke.com";
        self.emailLabel.text=@"请输入登陆的邮箱地址";
        self.emailFiled.placeholder=@"例如:same@xx.com";

    }

    return self;
}

- (UITextField *)emailFiled {

    if(_emailFiled== nil){
        _emailFiled= [[UITextField alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.emailLabel), ZHFrameY(self.emailLabel), SCREEN_WIDTH- ZHFrameNextX(self.emailLabel)-20, ZHFrameHeight(self.emailLabel))];

        _emailFiled.textAlignment=NSTextAlignmentLeft;

        _emailFiled.textColor=[UIColor whiteColor];

         _emailFiled.layer.borderColor=[UIColor whiteColor].CGColor;

        _emailFiled.layer.borderWidth=1;

    }



    return _emailFiled;
}

- (UILabel *)emailLabel {

    if (_emailLabel== nil){
        _emailLabel= [[UILabel alloc] initWithFrame:CGRectMake(20, ZHFrameHeight(self)-20-40, 100, 40)];
        _emailLabel.textAlignment=NSTextAlignmentRight;
        _emailLabel.textColor=[UIColor whiteColor];
    }

    return _emailLabel;
}

- (UITextField *)hostFiled {

    if(_hostFiled== nil){
        _hostFiled= [[UITextField alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.emailLabel), ZHFrameY(self.emailLabel), SCREEN_WIDTH- ZHFrameNextX(self.emailLabel)-20, ZHFrameHeight(self.emailLabel))];

        _hostFiled.textAlignment=NSTextAlignmentLeft;

        _hostFiled.textColor=[UIColor whiteColor];

        _hostFiled.layer.borderColor=[UIColor whiteColor].CGColor;

        _hostFiled.layer.borderWidth=1;

    }
    return _hostFiled;
}

- (UILabel *)hostLabel {

    if (_hostLabel== nil){
        _hostLabel= [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameX(self.emailLabel), ZHFrameHeight(self)-20-40-20-40, 100, 40)];
        _hostLabel.textAlignment=NSTextAlignmentRight;
        _hostLabel.textColor=[UIColor whiteColor];
    }



    return _hostLabel;
}


@end


@implementation ZHLoginUserInfoView

- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];

    if (self){


    }

    return self;
}

@end

@implementation ZHLoginPasswordView

- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];

    if (self){


    }

    return self;
}

@end