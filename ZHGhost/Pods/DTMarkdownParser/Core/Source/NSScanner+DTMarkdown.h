//
//  NSScanner+DTMarkdown.h
//  DTMarkdownParser
//
//  Created by Oliver Drobnik on 21.10.13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSScanner (DTMarkdown)

// / /返回是的如果有一个超链接,然后是一个可选的标题
- (BOOL)scanMarkdownHyperlink:(NSString **)URLString title:(NSString **)title;

//返回是的如果当前行包含一个有效的减记超链接引用
- (BOOL)scanMarkdownHyperlinkReferenceLine:(NSString **)reference URLString:(NSString **)URLString title:(NSString **)title;

// 返回“是的”如果一个有效的前缀是扫描列表
- (BOOL)scanMarkdownLineListPrefix:(NSString **)prefix;

// 返回“是的”如果一个开始标记标记范围扫描
- (BOOL)scanMarkdownBeginMarker:(NSString **)beginMarker;

// 返回“是的”如果扫描图像,相当于一个IMG标记及其属性src,alt和标题。如果是引用,在引用的引用也使用。
- (BOOL)scanMarkdownImageAttributes:(NSDictionary **)attributes references:(NSDictionary *)references;

//返回“是的”如果扫描图像,相当于一个href和标题标记及其属性。如果是引用,在引用的引用也使用。
- (BOOL)scanMarkdownHyperlinkAttributes:(NSDictionary **)attributes enclosedString:(NSString **)encosedString references:(NSDictionary *)references;

// 返回“是的”如果文本外层格式标记
- (BOOL)scanMarkdownTextBetweenFormatMarkers:(NSString **)text outermostMarker:(NSString **)outermostMarker;

@end
