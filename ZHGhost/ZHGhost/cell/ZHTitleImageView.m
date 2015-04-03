//
// Created by hangzhang on 15/3/26.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTitleImageView.h"
#import "ZHDefine.h"
#import "ZHFounction.h"
#import "StyleKitName.h"

@implementation ZHTitleImageView {

    UILabel *_zhTitlelabel;
    UIButton *_zhImageButton;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.backgroundColor=[UIColor clearColor];
        [self addSubview:self.zhTitlelabel];
        [self addSubview:self.zhImageButton];
    }
    return self;
}
- (UILabel *)zhTitlelabel {

    if (_zhTitlelabel== nil){

        _zhTitlelabel= [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH- TAG_CELL_WIDTH* NumberSize())/2, 10, TAG_CELL_WIDTH* NumberSize(), 30)];

        _zhTitlelabel.font=[UIFont boldSystemFontOfSize:17];

        _zhTitlelabel.textColor= NAV_COLOR;
    }


    return _zhTitlelabel;
}

- (UIButton *)zhImageButton
{

    if (_zhImageButton== nil){
        _zhImageButton=[UIButton buttonWithType:UIButtonTypeCustom];
        _zhImageButton.frame= CGRectMake(ZHFrameX(self.zhTitlelabel), ZHFrameNextY(self.zhTitlelabel)+10, ZHFrameWidth(self.zhTitlelabel), 200);

        [_zhImageButton setBackgroundImage:[StyleKitName imageOfTagImageButtonWithFrame:_zhImageButton.bounds] forState:UIControlStateNormal];
    }

    return _zhImageButton;
}

@end