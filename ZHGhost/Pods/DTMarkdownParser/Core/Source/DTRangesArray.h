//
//  DTRangeDictionary.h
//  DTMarkdownParser
//
//  Created by Oliver Drobnik on 01/11/13.
//  Copyright (c) 2013 Cocoanetics. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
专业查找表找到位置范围 */

@interface DTRangesArray : NSObject

/**
 @name Modifying the Ranges Array
 */

/**
　　添加一个范围作为最后一个条目
　　@param范围添加范围
 */
- (void)addRange:(NSRange)range;

/**
 @name Enumerating Ranges
 */

/**
　　列举所有范围内存储的接收器
　　@param块的块为每一行执行范围
 */
- (void)enumerateLineRangesUsingBlock:(void(^)(NSRange range, NSUInteger idx, BOOL *stop))block;


/**
 @name Getting Information
 */

/**
　　接收器的数量范围存储
　　@returns计数
 */
- (NSUInteger)count;


/**
 @name Finding Ranges
 */

/**
　　返回给定索引的范围
　　@param指数索引查询
　　@returns范围
 */
- (NSRange)rangeAtIndex:(NSUInteger)index;

/**
　　返回包含给定位置的索引范围
　　@param位置的位置搜索范围
　　@returns索引或“NSNotFound”如果没有发现
 */
- (NSUInteger)indexOfRangeContainingLocation:(NSUInteger)location;

/**
　　返回包含给定位置的范围
　　@param位置的位置搜索范围
　　@returns范围或“{ NSNotFound,0 }”如果没有发现
 */
- (NSRange)rangeContainingLocation:(NSUInteger)location;

@end
