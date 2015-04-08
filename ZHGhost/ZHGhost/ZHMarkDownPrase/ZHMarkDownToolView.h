//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSUInteger , MarkDownToolType){
    MarkDownToolTypeH1=0,
    MarkDownToolTypeH2=1,
    MarkDownToolTypeH3=2,
    MarkDownToolTypeH4=3,
    MarkDownToolTypeH5=4,
    MarkDownToolTypeH6=5,
    MarkDownToolTypeStrong=6,
    MarkDownToolTypeEm=7,
    MarkDownToolTypeDel=8,
    MarkDownToolTypeA=9,
    MarkDownToolTypeImg=10,
    MarkDownToolTypeList=11,
    MarkDownToolTypeLigith=12,
    MarkDownToolTypeCode=13,
    MarkDownToolTypeComplete=14

};
typedef  void (^ZHMarkDownToolViewChooseComplete)(MarkDownToolType type);
@interface ZHMarkDownToolView : UIView

-(instancetype)initWithFrame:(CGRect)frame;

-(void)setMarkDownTypeComplete:(ZHMarkDownToolViewChooseComplete)markDownComplete;

@end