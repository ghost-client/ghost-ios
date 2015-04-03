//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHGhostContentViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHGContentItemResponsePosts.h"
#import "MMMarkdown.h"
#import "ZHMarkDownManger.h"
#import "ZHMarkDownTextView.h"
#import "ZHMarkDownEditController.h"
#import "ZHGhostManger.h"


@implementation ZHGhostContentViewController
{

    ZHGContentItemResponsePosts *_markdownContent;
    UIWebView *_markdownWebView;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.titleLabel.text=@"君赏博客";

    [self.view addSubview:self.markdownWebView];


    NSString *html=[MMMarkdown HTMLStringWithMarkdown:_markdownContent.markdown error:NULL];


    [self.markdownWebView loadHTMLString:_markdownContent.html baseURL:[NSURL URLWithString:[ZHGhostManger manger].currentLoginHost]];

    [self.navgationView.rightButton setTitle:@"编辑" forState:UIControlStateNormal];

    [self.navgationView.rightButton addTarget:self action:@selector(gotoEditController) forControlEvents:UIControlEventTouchUpInside];




}

- (void)gotoEditController {

     ZHMarkDownEditController *editController= [[ZHMarkDownEditController alloc] init];

    editController.markDown=_markdownContent.markdown;

    [self.navigationController pushViewController:editController animated:YES];

}


- (UIWebView *)markdownWebView {
    
    if(_markdownWebView==nil){
        _markdownWebView= [[UIWebView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView))];

    }
    
    return _markdownWebView;
}

- (void)setGhostContent:(ZHGContentItemResponsePosts *)content {

    _markdownContent=content;

}


@end