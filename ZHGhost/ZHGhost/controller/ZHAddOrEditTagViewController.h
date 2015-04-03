//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHBaseViewController.h"

@class ZHGTagsResponseTags;


@interface ZHAddOrEditTagViewController : ZHBaseViewController <UITableViewDelegate, UITableViewDataSource, UITextViewDelegate,UIActionSheetDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong, readonly)UITableView *tagInfoTableView;

-(void)setEditTagInfo:(ZHGTagsResponseTags *)tags;

@end

static NSUInteger ZHRowIndex(NSIndexPath *indexPath);

static void ZHALertViewShow(NSString *message);

static NSString * ZHErrorMessage(NSError *error,NSString *errorMessage);