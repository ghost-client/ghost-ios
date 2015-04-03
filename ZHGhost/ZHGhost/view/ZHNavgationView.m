//
//  ZHNavgationView.m
//  LogisticBsusines
//
//  Created by hangzhang on 14/12/26.
//  Copyright (c) 2014 物流商户端. All rights reserved.
//

#import "ZHNavgationView.h"
#import "ZHDefine.h"
#import "ZHFounction.h"
@implementation ZHNavgationView


-(instancetype)init{

    self=[super init];
    if(self){
     
        self.frame=CGRectMake(0, 0, SCREEN_WIDTH, 44+ZHIOS7());
        
        self.backgroundColor=SCREEN_DEFINE_COLOR;


        [self addSubview:self.leftButton];

        [self addSubview:self.titleLabel];

        [self addSubview:self.rightButton];

    }
    return self;

}
- (UIButton *)leftButton {
    if (_leftButton== nil){
        _leftButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame= CGRectMake(10, ZHIOS7(), 44, 44);

        [_leftButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];



        
    }
    
    return _leftButton;
}

- (UILabel *)titleLabel {
    
    if (_titleLabel== nil){
        
        _titleLabel= [[UILabel alloc] init];
        _titleLabel.backgroundColor=[UIColor clearColor];

        
        _titleLabel.textAlignment=NSTextAlignmentCenter;
        
        _titleLabel.frame=CGRectMake(44, ZHIOS7(), SCREEN_WIDTH-88-20, 44);
        
        _titleLabel.textColor=[UIColor whiteColor];

        _titleLabel.font=[UIFont boldSystemFontOfSize:20];
    }
    
    return _titleLabel;
}
- (UIButton *)rightButton {
    if (_rightButton== nil){
        _rightButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _rightButton.frame= CGRectMake(SCREEN_WIDTH-54, ZHIOS7(), 44, 44);
        [_rightButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    }
    
    return _rightButton;
}






@end
