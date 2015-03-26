//
// Created by hangzhang on 15/3/26.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHAllUserViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"


@implementation ZHAllUserViewController {

    UITableView *_userTableView;
}
- (UITableView *)userTableView {
    if (_userTableView== nil){
        _userTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStylePlain];
    }
    return _userTableView;
}

@end