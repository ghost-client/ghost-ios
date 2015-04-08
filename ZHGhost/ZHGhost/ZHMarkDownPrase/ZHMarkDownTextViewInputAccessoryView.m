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
    ZHMarkDownTextViewInputAccessoryViewButtonComplete _complete;
}
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)array {

    NSParameterAssert(array.count);

    if (self=[super initWithFrame:frame]){

        float buttonWidth= ZHFrameWidth(self)/array.count;

        for (int i = 0; i < array.count; ++i) {
             UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
             button.frame= CGRectMake(0+buttonWidth*i, 0, buttonWidth, ZHFrameHeight(self));

            [self makeButtonLayer:button];

            [button setTitle:array[i] forState:UIControlStateNormal];

            [button setTitleColor:NAV_COLOR forState:UIControlStateNormal];

            button.backgroundColor=[UIColor whiteColor];

            button.tag=i;

            [button addTarget:self action:@selector(markDownAccessoryButtonClick:) forControlEvents:UIControlEventTouchUpInside];

            [self addSubview:button];
        }

    }
    return self;
}

- (void)setMarkDownTextViewAccessoryButtonComplete:(ZHMarkDownTextViewInputAccessoryViewButtonComplete)complete {
    
    _complete=complete;

}


- (void)markDownAccessoryButtonClick:(UIButton *)markDownAccessoryButtonClick {


    if (_complete){

        _complete((ZHMarkDownTextViewInputAccessoryViewButtonType) markDownAccessoryButtonClick.tag);
    }



}


-(void)makeButtonLayer:(UIButton *)button{



    button.layer.borderWidth=0.5;

    button.layer.borderColor= NAV_COLOR.CGColor;

}

@end