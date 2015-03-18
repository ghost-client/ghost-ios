//
//  ZHBaseViewController.h
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/21.
//  Copyright (c) 2014年 物流商户端. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ZHNavgationView.h"
#import "MBProgressHUD.h"

@class ShowMessageView;

/**
* 最基本的试图
*/
@interface ZHBaseViewController : UIViewController <UITextFieldDelegate, UIGestureRecognizerDelegate> {
    float moveLenght;
    float currentFiledTag;
}


@property(nonatomic, copy) void (^UIKeyBordWillChange)(float changeValue, BOOL isFirst);

@property(nonatomic, strong) ZHNavgationView *navgationView;

@property(nonatomic, assign) BOOL isShowNavgationView;

@property (nonatomic, assign)BOOL isShowBackButton;//是否显示返回的按钮


@property (nonatomic, assign)BOOL isHaveNotTap;


//**键盘的方法*/
@property(nonatomic, copy) void (^KeyBoardShow)(int lenght);
@property(nonatomic, copy) void (^KeyBoardHide)(void);

@property(nonatomic, strong) MBProgressHUD *mbProgressHUD;

- (void)dismissCurreentKeyBoard;

- (void)UIKeyBoardWillHide:(NSNotification *)notification;


- (void)HUDShow:(NSString *)text;

- (void)HUDHide:(NSString *)text afterDealy:(NSTimeInterval)afterDealy;

@property(nonatomic, strong) NSMutableArray *textFieldYArray;

@property(nonatomic, strong) ShowMessageView *showMessageView;

- (void)showMessage:(NSString *)message;

- (void)dismissYogapayKeyBoard;

@end
