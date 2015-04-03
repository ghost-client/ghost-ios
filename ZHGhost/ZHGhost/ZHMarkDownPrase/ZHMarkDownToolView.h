//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger , MarkDownToolType){
    MarkDownToolTypeH=0,
    MarkDownToolTypeStrong=1,
    MarkDownToolTypeEm=2,
    MarkDownToolTypeDel=3,
    MarkDownToolTypeCode=4,
    MarkDownToolTypeA=5,
    MarkDownToolTypeImg=6,
    MarkDownToolTypeList=7

};
typedef  void (^ZHMarkDownToolViewChooseComplete)(MarkDownToolType type);
@interface ZHMarkDownToolView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

-(void)setMarkDownTypeComplete:(ZHMarkDownToolViewChooseComplete)markDownComplete;

@end