//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTagTableViewCell.h"
#import "ZHDefine.h"
#import "ZHFounction.h"
#import "PanDeleteButton.h"


@implementation ZHTagTableViewCell {
    
    UIImageView *_iconImageView;
    UIImageView *_numberImageView;
    UILabel *_tagTitleLabel;
    PanDeleteButton *_panDeleteButton;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self){


        [self.panDeleteButton addDeleteButtonInSuperView:self];
        [self addSubview:self.panDeleteButton];

        [self.panDeleteButton addSubview:self.iconImageView];

        [self.panDeleteButton addSubview:self.tagTitleLabel];

        [self.panDeleteButton addSubview:self.numberImageView];

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

- (PanDeleteButton *)panDeleteButton {
    
    if (_panDeleteButton== nil){
        _panDeleteButton=[PanDeleteButton buttonWithType:UIButtonTypeCustom];
        _panDeleteButton.frame= CGRectMake(0, 0, SCREEN_WIDTH, 44);
        _panDeleteButton.backgroundColor=[UIColor whiteColor];
        [_panDeleteButton setDeleteButtonWidth:80];
    }
    
    return _panDeleteButton;
}


- (UIImageView *)iconImageView {

    if (_iconImageView== nil){
        _iconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(10, 0, 44, 44)];
    }
    
    
    return _iconImageView;
}


@end