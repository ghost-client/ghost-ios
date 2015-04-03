//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHMarkDownTextViewInputAccessoryView.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHMarkDownTextViewInputAccessoryView {

    UIButton *_dismissButton;
    UIButton *_markDownButton;
    UIButton *_formatterButton;
    CGFloat _spanceY;
}
- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];
    if(self){

        self.backgroundColor=[UIColor whiteColor];
        
        _spanceY= ZHFrameWidth(self)/3.0f;


        [self addSubview:self.markDownButton];

        [self addSubview:self.formatterButton];

        [self addSubview:self.dismissButton];


    }

    return self;

}
- (UIButton *)dismissButton {

    if (_dismissButton== nil){
        _dismissButton=[UIButton buttonWithType:UIButtonTypeCustom];

        _dismissButton.frame= CGRectMake(ZHFrameWidth(self)-_spanceY, 0, _spanceY, 44);

        [self makeButtonLayer:_dismissButton];

        [_dismissButton setTitle:@"隐藏键盘" forState:UIControlStateNormal];

        [_dismissButton setTitleColor:[UIColor colorWithRed:0.333 green:0.431 blue:0.475 alpha:1] forState:UIControlStateNormal];

    }

    return _dismissButton;
}

- (UIButton *)markDownButton {
    if (_markDownButton== nil){
        _markDownButton=[UIButton buttonWithType:UIButtonTypeCustom];

        _markDownButton.frame= CGRectMake(0, 0, _spanceY, 44);

        [_markDownButton setTitle:@"MD工具" forState:UIControlStateNormal];
                [_markDownButton setTitleColor:[UIColor colorWithRed:0.333 green:0.431 blue:0.475 alpha:1] forState:UIControlStateNormal];



        [self makeButtonLayer:_markDownButton];
    }

    return _markDownButton;
}

- (UIButton *)formatterButton {

    if (_formatterButton== nil){
        _formatterButton=[UIButton buttonWithType:UIButtonTypeCustom];

        _formatterButton.frame= CGRectMake(ZHFrameNextX(self.markDownButton), 0, ZHFrameWidth(self)-2*_spanceY, 44);

        [_formatterButton setTitle:@"格式化" forState:UIControlStateNormal];
        [_formatterButton setTitleColor:[UIColor colorWithRed:0.333 green:0.431 blue:0.475 alpha:1] forState:UIControlStateNormal];



        [self makeButtonLayer:_formatterButton];
    }

    return _formatterButton;
}


-(void)makeButtonLayer:(UIButton *)button{



    button.layer.borderWidth=0.5;

    button.layer.borderColor=[UIColor colorWithRed:0.333 green:0.431 blue:0.475 alpha:1].CGColor;

}

@end