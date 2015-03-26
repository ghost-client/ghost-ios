//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTagTableViewCell.h"
#import "ZHDefine.h"
#import "ZHFounction.h"
#import "PanDeleteButton.h"


@implementation ZHTagTableViewCell {
    
    UIImageView *_numberImageView;
    UILabel *_tagTitleLabel;
    PanDeleteButton *_panDeleteButton;
    UILabel *_tagURLTitleLabel;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];

    if (self){


        [self.panDeleteButton addDeleteButtonInSuperView:self];
        [self addSubview:self.panDeleteButton];

        [self.panDeleteButton addSubview:self.tagTitleLabel];
        [self.panDeleteButton addSubview:self.numberImageView];

        //[self.panDeleteButton addSubview:self.tagURLTitleLabel];

        ZHAddLineView(CGRectMake(0, 49, SCREEN_WIDTH, 1), [UIColor colorWithRed:0.929 green:0.925 blue:0.894 alpha:1], self);

    }

    return self;

}
- (UILabel *)tagTitleLabel {

    if (_tagTitleLabel== nil){
        _tagTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(10,5, SCREEN_WIDTH-20-80,30)];

        _tagTitleLabel.font=[UIFont boldSystemFontOfSize:17];
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


- (UIImageView *)numberImageView {

     if (_numberImageView== nil){
        _numberImageView= [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-10-80, 5, 80, 44)];
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




@end