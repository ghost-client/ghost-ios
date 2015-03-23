//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTitleInputCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHTitleInputCell {

    UILabel *_zhTitleLabel;
    UITextField *_zhInputFiled;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){

        [self addSubview:self.zhTitleLabel];

        [self addSubview:self.zhInputFiled];

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

- (UITextField *)zhInputFiled {
    if (_zhInputFiled== nil){
        _zhInputFiled= [[UITextField alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.zhTitleLabel), 0, SCREEN_WIDTH- ZHFrameWidth(self.zhTitleLabel), 44)];
    }
    return _zhInputFiled;
}

@end