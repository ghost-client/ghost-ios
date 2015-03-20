//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTagTableViewCell.h"
#import "ZHDefine.h"
#import "ZHFounction.h"


@implementation ZHTagTableViewCell {
    
    UIImageView *_iconImageView;
    UIImageView *_numberImageView;
    UILabel *_tagTitleLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self){


        [self addSubview:self.iconImageView];

        [self addSubview:self.tagTitleLabel];

        [self addSubview:self.numberImageView];

    }

    return self;

}
- (UILabel *)tagTitleLabel {

    if (_tagTitleLabel== nil){
        _tagTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView)+10, 0, ZHFrameX(self.numberImageView)- ZHFrameNextX(self.iconImageView)-10, 44)];
    }


    return _tagTitleLabel;
}

- (UIImageView *)numberImageView {

     if (_numberImageView== nil){
        _numberImageView= [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-10-80, 0, 80, 44)];
    }

    return _numberImageView;
}

- (UIImageView *)iconImageView {

    if (_iconImageView== nil){
        _iconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 44, 44)];
    }
    
    
    return _iconImageView;
}


@end