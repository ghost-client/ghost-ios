//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZHHOME_TABLEVIEWCELL_HEIGHT 80

@interface ZHHomeTableViewCell : UITableViewCell


@property (nonatomic, strong, readonly)UIImageView *iconImageView;

@property (nonatomic, strong, readonly)UILabel *zhtitleLabel;

@property (nonatomic, strong, readonly)UILabel *zhStatueLabel;


@end