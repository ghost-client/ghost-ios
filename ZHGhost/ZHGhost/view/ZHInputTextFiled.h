//
// Created by hangzhang on 15/4/2.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ZHInputTextFiled : UIView

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles;

@property (nonatomic, strong, readonly)NSArray *textFileds;


@end