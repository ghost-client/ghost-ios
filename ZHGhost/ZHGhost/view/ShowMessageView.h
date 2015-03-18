//
//  ShowMessageView.h
//  LogisticBsusines
//
//  Created by hangzhang on 15/1/19.
//  Copyright (c) 2015 物流商户端. All rights reserved.
//


#import <UIKit/UIKit.h>
/**展示提示的信息*/
@interface ShowMessageView : UIView {
    UIView *noteView;
}

+(instancetype)share;

@property (nonatomic, copy)NSString *titleLabelText;

-(void)showInView:(UIView *)view;

-(void)hide;


@end
