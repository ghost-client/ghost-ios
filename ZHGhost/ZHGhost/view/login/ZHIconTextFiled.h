//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZHIconTextFiled : UIView{


}

@property (nonatomic, strong, readonly)UIImageView *iconImageView;

@property (nonatomic, strong, readonly)UITextField *textFiled;

//初始化
-(instancetype)initWithFrame:(CGRect)frame;

@end