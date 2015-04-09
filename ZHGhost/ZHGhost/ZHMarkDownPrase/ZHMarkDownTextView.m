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

@implementation ZHMarkDownTextView {

    NSMutableArray *_customViewArray;

    NSArray *_markDownItems;


    NSMutableArray *_markDownCashArray;

    ZHMarkDownTextViewInputAccessoryView *_accessoryView;
    ZHMarkDownToolView *_markDownToolView;
    NSMutableAttributedString *textViewMutableAttributedString;
}
- (void)setAttributedString:(NSAttributedString *)attributedString {
    _attributedString = attributedString;

    self.attributedText = _attributedString;
}

- (ZHMarkDownTextViewInputAccessoryView *)accessoryView {
    if (_accessoryView == nil) {

        _accessoryView = [[ZHMarkDownTextViewInputAccessoryView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) titles:@[@"MD键盘", @"高级编辑", @"格式化", @"隐藏"]];

    }
    return _accessoryView;
}

- (ZHMarkDownToolView *)markDownToolView {

    if (_markDownToolView == nil) {

        _markDownToolView = [[ZHMarkDownToolView alloc] initWithFrame:CGRectMake(0, ZHFrameHeight(self) - 44 * 5, SCREEN_WIDTH, 44 * 5)];

    }


    return _markDownToolView;
}

- (instancetype)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {

        self.backgroundColor = [UIColor colorWithRed:0.953 green:0.953 blue:0.953 alpha:1];

        _markDownCashArray = [NSMutableArray array];


        self.inputAccessoryView = self.accessoryView;


        __weak typeof(self) safeSelf = self;

        [self.markDownToolView setMarkDownTypeComplete:^(MarkDownToolType type) {

            [safeSelf didEnterMarkDownBoardKey:type];


        }];


        [self.accessoryView setMarkDownTextViewAccessoryButtonComplete:^(ZHMarkDownTextViewInputAccessoryViewButtonType type) {

            [safeSelf didEnterMarkDownToolButton:type];


        }];


        self.delegate = self;


        textViewMutableAttributedString = [[NSMutableAttributedString alloc] initWithString:@""];


        [self becomeFirstResponder];
    }

    return self;
}

- (void)didEnterMarkDownToolButton:(ZHMarkDownTextViewInputAccessoryViewButtonType)type {


    switch (type) {

        case ZHMarkDownTextViewInputAccessoryViewButtonTypeMarkDown: {

            self.inputAccessoryView = nil;

            self.inputView = self.markDownToolView;


            [self reloadInputViews];


        }
            break;
        case ZHMarkDownTextViewInputAccessoryViewButtonTypeFormat:{


            ZHMarkDownManger * markDownManger= [[ZHMarkDownManger alloc] initParseMarkDown:self.text];

            __weak typeof(self) safeSelf = self;


            [markDownManger parse:^(NSArray *markDownItemArray) {


                [safeSelf markDownItmes:markDownItemArray];


            }];


        }
            break;
        case ZHMarkDownTextViewInputAccessoryViewButtonTypeExpert:{



        }
            break;
        case ZHMarkDownTextViewInputAccessoryViewButtonTypeDismiss:{

            [self resignFirstResponder];

        }
            break;
    };
}

- (void)didEnterMarkDownBoardKey:(MarkDownToolType)type {


    NSRange textRange = self.selectedRange;

    switch (type) {


        case MarkDownToolTypeH1: {


            [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n#"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 1)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];

            [self reloadInputView];

        }
            break;
        case MarkDownToolTypeH2: {

             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n##"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 2)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];

        }
            break;
        case MarkDownToolTypeH3: {
             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n###"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 3)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];


            [self reloadInputView];
        }
            break;
        case MarkDownToolTypeH4: {
             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n####"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 4)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];

        }
            break;
        case MarkDownToolTypeH5: {
             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n#####"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 5)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];

        }
            break;
        case MarkDownToolTypeH6: {

             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n######"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 6)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];

        }
            break;
        case MarkDownToolTypeStrong: {




             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n****"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 4)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownStrongColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];





            self.selectedRange= NSMakeRange(self.selectedRange.location-2, 0);


        }
            break;
        case MarkDownToolTypeEm: {




             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n**"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 2)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownEmColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];


            self.selectedRange= NSMakeRange(self.selectedRange.location-1, 0);

        }
            break;
        case MarkDownToolTypeDel: {



             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:@"\n\n~~~~"] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, 4)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownDelColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];


            self.selectedRange= NSMakeRange(self.selectedRange.location-2, 0);

        }
            break;
        case MarkDownToolTypeA: {

            NSString *string=@"\n\n[](\"\" \"\")";


             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:string] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, string.length-2)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:nil
                   linkAttributeName:[NSURL URLWithString:@"http://"]
         underlineStyleAttributeName:@(2)
        backgroundColorAttributeName:nil];
            [self reloadInputView];


            self.selectedRange= NSMakeRange(self.selectedRange.location-string.length+3, 0);


        }
            break;
        case MarkDownToolTypeImg: {

             NSString *string=@"\n\n![](\"\" \"\")";



             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:string] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, string.length-2)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownImgForeColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:MarkDownImgBackColor];
            [self reloadInputView];


            self.selectedRange= NSMakeRange(self.selectedRange.location-string.length+4, 0);

        }
            break;
        case MarkDownToolTypeList: {

             NSString *string=@"\n\n* ";




             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:string] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, string.length-2)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownLiForeColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];



        }
            break;
        case MarkDownToolTypeLigith: {

            NSString *string=@"====";



             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:string] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location, string.length)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
            [self reloadInputView];


        }
            break;
        case MarkDownToolTypeCode: {


            NSString *string=@"\n\n``";




             [textViewMutableAttributedString insertAttributedString:[self AttributedStringWithString:string] atIndex:textRange.location];


            [self stringAddTrributes:NSMakeRange(textRange.location + 2, string.length-2)
                              string:textViewMutableAttributedString
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownCodeForeColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:MarkDownCodeBackgroundColor];
            [self reloadInputView];


            self.selectedRange= NSMakeRange(self.selectedRange.location-string.length+3, 0);

        }
            break;
        case MarkDownToolTypeComplete: {

            [self reloadInputView];


        }
            break;
    };



}

- (void)reloadInputView {
    self.attributedString = textViewMutableAttributedString;

    self.inputView = nil;

    self.inputAccessoryView = self.accessoryView;

    [self reloadInputViews];
}

- (void)markDownButtonClick {

    [self dismissButtonClick];

    if (_markDownToolView == nil) {
        _markDownToolView = [[ZHMarkDownToolView alloc] initWithFrame:CGRectMake(0, 0, 44, 44 * 8)];

        _markDownToolView.frame = CGRectMake(-44, (ZHFrameHeight(self) - ZHFrameHeight(_markDownToolView)) / 2, ZHFrameWidth(_markDownToolView), ZHFrameHeight(_markDownToolView));


    }

    [self addSubview:_markDownToolView];

    [UIView animateWithDuration:.3 animations:^{

        _markDownToolView.frame = CGRectMake(0, ZHFrameY(_markDownToolView), ZHFrameWidth(_markDownToolView), ZHFrameHeight(_markDownToolView));

    }];

    [_markDownToolView setMarkDownTypeComplete:^(MarkDownToolType type) {

        NSLog(@"%d", type);


    }];


}

- (void)dismissButtonClick {

    [self resignFirstResponder];


}

- (void)markDownItmes:(NSArray *)items {


    NSMutableArray *stringArray = [NSMutableArray array];

    _markDownItems = items;

    if (_markDownItems.count > 0) {

        for (int i = 0; i < _markDownItems.count; ++i) {
            ZHMarkDownItem *markDownItem = _markDownItems[i];

            if (markDownItem) {

                [_markDownCashArray addObject:markDownItem];

                while (markDownItem.markDownItem) {

                    [_markDownCashArray addObject:markDownItem.markDownItem];

                    markDownItem = markDownItem.markDownItem;

                    continue;

                }
            }

            NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@""];

            NSParameterAssert(_markDownCashArray.count > 0);

            ZHMarkDownItem *markDownItem1 = _markDownCashArray[0];
            if (markDownItem1.markDownItemTYpe != ZHMarkDownItemTYpeP) {

                ZHMarkDownItem *markDownItem2 = [[ZHMarkDownItem alloc] initWithKey:@"p"];

                [_markDownCashArray insertObject:markDownItem2 atIndex:0];
            }

            for (int j = _markDownCashArray.count - 1; j >= 0; j--) {

                string = [self stringFromMarkDownItem:_markDownCashArray[j] string:string];

            }

            [stringArray addObject:string];

            [_markDownCashArray removeAllObjects];


        }

    }


    for (NSMutableAttributedString *mutableAttributedString in stringArray) {


        [textViewMutableAttributedString appendAttributedString:mutableAttributedString];

    }

    self.attributedString = textViewMutableAttributedString;


}


- (NSMutableAttributedString *)stringFromMarkDownItem:(ZHMarkDownItem *)markDownItem string:(NSMutableAttributedString *)string {


    if (markDownItem.content) {

        [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:markDownItem.content] atIndex:0];

    }

    switch (markDownItem.markDownItemTYpe) {

        case ZHMarkDownItemTYpeNone: {


        }
            break;


        case ZHMarkDownItemTYpeP: {

            [string insertAttributedString:[self AttributedStringWithString:@"\n\n"] atIndex:string.mutableString.length];

            if (markDownItem.content.length > 0) {

                [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownHColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];

            }

        }

            break;
        case ZHMarkDownItemTYpeStrong: {

            [string insertAttributedString:[self AttributedStringWithString:@"**"] atIndex:0];

            [string insertAttributedString:[self AttributedStringWithString:@"**"] atIndex:string.mutableString.length];


            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownStrongColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];


        }
            break;
        case ZHMarkDownItemTYpeEm: {


            [string insertAttributedString:[self AttributedStringWithString:@"*"] atIndex:0];

            [string insertAttributedString:[self AttributedStringWithString:@"*"] atIndex:string.mutableString.length];


            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownEmColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];


        }
            break;
        case ZHMarkDownItemTYpeDel: {
            [string insertAttributedString:[self AttributedStringWithString:@"~~"] atIndex:0];

            [string insertAttributedString:[self AttributedStringWithString:@"~~"] atIndex:string.mutableString.length];

            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownDelColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];
        }
            break;
        case ZHMarkDownItemTYpeA: {

            [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"["] atIndex:0];

            [string insertAttributedString:[[NSMutableAttributedString alloc] initWithString:@"]("] atIndex:string.mutableString.length];

            NSString *name = markDownItem.attributeDict[@"title"] ? [NSString stringWithFormat:@" \"%@\"", markDownItem.attributeDict[@"title"]] : @"";

            NSString *href = markDownItem.attributeDict[@"href"] ? [NSString stringWithFormat:@"\"%@\"", markDownItem.attributeDict[@"href"]] : @"";


            [string insertAttributedString:[self AttributedStringWithString:[NSString stringWithFormat:@"%@%@", href, name]] atIndex:string.mutableString.length];

            [string insertAttributedString:[self AttributedStringWithString:@")"] atIndex:string.mutableString.length];


            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:nil
                   linkAttributeName:[NSURL URLWithString:href]
         underlineStyleAttributeName:@(2)
        backgroundColorAttributeName:nil];

        }
            break;
        case ZHMarkDownItemTYpeCode: {
            [string insertAttributedString:[self AttributedStringWithString:@"`"] atIndex:0];

            [string insertAttributedString:[self AttributedStringWithString:@"`"] atIndex:string.mutableString.length];

            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length) 
                              string:string 
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownCodeForeColor 
            linkAttributeName:nil 
            underlineStyleAttributeName:nil 
            backgroundColorAttributeName:MarkDownCodeBackgroundColor];
        }
            break;

        case ZHMarkDownItemTYpeImg: {

            NSString *alt = markDownItem.attributeDict[@"alt"] ? [NSString stringWithFormat:@"%@", markDownItem.attributeDict[@"alt"]] : @"";

            NSString *name = markDownItem.attributeDict[@"title"] ? [NSString stringWithFormat:@" \"%@\"", markDownItem.attributeDict[@"title"]] : @"";

            NSString *href = markDownItem.attributeDict[@"src"] ? [NSString stringWithFormat:@"\"%@\"", markDownItem.attributeDict[@"src"]] : @"";

            NSString *string1 = [NSString stringWithFormat:@"![%@](%@ %@)", alt, href, name];

            [string insertAttributedString:[self AttributedStringWithString:string1] atIndex:0];


            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownImgForeColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:MarkDownImgBackColor];

        }
            break;
        case ZHMarkDownItemTYpeUl: {

            [string insertAttributedString:[self AttributedStringWithString:@"\n"] atIndex:markDownItem.content.length];


        }
            break;
        case ZHMarkDownItemTYpeLi: {

            [string insertAttributedString:[self AttributedStringWithString:@"* "] atIndex:0];
            [string insertAttributedString:[self AttributedStringWithString:@"\n"] atIndex:markDownItem.content.length + 2];


            
            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length - 1)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownLiForeColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:nil];

        }
            break;
        case ZHMarkDownItemTYpeBlockQuote: {

            [string insertAttributedString:[self AttributedStringWithString:@">"] atIndex:0];

            [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                              string:string
                   fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
        foregroundColorAttributeName:MarkDownBlockQouteForeColor
                   linkAttributeName:nil
         underlineStyleAttributeName:nil
        backgroundColorAttributeName:MarkDownBlockQuoteBackgroundColor];

        }
            break;
        case ZHMarkDownItemTYpeH1: {
            [self setString:string WithInserString:@"#"];
        }
            break;
        case ZHMarkDownItemTYpeH2: {
            [self setString:string WithInserString:@"##"];
        }
            break;
        case ZHMarkDownItemTYpeH3: {
            [self setString:string WithInserString:@"###"];
        }
            break;
        case ZHMarkDownItemTYpeH4: {
            [self setString:string WithInserString:@"####"];
        }
            break;
        case ZHMarkDownItemTYpeH5: {
            [self setString:string WithInserString:@"#####"];
        }
            break;
        case ZHMarkDownItemTYpeH6: {
            [self setString:string WithInserString:@"######"];
        }
            break;
        case ZHMarkDownItemTYpeBr: {

            [string insertAttributedString:[self AttributedStringWithString:@"\n"] atIndex:0];
            if (markDownItem.content.length > 0) {


                [self stringAddTrributes:NSMakeRange(0, markDownItem.content.length)
                                  string:string
                       fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE] 
            foregroundColorAttributeName:MarkDownBrColor
                linkAttributeName:nil
                underlineStyleAttributeName:nil
                backgroundColorAttributeName:nil];

            }


        }
            break;
    };

    return string;

}



- (void)stringAddTrributes:(NSRange )markDownItemRange
                    string:(NSMutableAttributedString *)string
         fontAttributeName:(UIFont *)fontAttributeName
        foregroundColorAttributeName:(UIColor *)foregroundColorAttributeName
       linkAttributeName:(NSURL *)linkAttributeName
underlineStyleAttributeName:(NSNumber *)underlineStyleAttributeName
backgroundColorAttributeName:(UIColor *)backgroundColorAttributeName{


    NSMutableDictionary *dictionary=[NSMutableDictionary dictionary];

    if (fontAttributeName){
        dictionary[NSFontAttributeName]=fontAttributeName;
    }
    if (foregroundColorAttributeName){
        dictionary[NSForegroundColorAttributeName]=foregroundColorAttributeName;
    }
    if (linkAttributeName){
        dictionary[NSLinkAttributeName]=linkAttributeName;
    }
    if (underlineStyleAttributeName){

        dictionary[NSUnderlineStyleAttributeName]=underlineStyleAttributeName;
    }
    if (backgroundColorAttributeName){

        dictionary[NSBackgroundColorAttributeName]=backgroundColorAttributeName;
    }
    [string addAttributes:dictionary range:markDownItemRange];
}

- (void)setString:(NSMutableAttributedString *)string WithInserString:(NSString *)inserString {

    [string insertAttributedString:[self AttributedStringWithString:inserString] atIndex:0];

    [self stringAddTrributes:NSMakeRange(0, string.mutableString.length)
                      string:string
           fontAttributeName:[UIFont boldSystemFontOfSize:DEFINE_MARKDOWN_FONT_SIZE]
foregroundColorAttributeName:MarkDownHColor
           linkAttributeName:nil
 underlineStyleAttributeName:nil
backgroundColorAttributeName:nil];


}

-(NSMutableAttributedString *)AttributedStringWithString:(NSString *)string{


    return [[NSMutableAttributedString alloc] initWithString:string];


}

#pragma mark UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{


    [textViewMutableAttributedString replaceCharactersInRange:range withString:text];

    return YES;

}


@end

