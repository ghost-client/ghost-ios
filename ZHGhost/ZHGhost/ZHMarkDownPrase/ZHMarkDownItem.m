//
// Created by hangzhang on 15/3/29.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHMarkDownItem.h"
#define ZHMarkDownItemPKey @"p"
#define ZHMarkDownItemStrongKey @"strong"
#define ZHMarkDownItemEmKey @"em"
#define ZHMarkDownItemDelKey @"del"
#define ZHMarkDownItemAKey @"a"
#define ZHMarkDownItemCodeKey @"code"
#define ZHMarkDownItemImgKey @"img"
#define ZHMarkDownItemUlKey @"ul"
#define ZHMarkDownItemLiKey @"li"
#define ZHMarkDownItemBlockQuoteKey @"blockquote"
#define ZHMarkDownItemH1Key @"h1"
#define ZHMarkDownItemH2Key @"h2"
#define ZHMarkDownItemH3Key @"h3"
#define ZHMarkDownItemH4Key @"h4"
#define ZHMarkDownItemH5Key @"h5"
#define ZHMarkDownItemH6Key @"h6"
#define ZHMarkDownItemBRKey @"br"


@implementation ZHMarkDownItem {

    ZHMarkDownItemTYpe _markDownItemTYpe;
}


-(void)setItemType:(NSString *)key{

    _markDownItemTYpe=[ZHMarkDownItem markDownType:key];



}

- (instancetype)initWithKey:(NSString *)key {

    NSParameterAssert(key);
    self=[super init];
    if (self){

        [self setItemType:key];
    }
    return self;
}

- (ZHMarkDownItemTYpe)markDownItemTYpe {
    return _markDownItemTYpe;
}

+ (ZHMarkDownItemTYpe)markDownType:(NSString *)key {


    if ([key isEqualToString:ZHMarkDownItemPKey]){
        return ZHMarkDownItemTYpeP;
    } else if ([key isEqualToString:ZHMarkDownItemStrongKey]){
        return ZHMarkDownItemTYpeStrong;

    }else if ([key isEqualToString:ZHMarkDownItemEmKey]){
        return ZHMarkDownItemTYpeEm;

    }else if ([key isEqualToString:ZHMarkDownItemDelKey]){
        return ZHMarkDownItemTYpeDel;

    }else if ([key isEqualToString:ZHMarkDownItemAKey]){
        return ZHMarkDownItemTYpeA;

    }else if ([key isEqualToString:ZHMarkDownItemCodeKey]){
        return ZHMarkDownItemTYpeCode;

    }else if ([key isEqualToString:ZHMarkDownItemImgKey]){
        return ZHMarkDownItemTYpeImg;

    }else if ([key isEqualToString:ZHMarkDownItemUlKey]){
        return ZHMarkDownItemTYpeUl;

    }else if ([key isEqualToString:ZHMarkDownItemLiKey]){
        return ZHMarkDownItemTYpeLi;

    }else if ([key isEqualToString:ZHMarkDownItemBlockQuoteKey]){
        return ZHMarkDownItemTYpeBlockQuote;

    }else if ([key isEqualToString:ZHMarkDownItemH1Key]){
        return ZHMarkDownItemTYpeH1;

    }else if ([key isEqualToString:ZHMarkDownItemH2Key]){
                return ZHMarkDownItemTYpeH2;


    }else if ([key isEqualToString:ZHMarkDownItemH3Key]){
                return ZHMarkDownItemTYpeH3;


    }else if ([key isEqualToString:ZHMarkDownItemH4Key]){
                return ZHMarkDownItemTYpeH4;


    }else if ([key isEqualToString:ZHMarkDownItemH5Key]){
                return ZHMarkDownItemTYpeH5;


    }
    else if ([key isEqualToString:ZHMarkDownItemH6Key]){
        return ZHMarkDownItemTYpeH6;


    }else if ([key isEqualToString:ZHMarkDownItemBRKey]){
        return ZHMarkDownItemTYpeBr;


    }

    return ZHMarkDownItemTYpeNone;
}


@end