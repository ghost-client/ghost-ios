//
//  ZHBaseViewController.m
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/21.
//  Copyright (c) 2014年 物流商户端. All rights reserved.
//

#import "ZHBaseViewController.h"
#import "ZHNavgationView.h"
#import "MBProgressHUD.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ShowMessageView.h"


@implementation ZHBaseViewController {


    float keyboardHeight;

}


- (void)viewDidLoad {

    [super viewDidLoad];

    //设置默认的颜色

    self.view.backgroundColor = [UIColor colorWithRed:0.969f green:0.969f blue:0.969f alpha:1.00f];
    
    /**控制简单的变化*/
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UIKeyboardWillChangeFrame:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(UIKeyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];


    if (!self.isHaveNotTap){
         UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissCurreentKeyBoard)];

        tapGestureRecognizer.delegate=self;

        [self.view addGestureRecognizer:tapGestureRecognizer];

    }

    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    return YES;
}

- (void)dismissCurreentKeyBoard {


    [self dismissKeyBoardInView:self.view];

    [self dismissYogapayKeyBoard];


}

- (void)dismissKeyBoardInView:(UIView *)view {

    NSArray *array = view.subviews;

    for (UIView *view1 in array) {

        if ([view1 isKindOfClass:[UITextField class]]) {

            UITextField *textField = (UITextField *) view1;
            [textField resignFirstResponder];
        } else if ([view1 isKindOfClass:[UITextView class]]) {

            UITextView *textView = (UITextView *) view1;
            [textView resignFirstResponder];

        } else {

            [self dismissKeyBoardInView:view1];
        }

    }

}

- (void)show:(int)lenght {


    if (lenght == keyboardHeight &&self.textFieldYArray.count==0) {

        return;


    }


    if (ZHFrameY(self.view) < 0) {

        float spanceLenght = lenght - keyboardHeight;
        keyboardHeight = lenght;
        moveLenght = moveLenght + lenght;

        if (spanceLenght > 0) {


            MoveViewToTop(self.view, spanceLenght);
        } else {


            MoveViewToFoot(self.view, -spanceLenght);

        }


    } else {
        keyboardHeight = lenght;

        if (lenght + [self.textFieldYArray[(NSUInteger) currentFiledTag] floatValue] + 10 - SCREEN_HEIGHT > 0) {


            moveLenght = (int) (lenght + [self.textFieldYArray[(NSUInteger) currentFiledTag] floatValue] + 10 - SCREEN_HEIGHT);

            if (moveLenght > 0) {


                MoveViewToTop(self.view, moveLenght);
            } else {


                MoveViewToFoot(self.view, -moveLenght);

            }

        }


    }
}


- (void)UIKeyBoardWillChange:(NSNotification *)notification {

    
    NSDictionary *dictionary = notification.userInfo;

    
    CGRect bounds = [dictionary[@"UIKeyboardBoundsUserInfoKey"] CGRectValue];


    if (keyboardHeight != bounds.size.height) {

        if (self.UIKeyBordWillChange) {


            BOOL isFirst = keyboardHeight == 0 ? (YES) : (NO);

            self.UIKeyBordWillChange(keyboardHeight - bounds.size.height + 20, isFirst);


        }

        keyboardHeight = bounds.size.height;


    }


}

- (void)UIKeyboardWillChangeFrame:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    CGRect rect = [userInfo[@"UIKeyboardBoundsUserInfoKey"] CGRectValue];

    int keyBoardHeight1 = (int) rect.size.height;

    if (keyBoardHeight1 != 0) {


       [self show:keyBoardHeight1];

        if (self.KeyBoardShow){
            self.KeyBoardShow(keyBoardHeight1);
        }

    }


}

#pragma mark - UITextFiledDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {

    currentFiledTag = textField.tag;


}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {


    [textField resignFirstResponder];

    self.view.frame = CGRectMake(0, 0, ZHFrameWidth(self.view), ZHFrameHeight(self.view));

    return YES;


}


- (void)UIKeyBoardWillHide:(NSNotification *)notification; {
    if (ZHFrameY(self.view) < 0) {
        moveLenght = 0;
        MoveViewToFoot(self.view, 0 - ZHFrameY(self.view));

    }
    keyboardHeight = 0;

    if (self.KeyBoardHide){
        self.KeyBoardHide();
    }

}

- (MBProgressHUD *)mbProgressHUD {
    if (_mbProgressHUD == nil) {
        _mbProgressHUD = [[MBProgressHUD alloc] initWithView:self.view];
//        _mbProgressHUD.mode=MBProgressHUDModeDeterminate;

        [self.view addSubview:_mbProgressHUD];


    }
    return _mbProgressHUD;
}


- (void)HUDShow:(NSString *)text {
    self.mbProgressHUD.labelText = text;
    [self.mbProgressHUD show:YES];

}

- (void)HUDHide:(NSString *)text afterDealy:(NSTimeInterval)afterDealy {
    self.mbProgressHUD.labelText = text;
    [self.mbProgressHUD hide:YES afterDelay:afterDealy];

}

- (ShowMessageView *)showMessageView {

    if (_showMessageView == nil) {

        _showMessageView = [ShowMessageView share];

    }

    return _showMessageView;
}

- (void)showMessage:(NSString *)message {

    self.showMessageView.titleLabelText = message;

    [self.showMessageView showInView:self.view];

}

- (void)dismissYogapayKeyBoard {

   // [[ZHYogapaySafeKeyBoardView share] hide];

}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    //去掉导航试图的导航条

    self.navigationController.navigationBarHidden = YES;
}

- (ZHNavgationView *)navgationView {

    if (_navgationView == nil) {

        _navgationView = [[ZHNavgationView alloc] init];


    }

    return _navgationView;
}

- (void)setIsShowNavgationView:(BOOL)isShowNavgationView {

    _isShowNavgationView = isShowNavgationView;

    if (_isShowNavgationView) {

        [self.view addSubview:self.navgationView];
        
        [self.navgationView.leftButton addTarget:self action:@selector(backButtonClick) forControlEvents:UIControlEventTouchUpInside];

    } else {

        [self.navgationView removeFromSuperview];
    }
}

- (void)backButtonClick {

    
    [self.navigationController popViewControllerAnimated:YES];

}

- (void)setIsShowBackButton:(BOOL)isShowBackButton {

    _isShowBackButton = isShowBackButton;
    
    self.navgationView.leftButton.hidden = !isShowBackButton;
}




@end
