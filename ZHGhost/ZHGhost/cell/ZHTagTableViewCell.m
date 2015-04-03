//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTagTableViewCell.h"
#import "ZHDefine.h"
#import "ZHFounction.h"
#import "PanDeleteButton.h"
#import "StyleKitName.h"


@implementation ZHTagTableViewCell {
    
    UIButton *_numberImageView;
    UILabel *_tagTitleLabel;
    PanDeleteButton *_panDeleteButton;
    UILabel *_tagURLTitleLabel;
    UIImageView *_tagIconImageView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self){


        [self.panDeleteButton addDeleteButtonInSuperView:self];
        [self addSubview:self.panDeleteButton];

        [self addSubview:self.tagIconImageView];
        self.tagIconImageView.image=[StyleKitName homeListTagIcon];

        [self.panDeleteButton addSubview:self.tagTitleLabel];
        [self.panDeleteButton addSubview:self.numberImageView];

        //[self.panDeleteButton addSubview:self.tagURLTitleLabel];

        ZHAddLineView(CGRectMake(0, 44, SCREEN_WIDTH, 1), NAV_COLOR, self);

    }

    return self;

}
- (UILabel *)tagTitleLabel {

    if (_tagTitleLabel== nil){
        _tagTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.tagIconImageView)+10,5, SCREEN_WIDTH- ZHFrameNextX(self.tagIconImageView)-90,35)];

        //_tagTitleLabel.font=[UIFont boldSystemFontOfSize:17];

        _tagTitleLabel.textColor= NAV_COLOR;
    }


    return _tagTitleLabel;
}

- (UILabel *)tagURLTitleLabel {
    if (_tagURLTitleLabel== nil){
        _tagURLTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameX(self.tagTitleLabel), 55, SCREEN_WIDTH-20, 20)];

        _tagURLTitleLabel.backgroundColor=[UIColor colorWithRed:0.631 green:0.678 blue:0.702 alpha:1];
        _tagURLTitleLabel.textColor=[UIColor whiteColor];
    }
    return _tagURLTitleLabel;
}


- (UIButton *)numberImageView {

     if (_numberImageView== nil){
        _numberImageView= [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-10-80, 0.5, 80, 44)];


    }

    return _numberImageView;
}

- (UIImageView *)tagIconImageView {
    if (_tagIconImageView== nil){
        _tagIconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(10, 7.5, 30, 30)];
    }

    return _tagIconImageView;
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




@end