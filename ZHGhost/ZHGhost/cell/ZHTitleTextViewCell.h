//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ZHTITLE_TEXTVIEW_CELL_HEIGHT 150
@interface ZHTitleTextViewCell : UITableViewCell

@property (nonatomic, strong, readonly)UILabel *zhTitleLable;

@property (nonatomic, strong, readonly)UITextView *zhTextView;

@end