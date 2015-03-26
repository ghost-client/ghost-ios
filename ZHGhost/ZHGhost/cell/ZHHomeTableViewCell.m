//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHHomeTableViewCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHHomeTableViewCell {
    
    UILabel *_zhtitleLabel;
    UIImageView *_iconImageView;
    UILabel *_zhStatueLabel;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {

    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){

        self.backgroundColor=[UIColor colorWithRed:0.969 green:0.969 blue:0.953 alpha:1];

        [self addSubview:self.iconImageView];

        [self addSubview:self.zhtitleLabel];

        ZHAddLineView(CGRectMake(0, 79, SCREEN_WIDTH, 1), [UIColor whiteColor], self);

        self.selectionStyle=UITableViewCellSelectionStyleNone;

    }

    return self;

}

- (UILabel *)zhtitleLabel {

    if (_zhtitleLabel == nil){
        _zhtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView)+10, 10, SCREEN_WIDTH- ZHFrameNextX(self.iconImageView)-20, 30)];

    }


    return _zhtitleLabel;
}

- (UILabel *)zhStatueLabel {

     if (_zhtitleLabel == nil){
        _zhtitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView)+10, 80-30, SCREEN_WIDTH- ZHFrameNextX(self.iconImageView)-20, 20)];

    }

    return _zhStatueLabel;
}


- (UIImageView *)iconImageView {


    if (_iconImageView== nil){
        _iconImageView= [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 60, 60)];
    }



    return _iconImageView;
}

@end