//
// Created by hangzhang on 15/3/29.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSInteger , ZHMarkDownItemTYpe){
    ZHMarkDownItemTYpeNone=0,//不是MarkDown类型
    ZHMarkDownItemTYpeP=1,//行
    ZHMarkDownItemTYpeStrong=2,//粗体
    ZHMarkDownItemTYpeEm=3,//斜体
    ZHMarkDownItemTYpeDel=4,//删除
    ZHMarkDownItemTYpeA=5,//连接
    ZHMarkDownItemTYpeCode=6,//代码
    ZHMarkDownItemTYpeImg=7,//图片
    ZHMarkDownItemTYpeUl=8,//行
    ZHMarkDownItemTYpeLi=9,//列
    ZHMarkDownItemTYpeBlockQuote=10,//引用
    ZHMarkDownItemTYpeH1=11,//H1标题
    ZHMarkDownItemTYpeH2=12,
    ZHMarkDownItemTYpeH3=13,
    ZHMarkDownItemTYpeH4=14,
    ZHMarkDownItemTYpeH5=15,
    ZHMarkDownItemTYpeH6=16,//H6标题
     ZHMarkDownItemTYpeBr=17




};


@interface ZHMarkDownItem : NSObject


-(instancetype)initWithKey:(NSString *)key;

@property (nonatomic, strong)NSString *content;

@property (nonatomic, assign, readonly)ZHMarkDownItemTYpe markDownItemTYpe;

@property (nonatomic, strong)ZHMarkDownItem *markDownItem;

@property(nonatomic, strong) NSDictionary *attributeDict;
@property (nonatomic, assign)BOOL isFindTextEnd;

+(ZHMarkDownItemTYpe)markDownType:(NSString *)key;

@end