//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTitleInputCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHTitleImageView.h"


@implementation ZHTitleInputCell {

    UILabel *_zhTitleLabel;
    UITextField *_zhInputFiled;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){

        self.backgroundColor=[UIColor clearColor];
        [self addSubview:self.zhTitleLabel];

        [self addSubview:self.zhInputFiled];

    }

    return self;
}
- (UILabel *)zhTitleLabel {

    if (_zhTitleLabel== nil){
        _zhTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH- TAG_CELL_WIDTH* NumberSize())/2, 10, TAG_CELL_WIDTH* NumberSize(), 30)];
        _zhTitleLabel.font=[UIFont boldSystemFontOfSize:17];
    }

    return _zhTitleLabel;
}

- (UITextField *)zhInputFiled {
    if (_zhInputFiled== nil){
        _zhInputFiled= [[UITextField alloc] initWithFrame:CGRectMake(ZHFrameX(self.zhTitleLabel), ZHFrameNextY(self.zhTitleLabel)+10, ZHFrameWidth(self.zhTitleLabel), 30)];
        _zhInputFiled.layer.borderColor=[UIColor colorWithRed:0.878 green:0.875 blue:0.843 alpha:1].CGColor;
        _zhInputFiled.layer.borderWidth=1;
        _zhInputFiled.layer.masksToBounds= YES;
        _zhInputFiled.layer.cornerRadius=5;
        _zhInputFiled.backgroundColor=[UIColor whiteColor];
    }
    return _zhInputFiled;
}

@end