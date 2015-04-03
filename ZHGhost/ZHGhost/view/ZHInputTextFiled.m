//
// Created by hangzhang on 15/4/2.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHInputTextFiled.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHInputTextFiled {

    NSMutableArray *_inputTextFiledArray;
    NSMutableArray *_inputLable;
}
- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    NSParameterAssert(titles.count>0);
    if(self=[super initWithFrame:frame]){

        self.layer.borderColor= NAV_COLOR.CGColor;
        self.layer.borderWidth=0.5;
        _inputTextFiledArray=[NSMutableArray array];
        _inputLable=[NSMutableArray array];
        for (int i = 0; i < titles.count; ++i) {

            UILabel *label= [[UILabel alloc] initWithFrame:CGRectMake(0, 0+40*i, 80, 40)];
            label.textAlignment=NSTextAlignmentRight;
            label.textColor= NAV_COLOR;
            label.text=titles[i];
            [self addSubview:label];
            [_inputLable addObject:label];

            UITextField *textField= [[UITextField alloc] initWithFrame:CGRectMake(ZHFrameNextX(label)+5, ZHFrameY(label), ZHFrameWidth(self)- ZHFrameWidth(label)-5, ZHFrameHeight(label))];

            textField.textAlignment=NSTextAlignmentLeft;

            textField.textColor= NAV_COLOR;

            textField.tag=i;
            [_inputTextFiledArray addObject:textField];

            [self addSubview:textField];

            if (i<titles.count-1){
                ZHAddLineView(CGRectMake(0, ZHFrameNextY(textField), ZHFrameWidth(self), 0.5), NAV_COLOR, self);

            }


        }




    }
    return self;
}

- (NSArray *)textFileds {
    return _inputTextFiledArray;
}




@end