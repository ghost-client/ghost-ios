//
//  DTMarkdownParser.h
//  DTMarkdownParser
//
//  Created by Oliver Drobnik on 18.10.13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#import "DTWeakSupport.h"

@class DTMarkdownParser;

/**
DTMarkdownParserDelegate协议定义了可选的方法实现DTMarkdownParser对象的代表。
*/

@protocol DTMarkdownParserDelegate <NSObject>

@optional
/*
　　由解析器对象发送到代表当它开始解析文档。
　　@param解析器对象。
 */
- (void)parserDidStartDocument:(DTMarkdownParser *)parser;

/*
　　由解析器对象发送到代表当它已经成功完成解析。
　　@param解析器对象。
 */
- (void)parserDidEndDocument:(DTMarkdownParser *)parser;

/*
　　由解析器对象为其代表提供一个字符串代表当前元素的所有或部分的字符。
　　@param解析器解析器对象。
　　@param字符串找到字符串内容
 */
- (void)parser:(DTMarkdownParser *)parser foundCharacters:(NSString *)string;

/*
　　由解析器对象,其代表当遇到一个给定元素的开始标记。
　　@param解析器解析器对象。
　　@param elementName一个字符串,该字符串是一个元素的名称(在开始标记)。
　　@param attributeDict字典包含任何与元素相关的属性。键的名称属性和值是属性值。 */
- (void)parser:(DTMarkdownParser *)parser didStartElement:(NSString *)elementName attributes:(NSDictionary *)attributeDict;

/*
　　由解析器对象,其代表当遇到一个给定元素的开始标记。
　　@param解析器解析器对象。
　　@param elementName一个字符串,该字符串是一个元素的名称(在它的结束标记)。
 */
- (void)parser:(DTMarkdownParser *)parser didEndElement:(NSString *)elementName;

@end

/**
 Parsing options for DTMarkdownParser
 */
typedef NS_ENUM(NSUInteger, DTMarkdownParserOptions)
{
	/**
    使用GitHub-style换行,BR,两个是一个便士
    */
	DTMarkdownParserOptionGitHubLineBreaks = 1<<0
};

/**
DTMarkdownParser减价是一个基于事件的解析器。它是仿照“NSXMLParser”和事件可以用来生成HTML或其他结构化输出格式。 */

@interface DTMarkdownParser : NSObject

/**
 @name Creating a Parser
 */

- (instancetype)initWithString:(NSString *)string options:(DTMarkdownParserOptions)options;

/**
 @name Parsing
 */

/**
 Parsing Delegate
 */
@property (nonatomic, DT_WEAK_PROPERTY) id <DTMarkdownParserDelegate> delegate;

/**
　　启动事件驱动的解析操作。
　　@returns '是的'如果解析成功,“不”在出现错误或者解析操作中止。
 */
- (BOOL)parse;

@end
