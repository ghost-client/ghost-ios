//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DTMarkdownParser.h"
typedef void (^ZHMarkDownParseComplete)(NSArray *markDownItemArray);
@interface ZHMarkDownManger : NSObject <DTMarkdownParserDelegate>

-(instancetype)initParseMarkDown:(NSString *)markDown;

- (void)parse:(ZHMarkDownParseComplete)complete;
@end

