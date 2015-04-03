//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHMarkDownToolView.h"
#import "StyleKitName.h"
#import "ZHFounction.h"


@implementation ZHMarkDownToolView {

    ZHMarkDownToolViewChooseComplete _complete;
}
- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];
    if (self){


        self.backgroundColor=[UIColor whiteColor];

        for (int i = 0; i < 8; ++i) {
            UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
            button.frame= CGRectMake(0, 0+44*i, 44, 44);

            button.tag=i;

            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];

            [button setBackgroundImage:[StyleKitName editButton] forState:UIControlStateNormal];

            [self addSubview:button];
        }

    }

    return self;
}

- (void)buttonClick:(UIButton *)buttonClick {



    if (_complete){

        _complete((MarkDownToolType) buttonClick.tag);

    }

    [UIView animateWithDuration:.3 animations:^{

        self.frame= CGRectMake(0, ZHFrameY(self), ZHFrameWidth(self), ZHFrameHeight(self));
    } completion:^(BOOL complete){

        [self removeFromSuperview];
    }];


}

- (void)setMarkDownTypeComplete:(ZHMarkDownToolViewChooseComplete)markDownComplete {
    
    _complete=markDownComplete;

}


@end