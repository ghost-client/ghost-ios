//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HomeItemView : UIButton

-(instancetype)initWithFrame:(CGRect)frame;

@property (nonatomic, strong,setter=setItemIcon:)UIImage *itemIcon;

@property (nonatomic, strong,setter=setTitle:)NSString *itemTitle;



@end