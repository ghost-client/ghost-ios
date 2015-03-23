//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHBaseViewController.h"
#import "RFMarkdownTextView.h"
@class ZHGContentItemResponsePosts;

#pragma mark 博客显示的正文
@interface ZHGhostContentViewController : ZHBaseViewController

@property (nonatomic, strong, readonly)RFMarkdownTextView *markdownTextView;

-(void)setGhostContent:(ZHGContentItemResponsePosts *)content;

@end