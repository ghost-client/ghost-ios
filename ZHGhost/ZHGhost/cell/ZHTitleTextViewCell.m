//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTitleTextViewCell.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHTitleImageView.h"


@implementation ZHTitleTextViewCell {
    
    UILabel *_zhTitleLabel;
    UITextView *_zhTextView;
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.backgroundColor=[UIColor clearColor];

        [self addSubview:self.zhTitleLable];
        [self addSubview:self.zhTextView];

    }
    return self;
}
- (UILabel *)zhTitleLable {
    if (_zhTitleLabel== nil){
        _zhTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake((SCREEN_WIDTH- TAG_CELL_WIDTH* NumberSize())/2, 10, TAG_CELL_WIDTH, 30)];
        _zhTitleLabel.font=[UIFont boldSystemFontOfSize:17];
    }

    return _zhTitleLabel;
}

- (UITextView *)zhTextView {
    if (_zhTextView== nil){
        _zhTextView= [[UITextView alloc] initWithFrame:CGRectMake(ZHFrameX(self.zhTitleLable), ZHFrameNextY(self.zhTitleLable)+10, ZHFrameWidth(self.zhTitleLable), 100)];
        _zhTextView.textAlignment=NSTextAlignmentLeft;
        _zhTextView.layer.borderColor=[UIColor colorWithRed:0.878 green:0.875 blue:0.843 alpha:1].CGColor;
        _zhTextView.layer.borderWidth=1;
        _zhTextView.layer.masksToBounds= YES;
        _zhTextView.layer.cornerRadius=5;
        _zhTextView.backgroundColor=[UIColor whiteColor];
    }

    return _zhTextView;
}

@end