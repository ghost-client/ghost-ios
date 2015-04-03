//
// Created by hangzhang on 15/3/27.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHBaseViewController.h"


@interface ZHSettingViewController : ZHBaseViewController <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate> {
    UITableView *_settingInfoTableView;
}
@property(nonatomic, strong, readonly) UITableView *settingInfoTableView;
@end