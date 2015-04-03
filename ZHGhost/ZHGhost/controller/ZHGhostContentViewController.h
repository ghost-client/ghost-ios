//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <DTMarkdownParser/DTMarkdownParser.h>
#import "ZHBaseViewController.h"
#import "RFMarkdownTextView.h"
#import "RFKeyboardToolbar.h"

#import "DTMarkdownParser.h"

@class ZHGContentItemResponsePosts;

#pragma mark 博客显示的正文
@interface ZHGhostContentViewController : ZHBaseViewController <DTMarkdownParserDelegate>

@property (nonatomic, strong, readonly)UIWebView *markdownWebView;

-(void)setGhostContent:(ZHGContentItemResponsePosts *)content;

@end