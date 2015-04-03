//
// Created by hangzhang on 15/4/2.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SegmentControllerSelect)(NSUInteger selectIndex);

@interface ZHSegmentController : UIView

-(instancetype)initWithFrame:(CGRect)frame itemTitles:(NSArray *)array;

//@property (nonatomic, strong)UIColor *segmentSelectColor;//默认为黑色
//
//@property (nonatomic, strong)UIColor *segmentNomarColor;//默认为白色

@property (nonatomic, assign)NSUInteger currentSelectIndex;

-(void)setSegmentControllerComplete:(SegmentControllerSelect)cpmlete;

@end