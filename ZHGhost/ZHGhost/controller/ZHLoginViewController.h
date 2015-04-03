//
// Created by hangzhang on 15/3/19.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHBaseViewController.h"
#import "ZHBlockConfig.h"

@class ZHIconTextFiled;
@class ZHSegmentController;
@class ZHInputTextFiled;


@interface ZHLoginViewController : ZHBaseViewController


@property (nonatomic, strong, readonly)UIImageView *headImageView;

@property (nonatomic, strong, readonly)ZHSegmentController *segmentController;

@property (nonatomic, strong, readonly)ZHInputTextFiled *loginTextFiled;

@property (nonatomic, strong, readonly)UIButton *loginButton;

@property (nonatomic, strong, readonly)ZHInputTextFiled *configTextFiled;


-(void)loginSuccess:(ZHTokenSuccess)success;


@end


