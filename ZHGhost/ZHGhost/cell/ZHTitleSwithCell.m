//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTitleSwithCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHTitleSwithCell {
    
    UILabel *_zhTitleLabel;
    UISwitch *_zhSwith;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){


        [self addSubview:self.zhTitleLabel];

        [self addSubview:self.zhSwith];
    }

    return self;
}
- (UILabel *)zhTitleLabel {
   if (_zhTitleLabel== nil){
        _zhTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
        _zhTitleLabel.textAlignment=NSTextAlignmentRight;
    }

    return _zhTitleLabel;
}

- (UISwitch *)zhSwith {
    if (_zhSwith== nil){
        _zhSwith= [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-10-51, (44-31)/2, 51, 31)];
    }

    return _zhSwith; 
}

@end