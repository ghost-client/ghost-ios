//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHMarkDownToolView.h"
#import "StyleKitName.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHMarkDownToolView {

    ZHMarkDownToolViewChooseComplete _complete;
}
- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];
    if (self) {


        self.backgroundColor = [UIColor whiteColor];

        float buttonWidth = (float) (SCREEN_WIDTH / 3.0);

        int index=1;

        for (int i = 0; i < 5; ++i) {
            for (int j = 0; j < 3; ++j) {

                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                button.frame = CGRectMake(0 + buttonWidth * j, 0 + 44 * i, buttonWidth, 44);

                button.layer.borderColor = NAV_COLOR.CGColor;
                button.layer.borderWidth = 0.5;

                [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];


                button.tag=index;

                UIImage *image=[UIImage imageNamed:ZHLoadImageName([NSString stringWithFormat:@"md%d",index])];

                [button setBackgroundImage:image forState:UIControlStateNormal];

                index++;

                [self addSubview:button];

            }
        }

    }

    return self;
}

- (void)buttonClick:(UIButton *)buttonClick {



    if (_complete){

        _complete((MarkDownToolType) buttonClick.tag-1);

    }




}

- (void)setMarkDownTypeComplete:(ZHMarkDownToolViewChooseComplete)markDownComplete {
    
    _complete=markDownComplete;

}




@end