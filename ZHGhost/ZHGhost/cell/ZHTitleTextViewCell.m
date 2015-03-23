//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTitleTextViewCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHTitleTextViewCell {
    
    UILabel *_zhTitleLabel;
    UITextView *_zhTextView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){

        [self addSubview:self.zhTitleLable];
        [self addSubview:self.zhTextView];

    }
    return self;
}
- (UILabel *)zhTitleLable {
    if (_zhTitleLabel== nil){
        _zhTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 44)];
        _zhTitleLabel.textAlignment=NSTextAlignmentRight;
    }

    return _zhTitleLabel;
}

- (UITextView *)zhTextView {
    if (_zhTextView== nil){
        _zhTextView= [[UITextView alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.zhTitleLable), 0, SCREEN_WIDTH- ZHFrameNextX(self.zhTitleLable), ZHTITLE_TEXTVIEW_CELL_HEIGHT)];
        _zhTextView.textAlignment=NSTextAlignmentLeft;
    }

    return _zhTextView;
}

@end