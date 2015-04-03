//
// Created by hangzhang on 15/3/30.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHMarkDownEditController.h"
#import "ZHMarkDownTextView.h"
#import "ZHMarkDownManger.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "StyleKitName.h"

@interface ZHMarkDownEditController()

@property (nonatomic, strong)ZHMarkDownTextView *markDownTextView;
@end
@implementation ZHMarkDownEditController {

}
- (void)viewDidLoad {

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.titleLabel.text=@"MarkDown基本编辑器";

    [self.view addSubview:self.markDownTextView];

    [self.navgationView.rightButton setBackgroundImage:[StyleKitName editMoreButton] forState:UIControlStateNormal];

    [self.navgationView.rightButton addTarget:self action:@selector(gotoEditController) forControlEvents:UIControlEventTouchUpInside];


    if (self.markDown){

        ZHMarkDownManger *manger= [[ZHMarkDownManger alloc] initParseMarkDown:self.markDown];

        __weak typeof(self) safeSelf = self;

        [manger parse:^(NSArray *markDownItemArray) {

            [safeSelf.markDownTextView markDownItmes:markDownItemArray];

        }];

    }

}

- (void)gotoEditController {

}

- (ZHMarkDownTextView *)markDownTextView {
    if (_markDownTextView== nil){
        _markDownTextView= [[ZHMarkDownTextView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView))];
    }
    return _markDownTextView;
}



@end