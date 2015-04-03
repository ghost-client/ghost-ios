//
// Created by hangzhang on 15/3/29.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZHMarkDownTextViewInputAccessoryView;


@interface ZHMarkDownTextView : UITextView <UITextViewDelegate>


@property (nonatomic, strong)NSAttributedString *attributedString;

@property (nonatomic, strong, readonly)ZHMarkDownTextViewInputAccessoryView *accessoryView;


-(instancetype)initWithFrame:(CGRect)frame;

-(void)markDownItmes:(NSArray *)items;




@end

