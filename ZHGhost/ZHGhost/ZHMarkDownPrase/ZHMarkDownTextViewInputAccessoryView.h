//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface ZHMarkDownTextViewInputAccessoryView:UIView

typedef NS_ENUM(NSUInteger , ZHMarkDownTextViewInputAccessoryViewButtonType){

    ZHMarkDownTextViewInputAccessoryViewButtonTypeMarkDown = 0,
    ZHMarkDownTextViewInputAccessoryViewButtonTypeFormat = 2,
    ZHMarkDownTextViewInputAccessoryViewButtonTypeExpert = 1,
    ZHMarkDownTextViewInputAccessoryViewButtonTypeDismiss = 3


};

typedef  void (^ZHMarkDownTextViewInputAccessoryViewButtonComplete)(ZHMarkDownTextViewInputAccessoryViewButtonType type);

-(instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)array;


-(void)setMarkDownTextViewAccessoryButtonComplete:(ZHMarkDownTextViewInputAccessoryViewButtonComplete)complete;



@end