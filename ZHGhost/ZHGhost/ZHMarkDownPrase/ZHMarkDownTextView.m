//
// Created by hangzhang on 15/3/29.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHMarkDownTextView.h"
#import "ZHMarkDownItem.h"
#import "ZHMarkDownManger.h"
#import "ZHMarkDownTextViewInputAccessoryView.h"
#import "ZHDefine.h"
#import "ZHMarkDownToolView.h"
#import "ZHFounction.h"

#define SPANCEY 10

#define DEFINE_MARKDOWN_FONT_SIZE 15

@implementation ZHMarkDownTextView
{

    NSMutableArray *   _customViewArray ;

    NSArray *_markDownItems;


    NSMutableArray *_markDownCashArray;

    ZHMarkDownTextViewInputAccessoryView *_accessoryView;
    ZHMarkDownToolView *_markDownToolView;
}
- (void)setAttributedString:(NSAttributedString *)attributedString {
    _attributedString = attributedString;

    self.attributedText=_attributedString;
}

- (ZHMarkDownTextViewInputAccessoryView *)accessoryView {
    if (_accessoryView== nil){

        _accessoryView= [[ZHMarkDownTextViewInputAccessoryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];

    }
    return _accessoryView;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self=[super initWithFrame:frame];
    if (self){

        self.backgroundColor=[UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1];

        _markDownCashArray=[NSMutableArray array];

        self.inputAccessoryView= self.accessoryView;

        [self.accessoryView.dismissButton addTarget:self action:@selector(dismissButtonClick) forControlEvents:UIControlEventTouchUpInside];

        [self.accessoryView.markDownButton addTarget:self action:@selector(markDownButtonClick) forControlEvents:UIControlEventTouchUpInside];


        self.delegate=self;
    }

    return self;
}

- (void)markDownButtonClick {

    [self dismissButtonClick];

    if (_markDownToolView== nil){
        _markDownToolView= [[ZHMarkDownToolView alloc] initWithFrame:CGRectMake(0, 0, 44, 44*8)];

        _markDownToolView.frame= CGRectMake(-44, (ZHFrameHeight(self)- ZHFrameHeight(_markDownToolView))/2, ZHFrameWidth(_markDownToolView), ZHFrameHeight(_markDownToolView));


        
    }

    [self addSubview:_markDownToolView];

    [UIView animateWithDuration:.3 animations:^{

        _markDownToolView.frame= CGRectMake(0, ZHFrameY(_markDownToolView), ZHFrameWidth(_markDownToolView), ZHFrameHeight(_markDownToolView));

    }];

    [_markDownToolView setMarkDownTypeComplete:^(MarkDownToolType type) {

        NSLog(@"%d",type);



    }];


}

- (void)dismissButtonClick {

    [self resignFirstResponder];


}

- (void)markDownItmes:(NSArray *)items {


    NSMutableArray *stringArray=[NSMutableArray array];

    _markDownItems=items;

    if (_markDownItems.count>0){

        for (int i = 0; i < _markDownItems.count; ++i) {
             ZHMarkDownItem *markDownItem=_markDownItems[i];

             if (markDownItem){

                 [_markDownCashArray addObject:markDownItem];

                 while (markDownItem.markDownItem){

                     [_markDownCashArray addObject:markDownItem.markDownItem];

                     markDownItem=markDownItem.markDownItem;

                     continue;

                 }
             }

            NSMutableAttributedString *string= [[NSMutableAttributedString alloc] initWithString:@""];

            NSParameterAssert(_markDownCashArray.count>0);

            ZHMarkDownItem *markDownItem1=_markDownCashArray[0];
            if (markDownItem1.markDownItemTYpe!=ZHMarkDownItemTYpeP){

                ZHMarkDownItem *markDownItem2= [[ZHMarkDownItem alloc] initWithKey:@"p"];

                [_markDownCashArray insertObject:markDownItem2 atIndex:0];
            }

            for (int j = _markDownCashArray.count-1; j >=0 ; j--) {

                string=[self stringFromMarkDownItem:_markDownCashArray[j] string:string];

            }

            [stringArray addObject:string];

            [_markDownCashArray removeAllObjects];


        }

    }



    NSMutableAttributedString *mutableAttributedString1= [[NSMutableAttributedString alloc] initWithString:@""];

    for (NSMutableAttributedString *mutableAttributedString in stringArray){


        [mutableAttributedString1 appendAttributedString:mutableAttributedString];

    }

    self.attributedString=mutableAttributedString1;



}


-(NSMutableAttributedString *)stringFromMarkDownItem:(ZHMarkDownItem *)markDownItem   string:(NSMutableAttributedString *)string{


    if (markDownItem.content){

        [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:markDownItem.content] atIndex:0];

    }

    switch (markDownItem.markDownItemTYpe){

                 case ZHMarkDownItemTYpeNone:

                 {




                 }
                     break;



                 case ZHMarkDownItemTYpeP:

                 {

                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n\n"] atIndex:string.mutableString.length];

                     if (markDownItem.content.length>0){

                         [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.396 green:0.396 blue:0.396 alpha:1]
    } range:NSMakeRange(0, markDownItem.content.length)];

                     }

                 }

                     break;
                 case ZHMarkDownItemTYpeStrong:
                 {

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"**"] atIndex:0];

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"**"] atIndex:string.mutableString.length];

                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.761 green:0.208 blue:0.553 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length)];


                 }
                     break;
                 case ZHMarkDownItemTYpeEm:{


                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"*"] atIndex:0];

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"*"] atIndex:string.mutableString.length];

                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.341 green:0.612 blue:0.792 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length)];



                 }break;
                 case ZHMarkDownItemTYpeDel:
                 {
                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"~~"] atIndex:0];

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"~~"] atIndex:string.mutableString.length];

                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.0392 green:0.541 blue:0.349 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length)];
                 }
                     break;
                 case ZHMarkDownItemTYpeA:{

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"["] atIndex:0];

                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"]("] atIndex:string.mutableString.length];

                     NSString *name=markDownItem.attributeDict[@"title"]?[NSString stringWithFormat:@" \"%@\"",markDownItem.attributeDict[@"title"]]:@"";

                     NSString *href=markDownItem.attributeDict[@"href"]?[NSString stringWithFormat:@"\"%@\"",markDownItem.attributeDict[@"href"]]:@"";


                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",href,name]] atIndex:string.mutableString.length];

                                           [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@")"] atIndex:string.mutableString.length];

                     [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],

                             NSLinkAttributeName:[NSURL URLWithString:@"http://www.baidu.com"],
                              NSUnderlineStyleAttributeName:@(2)
                     } range:NSMakeRange(0, string.mutableString.length)];

                 }break;
                 case ZHMarkDownItemTYpeCode:


                 {
                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"`"] atIndex:0];

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"`"] atIndex:string.mutableString.length];

                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.161 green:0.573 blue:0.408 alpha:1],
                              NSBackgroundColorAttributeName:[UIColor colorWithRed:0.878 green:0.918 blue:0.898 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length)];
                 }
                     break;

                 case ZHMarkDownItemTYpeImg:{

                     NSString *alt=markDownItem.attributeDict[@"alt"]?[NSString stringWithFormat:@"%@",markDownItem.attributeDict[@"alt"]]:@"";

                      NSString *name=markDownItem.attributeDict[@"title"]?[NSString stringWithFormat:@" \"%@\"",markDownItem.attributeDict[@"title"]]:@"";

                     NSString *href=markDownItem.attributeDict[@"src"]?[NSString stringWithFormat:@"\"%@\"",markDownItem.attributeDict[@"src"]]:@"";

                     NSString *string1=[NSString stringWithFormat:@"![%@](%@ %@)",alt,href,name];

                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:string1] atIndex:0];


                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.639 green:0.553 blue:0.584 alpha:1],
                              NSBackgroundColorAttributeName:[UIColor colorWithRed:0.937 green:0.898 blue:0.918 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length)];

                 }break;
                 case ZHMarkDownItemTYpeUl:{

                     [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"] atIndex:markDownItem.content.length];



                 }break;
                 case ZHMarkDownItemTYpeLi:{

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"* "] atIndex:0];
                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"] atIndex:markDownItem.content.length+2];



                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.396 green:0.396 blue:0.396 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length-1)];

                 }break;
                 case ZHMarkDownItemTYpeBlockQuote:{

                      [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@">"] atIndex:0];

                      [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.0196 green:0.612 blue:0.78 alpha:1],
                              NSBackgroundColorAttributeName:[UIColor colorWithRed:0.878 green:0.918 blue:0.898 alpha:1]
                     } range:NSMakeRange(0, string.mutableString.length)];

                 }break;
                 case ZHMarkDownItemTYpeH1:{
                     [self setString:string WithInserString:@"#"];
                 }break;
                 case ZHMarkDownItemTYpeH2:{
                     [self setString:string WithInserString:@"##"];
                 }break;
                 case ZHMarkDownItemTYpeH3:{
                   [self setString:string WithInserString:@"###"];
                 }break;
                 case ZHMarkDownItemTYpeH4:{
                     [self setString:string WithInserString:@"####"];
                 }break;
                 case ZHMarkDownItemTYpeH5:{
                    [self setString:string WithInserString:@"#####"];
                 }break;
                 case ZHMarkDownItemTYpeH6:{
                     [self setString:string WithInserString:@"######"];
                 }break;
        case ZHMarkDownItemTYpeBr:{

            [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"\n"] atIndex:0];
            if (markDownItem.content.length>0){

                         [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.396 green:0.396 blue:0.396 alpha:1]
    } range:NSMakeRange(0, markDownItem.content.length)];

                     }



        }break;
    };

    return string;

}
-(void)setString:(NSMutableAttributedString *)string  WithInserString:(NSString *)inserString{

    [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:inserString] atIndex:0];
    [string addAttributes:@{
                             NSFontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE],
                              NSForegroundColorAttributeName:[UIColor colorWithRed:0.0196 green:0.612 blue:0.78 alpha:1]
    } range:NSMakeRange(0, string.mutableString.length)];

}
#pragma mark UITextViewDelegate
- (void)textViewDidChange:(UITextView *)textView{

//    ZHMarkDownManger *manger= [[ZHMarkDownManger alloc] initParseMarkDown:self.text];
//
//    __weak typeof(self) safeSelf = self;
//
//    [manger parse:^(NSArray *markDownItemArray) {
//
//        [safeSelf markDownItmes:markDownItemArray];
//
//    }];
//
}

@end

