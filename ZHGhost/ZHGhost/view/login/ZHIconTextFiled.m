//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHIconTextFiled.h"
#import "ZHFounction.h"
@implementation ZHIconTextFiled {

    UIImageView *_iconImageView;

    UITextField *_textFiled;


}
- (instancetype)initWithFrame:(CGRect)frame {

    NSParameterAssert(frame.size.width>0 && frame.size.height>0);

    self=[super initWithFrame:frame];

    if (self){


        self.layer.masksToBounds= YES;

        self.layer.cornerRadius= ZHFrameHeight(self)/2;

        self.backgroundColor=[UIColor whiteColor];

        [self addSubview:self.iconImageView];

        [self addSubview:self.textFiled];


    }

    return self;
}

- (UIImageView *)iconImageView {

    if (_iconImageView== nil){
        _iconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ZHFrameHeight(self), ZHFrameHeight(self))];

    }

    return _iconImageView;
}

- (UITextField *)textFiled {

    if (_textFiled== nil){

        _textFiled= [[UITextField alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView), 0, ZHFrameWidth(self)- ZHFrameHeight(self)-5, ZHFrameHeight(self))];

        _textFiled.textAlignment=NSTextAlignmentCenter;

        _textFiled.layer.borderColor=[UIColor colorWithRed:0.878 green:0.875 blue:0.843 alpha:1].CGColor;
        _textFiled.layer.borderWidth=1;
        _textFiled.layer.masksToBounds= YES;
        _textFiled.layer.cornerRadius=5;

    }

    return _textFiled;

}


@end