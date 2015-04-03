//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <DTMarkdownParser/DTMarkdownParser.h>
#import "ZHMarkDownManger.h"
#import "ZHMarkDownItem.h"


@implementation ZHMarkDownManger {

    NSString *_markDown;
    NSMutableArray *_markDwonItems;

    ZHMarkDownParseComplete _markDownItemsComplete;
    NSMutableArray *_markKeyArray;
    NSMutableArray *_markDwonItemsCash;
}
- (instancetype)initParseMarkDown:(NSString *)markDown {

    NSParameterAssert(markDown);

    self=[super init];
    if(self){

        _markDown=markDown;

    }

    return self;
}
-(void)parse:(ZHMarkDownParseComplete)complete{

    _markDownItemsComplete=complete;

    DTMarkdownParser *parser= [[DTMarkdownParser alloc] initWithString:_markDown options:DTMarkdownParserOptionGitHubLineBreaks];

    parser.delegate=self;


    BOOL isSuccess=[parser parse];

    if (!isSuccess){

        complete(nil);

    }


}
#pragma mark DTMarkDownParseDelegate

- (void)parserDidStartDocument:(DTMarkdownParser *)parser{

    _markDwonItems=[NSMutableArray array];

    _markKeyArray=[NSMutableArray array];
    
    _markDwonItemsCash=[NSMutableArray array];

}

- (void)parserDidEndDocument:(DTMarkdownParser *)parser{

    if (_markDownItemsComplete){
        _markDownItemsComplete(_markDwonItems);
    }

}


- (void)parser:(DTMarkdownParser *)parser foundCharacters:(NSString *)string{



    NSParameterAssert(_markDwonItemsCash.count>0);

    ZHMarkDownItem *markDownItem=_markDwonItemsCash[_markDwonItemsCash.count-1];
    markDownItem.content=[NSString stringWithFormat:@"%@%@",markDownItem.content?markDownItem.content:@"",string];

}


- (void)parser:(DTMarkdownParser *)parser didStartElement:(NSString *)elementName attributes:(NSDictionary *)attributeDict{


   // NSLog(@"%@==%@",elementName,attributeDict);

    ZHMarkDownItem *markDownItem= [[ZHMarkDownItem alloc] initWithKey:elementName];
    
    markDownItem.attributeDict=attributeDict;

    [_markKeyArray addObject:elementName];

    [_markDwonItemsCash addObject:markDownItem];


}


- (void)parser:(DTMarkdownParser *)parser didEndElement:(NSString *)elementName{


    for (NSString *string in _markKeyArray){

        if ([string isEqualToString:elementName]){
            [_markKeyArray removeObject:string];

            break;

        }

    }

    if (_markDwonItemsCash.count > 0) {
        ZHMarkDownItem *markDownItem = _markDwonItemsCash[0];
        if (markDownItem.markDownItemTYpe == [ZHMarkDownItem markDownType:elementName]) {

            _markDwonItemsCash = [self markDownItmFromArray:_markDwonItemsCash];

            if (_markDwonItemsCash.count > 0) {
                [_markDwonItems addObject:_markDwonItemsCash[0]];

                [_markDwonItemsCash removeAllObjects];
            }

        }
    }



}
-(NSMutableArray *)markDownItmFromArray:(NSMutableArray *)array{


    if (array.count==0 || array.count==1){
        return array;
    } else{


        ZHMarkDownItem *markDownItem1=array[array.count-2];

        ZHMarkDownItem *markDownItem2=array[array.count-1];

        markDownItem1.markDownItem=markDownItem2;

        [array removeObject:markDownItem2];

        [self markDownItmFromArray:array];


    }


    return array;
}
@end