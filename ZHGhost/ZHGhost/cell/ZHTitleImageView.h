//
// Created by hangzhang on 15/3/26.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <UIKit/UIKit.h>
#define TAG_CELL_WIDTH 280
#define ZHTITLE_IMAGE_VIEW_HEIGHT 250
//新建标签 选择图片试图
@interface ZHTitleImageView : UITableViewCell
@property (nonatomic, strong, readonly)UILabel *zhTitlelabel;//标题
@property (nonatomic, strong, readonly)UIButton *zhImageButton;//选择图片的按钮
@end