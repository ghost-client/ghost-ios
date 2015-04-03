//
//  SelectTypeView.h
//  LogisticBsusines
//
//  Created by hangzhang on 15/1/6.
//  Copyright (c) 2015 物流商户端. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataModels.h"

#define DATA_MODEL_TITLE_KEY @"title"

#define DATA_MODEL_ARRAY_KEY @"array"

#define DATA_MODEL_SECTIONS_KEY @"sections"

@class ZHSelectPickerViewDataModelBaseClass;

/**
* 选择类型
*/

@interface SelectTypeView : UIView {
    NSDictionary * adressDictionary;
}

+(instancetype)share;


- (void)show:(UIView *)view;

-(void)hide;

- (void)setSelectTimeType:(BOOL)timeType;

@property (nonatomic, strong)NSDictionary *dataDictionary;

- (void)setCurrentDayNumber:(int)i;

@property (nonatomic, assign)BOOL isSelectAdress;


@property (nonatomic, copy)void (^didSelectRowWithComponmentBlock)(NSString *selectString);




@end
