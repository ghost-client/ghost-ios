//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHHomeTableViewCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "StyleKitName.h"


@implementation ZHHomeTableViewCell {
    
    UILabel *_zhtitleLabel;
    UIImageView *_iconImageView;
    UILabel *_zhStatueLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){


        self.backgroundColor=[UIColor clearColor];
        [self addSubview:self.iconImageView];

        [self addSubview:self.zhtitleLabel];

        [self addSubview:self.zhStatueLabel];

        ZHAddLineView(CGRectMake(0, ZHHOME_TABLEVIEWCELL_HEIGHT-1, SCREEN_WIDTH, 1), NAV_COLOR, self);

        self.selectionStyle=UITableViewCellSelectionStyleNone;

        self.iconImageView.image=[StyleKitName homeCellIcon];
    }

    return self;

}

- (UILabel *)zhtitleLabel {

    if (_zhtitleLabel == nil){
        _zhtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView)+10, 5, SCREEN_WIDTH- ZHFrameNextX(self.iconImageView)-20, 30)];

                 _zhtitleLabel.textColor= NAV_COLOR;
        _zhtitleLabel.numberOfLines=2;

        _zhtitleLabel.lineBreakMode=NSLineBreakByTruncatingTail;


    }


    return _zhtitleLabel;
}

- (UILabel *)zhStatueLabel {

     if (_zhStatueLabel == nil){
        _zhStatueLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameX(self.zhtitleLabel), ZHFrameNextY(self.zhtitleLabel)+5, ZHFrameWidth(self.zhtitleLabel), 20)];

         _zhStatueLabel.textColor= NAV_COLOR;

    }

    return _zhStatueLabel;
}


- (UIImageView *)iconImageView {


    if (_iconImageView== nil){
        _iconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 50, 50)];
    }



    return _iconImageView;
}

@end