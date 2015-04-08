//
// Created by hangzhang on 15/3/29.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MarkDownStrongColor [UIColor colorWithRed:0.761 green:0.208 blue:0.553 alpha:1]
#define MarkDownEmColor [UIColor colorWithRed:0.341 green:0.612 blue:0.792 alpha:1]
#define MarkDownDelColor [UIColor colorWithRed:0.0392 green:0.541 blue:0.349 alpha:1]
#define MarkDownHColor [UIColor colorWithRed:0.0196 green:0.612 blue:0.78 alpha:1]
#define MarkDownBrColor [UIColor colorWithRed:0.396 green:0.396 blue:0.396 alpha:1]
#define MarkDownBlockQouteForeColor [UIColor colorWithRed:0.0196 green:0.612 blue:0.78 alpha:1]
#define MarkDownBlockQuoteBackgroundColor [UIColor colorWithRed:0.878 green:0.918 blue:0.898 alpha:1]
#define MarkDownLiForeColor [UIColor colorWithRed:0.396 green:0.396 blue:0.396 alpha:1]
#define MarkDownImgForeColor [UIColor colorWithRed:0.639 green:0.553 blue:0.584 alpha:1]
#define MarkDownImgBackColor [UIColor colorWithRed:0.937 green:0.898 blue:0.918 alpha:1]
#define MarkDownCodeForeColor [UIColor colorWithRed:0.161 green:0.573 blue:0.408 alpha:1]
#define MarkDownCodeBackgroundColor [UIColor colorWithRed:0.878 green:0.918 blue:0.898 alpha:1]
@class ZHMarkDownTextViewInputAccessoryView;
@class ZHMarkDownToolView;


@interface ZHMarkDownTextView : UITextView <UITextViewDelegate>


@property (nonatomic, strong)NSAttributedString *attributedString;

@property (nonatomic, strong, readonly)ZHMarkDownTextViewInputAccessoryView *accessoryView;

@property (nonatomic, strong, readonly)ZHMarkDownToolView *markDownToolView;


-(instancetype)initWithFrame:(CGRect)frame;

-(void)markDownItmes:(NSArray *)items;




@end

