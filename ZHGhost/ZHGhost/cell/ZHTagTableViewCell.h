//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZHTAG_CELL_HEIGHT 45
@interface ZHTagTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly)UIImageView *iconImageView;

@property (nonatomic, strong, readonly)UILabel *tagTitleLabel;

@property (nonatomic, strong, readonly)UIImageView * numberImageView;


@end