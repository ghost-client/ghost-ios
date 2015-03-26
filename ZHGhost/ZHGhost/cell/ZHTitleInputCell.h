//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZH_TITLE_INPUT_CELL_HEIGHT 80
@interface ZHTitleInputCell : UITableViewCell

@property (nonatomic, strong, readonly)UILabel *zhTitleLabel;

@property (nonatomic, strong, readonly)UITextField *zhInputFiled;

@end