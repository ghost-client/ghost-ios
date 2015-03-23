//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHGhostContentViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHGContentItemResponsePosts.h"


@implementation ZHGhostContentViewController {

    RFMarkdownTextView *_markdownTextView;
    ZHGContentItemResponsePosts *_markdownContent;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.titleLabel.text=@"君赏博客";


    [self.view addSubview:self.markdownTextView];

    self.markdownTextView.text=_markdownContent.markdown;

    [self.markdownTextView reloadInputViews];


}



- (RFMarkdownTextView *)markdownTextView {

    if (_markdownTextView== nil){

        _markdownTextView= [[RFMarkdownTextView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView))];

        _markdownTextView.textColor=[UIColor blackColor];
    }
    
    return _markdownTextView;
}

- (void)setGhostContent:(ZHGContentItemResponsePosts *)content {

    _markdownContent=content;

}


@end