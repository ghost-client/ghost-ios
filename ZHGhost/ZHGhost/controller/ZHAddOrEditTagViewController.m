//
// Created by hangzhang on 15/3/23.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHAddOrEditTagViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHTitleInputCell.h"
#import "ZHTitleTextViewCell.h"
#import "ZHTitleSwithCell.h"
#import "ZHGTagsResponseTags.h"
#import "ZHGhostManger.h"
#import "ZHCreatTagsSubmitBaseClass.h"
#import "ZHTitleImageView.h"


@implementation ZHAddOrEditTagViewController {

    UITableView *_tagInfoTableView;//展示TAG详情

    NSArray *rowHeightArray;
    
    
    BOOL _isEdit;
    ZHGTagsResponseTags *_tagsInfo;
}

- (void)viewDidLoad {

    self.isHaveNotTap= YES;

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    [self.navgationView.rightButton setTitle:@"完成" forState:UIControlStateNormal];

    [self.navgationView.rightButton addTarget:self action:@selector(doneButtonClick) forControlEvents:UIControlEventTouchUpInside];


    rowHeightArray=@[@(ZHTITLE_IMAGE_VIEW_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZHTITLE_TEXTVIEW_CELL_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZHTITLE_TEXTVIEW_CELL_HEIGHT)];

    [self.view addSubview:self.tagInfoTableView];


    NSString *title=@"新增Tag";

    if (_isEdit){
        title=@"修改Tag";
    }

    self.navgationView.titleLabel.text=title;

    if (_tagsInfo== nil){

        _tagsInfo= [[ZHGTagsResponseTags alloc] init];

    }




}

- (void)doneButtonClick {

    [self dismissCurreentKeyBoard];
    __weak typeof(self) safeSelf = self;

    if(_isEdit){


        [[ZHGhostManger manger] editTag:_tagsInfo success:^(ZHGTagsResponseTags *tags) {

            [self.navigationController popViewControllerAnimated:YES];


        } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

            if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf showMessage:errorMessage];

        }];

    } else{

        ZHCreatTagsSubmitBaseClass *submitBaseClass= [[ZHCreatTagsSubmitBaseClass alloc] init];

        submitBaseClass.name=_tagsInfo.name;
        submitBaseClass.internalBaseClassDescription=_tagsInfo.internalBaseClassDescription;
        submitBaseClass.slug=_tagsInfo.slug;
        submitBaseClass.metaTitle=_tagsInfo.metaTitle;
        submitBaseClass.metaDescription=_tagsInfo.metaDescription;
        submitBaseClass.hidden=_tagsInfo.hidden;


        [[ZHGhostManger manger] creatTags:@[submitBaseClass] success:^(ZHCreatTagsResponseBaseClass *response) {

            [self.navigationController popViewControllerAnimated:YES];


        } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

             if (errorMessage== nil){

            errorMessage=error.userInfo[NSLocalizedDescriptionKey];

        }

        [safeSelf showMessage:errorMessage];

        }];

    }


}

- (UITableView *)tagInfoTableView {

    if (_tagInfoTableView== nil){
        _tagInfoTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStylePlain];
        _tagInfoTableView.delegate=self;
        _tagInfoTableView.dataSource=self;

        _tagInfoTableView.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
        _tagInfoTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }



    return _tagInfoTableView;
}

- (void)setEditTagInfo:(ZHGTagsResponseTags *)tags {

    _isEdit= YES;
    
    _tagsInfo=tags;

    [self.tagInfoTableView reloadData];

}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {


    return rowHeightArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

   if (indexPath.row==0){

       ZHTitleImageView *cell= [[ZHTitleImageView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

       cell.zhTitlelabel.text=@"标签的背景图片";

       return cell;

   } else if (indexPath.row==1 || indexPath.row==2 || indexPath.row==4){
       ZHTitleInputCell *cell= [[ZHTitleInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

       switch (indexPath.row){

           case 1:{
               cell.zhTitleLabel.text=@"标签名";
               [self setZHTextFiledText:_tagsInfo.name textFiled:cell.zhInputFiled];
               break;
           }
           case 2:{
               cell.zhTitleLabel.text=@"URL";
               [self setZHTextFiledText:_tagsInfo.slug textFiled:cell.zhInputFiled];

               break;
           }
           case 4:{
               cell.zhTitleLabel.text=@"SEO标题";
               [self setZHTextFiledText:_tagsInfo.metaTitle textFiled:cell.zhInputFiled];

               break;
           }

           default:break;
       }

       return cell;
   } else if (indexPath.row==3 || indexPath.row==5){
       ZHTitleTextViewCell *cell= [[ZHTitleTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
       switch (indexPath.row){

           case 3:{
               cell.zhTitleLable.text=@"描述";

               [self setZHTextViewText:_tagsInfo.internalBaseClassDescription TextView:cell.zhTextView];

               break;

           }
           case 5:{
               cell.zhTitleLable.text=@"SEO描述";
               [self setZHTextViewText:_tagsInfo.metaDescription TextView:cell.zhTextView];

           }
           default:break;
       }

       return cell;
   }

    return nil;
}
-(void)setZHTextFiledText:(NSString *)name textFiled:(UITextField *)textFiled{
    if (name.length>0){

        textFiled.text=name;
    }
}
-(void)setZHTextViewText:(NSString *)name TextView:(UITextView *)textView{
    if (name.length>0){
        textView.text=name;
    }
}
- (void)switchOnClick:(UISwitch *)switchOnClick {

    [self dismissCurreentKeyBoard];

    _tagsInfo.hidden=switchOnClick.isOn;

}
#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSParameterAssert(rowHeightArray.count>indexPath.row);

    return [rowHeightArray[indexPath.row] floatValue];

}


#pragma mark UITextFiledDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField{


    switch (textField.tag){

        case 0:{

            _tagsInfo.name=textField.text;

            break;
        }
        case 1:{
            _tagsInfo.slug=textField.text;
        }
        case 10:{
            _tagsInfo.metaTitle=textField.text;
        }

        default:break;
    }


}
#pragma mark UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{

    switch (textView.tag){

        case 2:{
            _tagsInfo.internalBaseClassDescription=textView.text;
            break;
        }
        case 11:{
            _tagsInfo.metaDescription=textView.text;
            break;
        }


        default:break;
    }

}



@end

NSUInteger ZHRowIndex(NSIndexPath *indexPath) {


    return (NSUInteger) [[NSString stringWithFormat:@"%d%d",indexPath.section,indexPath.row] integerValue];
}
