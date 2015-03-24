//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHGhostContentViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHGContentItemResponsePosts.h"
#import "MMMarkdown.h"


@implementation ZHGhostContentViewController {

    UIWebView *_markdownTextView;
    ZHGContentItemResponsePosts *_markdownContent;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.titleLabel.text=@"君赏博客";


    [self.view addSubview:self.markdownTextView];

    NSString *html=[MMMarkdown HTMLStringWithMarkdown:_markdownContent.markdown error:NULL];

    [self.markdownTextView loadHTMLString:_markdownContent.html baseURL:[NSURL URLWithString:@"http://js.uiapple.com"]];


}



- (UIWebView *)markdownTextView {

    if (_markdownTextView== nil){

        _markdownTextView= [[UIWebView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView))];

    }
    
    return _markdownTextView;
}

- (void)setGhostContent:(ZHGContentItemResponsePosts *)content {

    _markdownContent=content;

}


@end