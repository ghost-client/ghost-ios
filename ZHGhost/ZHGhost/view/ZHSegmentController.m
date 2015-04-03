//
// Created by hangzhang on 15/4/2.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHSegmentController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"

#define BUTTON_SELECT_COLOR [UIColor colorWithRed:0.906 green:0.902 blue:0.859 alpha:1]
#define BUTTON_NOMAR_COLOR  [UIColor colorWithRed:0.976 green:0.973 blue:0.961 alpha:1]

@implementation ZHSegmentController {

    NSMutableArray *_itemArray;

    SegmentControllerSelect _complete;
}
- (instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)array {
    NSParameterAssert(array.count>0);
    if (self=[super initWithFrame:frame]){

        _itemArray = [NSMutableArray array];

        self.layer.borderColor = NAV_COLOR.CGColor;
        self.layer.borderWidth = 0.5;


        for (int i = 0; i < array.count; ++i) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            float buttonWidth = ZHFrameWidth(self) / array.count;
            button.frame = CGRectMake(0 + buttonWidth * i, 0, buttonWidth, ZHFrameHeight(self));
            [button setTitle:array[i] forState:UIControlStateNormal];
            button.tag = i;
            [button addTarget:self action:@selector(segmentButtonClick:) forControlEvents:UIControlEventTouchUpInside];
            [button setTitleColor:NAV_COLOR forState:UIControlStateNormal];
            [_itemArray addObject:button];
            [self addSubview:button];
        }

        [self changeButtonBgColor];

        

    }
    return self;
}

- (void)setSegmentControllerComplete:(SegmentControllerSelect)cpmlete {

    _complete=cpmlete;

}


- (void)segmentButtonClick:(UIButton *)button {


    self.currentSelectIndex= (NSUInteger) button.tag;


    [self changeButtonBgColor];

    if (_complete){
        _complete(self.currentSelectIndex);
    }


}

-(void)changeButtonBgColor{

    for (int i = 0; i < _itemArray.count; ++i) {
        UIButton *button=_itemArray[i];

        button.backgroundColor= [UIColor clearColor];
        [button setTitleColor:NAV_COLOR forState:UIControlStateNormal];

        if (button.tag==self.currentSelectIndex){
            button.backgroundColor= NAV_COLOR;
            [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }
    }


}

@end