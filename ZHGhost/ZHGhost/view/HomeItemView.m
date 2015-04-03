//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "HomeItemView.h"
#import "ZHFounction.h"
#import "ZHDefine.h"

@interface HomeItemView()

@property (nonatomic, strong)UIImageView *iconImageView;

@property (nonatomic, strong)UILabel *iconTitleLabel;


@end
@implementation HomeItemView {

}
- (instancetype)initWithFrame:(CGRect)frame {



    self=[super initWithFrame:frame];
    if (self){


        self.backgroundColor=[UIColor clearColor];

        NSParameterAssert(ZHFrameHeight(self)>0);

        NSParameterAssert(ZHFrameWidth(self)> ZHFrameHeight(self)+20);

        [self addSubview:self.iconImageView];

        [self addSubview:self.iconTitleLabel];

        ZHAddLineView(CGRectMake(0, 0, ZHFrameWidth(self), 1), NAV_COLOR, self);


    }

    return self;
}

- (void)setItemIcon:(UIImage *)itemIcon {

    _itemIcon=itemIcon;

    self.iconImageView.image=itemIcon;


}

- (void)setTitle:(NSString *)itemTitle {

    _itemTitle=itemTitle;

    self.iconTitleLabel.text=itemTitle;
}

- (UILabel *)iconTitleLabel {

    if (_iconTitleLabel== nil){
        _iconTitleLabel= [[UILabel alloc] init];

        _iconTitleLabel= [[UILabel alloc] initWithFrame:CGRectMake(ZHFrameNextX(self.iconImageView)+20, 0, ZHFrameWidth(self)- ZHFrameNextX(self.iconImageView)-20, ZHFrameHeight(self))];

        _iconTitleLabel.textAlignment=NSTextAlignmentLeft;
        //_iconTitleLabel.userInteractionEnabled= YES;
        _iconTitleLabel.textColor= NAV_COLOR;
    }

    return _iconTitleLabel;
}

- (UIImageView *)iconImageView {

    if (_iconImageView== nil){

        _iconImageView= [[UIImageView alloc] init];

        float spanceY=(ZHFrameHeight(self)-30)/2.f;
        _iconImageView.frame= CGRectMake(spanceY, spanceY, 30, 30);

       // _iconImageView.userInteractionEnabled= YES;
    }

    return _iconImageView;
}


@end