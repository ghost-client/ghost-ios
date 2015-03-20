//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHHomeTableViewCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHHomeTableViewCell {
    
    UILabel *_titleLabel;
    UIImageView *_iconImageView;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){

        [self addSubview:self.iconImageView];

        [self addSubview:self.titleLabel];


    }

    return self;

}

- (UILabel *)titleLabel {

    if (_titleLabel== nil){
        _titleLabel= [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView)+10, 10, SCREEN_WIDTH- ZHFrameNextX(self.iconImageView)-20, 30)];
    }


    return _titleLabel;
}

- (UIImageView *)iconImageView {


    if (_iconImageView== nil){
        _iconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
    }



    return _iconImageView;
}

@end