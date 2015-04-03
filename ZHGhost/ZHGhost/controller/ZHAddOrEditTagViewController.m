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
#import "UIButton+AFNetworking.h"
#import "ZHCreatTagsResponseBaseClass.h"
#import "StyleKitName.h"


@implementation ZHAddOrEditTagViewController {

    UITableView *_tagInfoTableView;//展示TAG详情

    NSArray *rowHeightArray;
    
    
    BOOL _isEdit;
    ZHGTagsResponseTags *_tagsInfo;


    UIImage *_tagBackgroundImage;//如果存在就代表更换了图片

}

- (void)viewDidLoad {

    self.isHaveNotTap= YES;

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    [self.navgationView.rightButton setBackgroundImage:[StyleKitName addTagRightButton] forState:UIControlStateNormal];

    [self.navgationView.rightButton addTarget:self action:@selector(doneButtonClick) forControlEvents:UIControlEventTouchUpInside];


    rowHeightArray=@[@(ZHTITLE_IMAGE_VIEW_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZHTITLE_TEXTVIEW_CELL_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZHTITLE_TEXTVIEW_CELL_HEIGHT+10)];

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


        [self HUDShow:@"正在更新信息"];

        if (_tagBackgroundImage){

            [[ZHGhostManger manger] uploadImage:UIImagePNGRepresentation(_tagBackgroundImage) success:^(NSString *url) {

                [safeSelf uploadImageSuccess:url];

            } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {


                [safeSelf HUDHide:ZHErrorMessage(error, errorMessage) afterDealy:2];

            }];


        } else{

            [self subEditTag];

        }



    } else{

        [self HUDShow:@"正在提交信息"];

        ZHCreatTagsSubmitBaseClass *submitBaseClass= [[ZHCreatTagsSubmitBaseClass alloc] init];

        submitBaseClass.name=_tagsInfo.name;
        submitBaseClass.internalBaseClassDescription=_tagsInfo.internalBaseClassDescription;
        submitBaseClass.slug=_tagsInfo.slug;
        submitBaseClass.metaTitle=_tagsInfo.metaTitle;
        submitBaseClass.metaDescription=_tagsInfo.metaDescription;
        submitBaseClass.hidden=_tagsInfo.hidden;

        if (_tagBackgroundImage){

            [[ZHGhostManger manger] uploadImage:UIImagePNGRepresentation(_tagBackgroundImage) success:^(NSString *url) {

                [safeSelf uploadNewTagImageSuccess:submitBaseClass url:url];

            } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {


                [safeSelf HUDHide:ZHErrorMessage(error, errorMessage) afterDealy:2];

            }];

        } else{

            [self subNewTagSubmitBaseClass:submitBaseClass];

        }



    }


}

- (void)uploadNewTagImageSuccess:(ZHCreatTagsSubmitBaseClass *)submitBaseClass url:(NSString *)url {
    submitBaseClass.image=url;

    [self subNewTagSubmitBaseClass:submitBaseClass];
}

- (void)subNewTagSubmitBaseClass:(ZHCreatTagsSubmitBaseClass *)submitBaseClass {



    __weak typeof(self) safeSelf = self;

    [[ZHGhostManger manger] creatTags:@[submitBaseClass] success:^(ZHCreatTagsResponseBaseClass *response) {


        [safeSelf HUDHide:@"提交成功" afterDealy:.3];

        [safeSelf.navigationController popViewControllerAnimated:YES];


        } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

             if (errorMessage== nil){

            errorMessage=error.userInfo[NSLocalizedDescriptionKey];

        }

        [safeSelf HUDHide:errorMessage afterDealy:2];

        }];
}

- (void)uploadImageSuccess:(NSString *)url {
    _tagsInfo.image=url;

    [self subEditTag];
}

- (void)subEditTag {

    __weak typeof(self) safeSelf = self;

    [[ZHGhostManger manger] editTag:_tagsInfo success:^(ZHGTagsResponseTags *tags) {

        [safeSelf HUDHide:@"更新成功" afterDealy:.3];

        [safeSelf.navigationController popViewControllerAnimated:YES];


    }  failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (errorMessage == nil) {

            errorMessage = error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];

    }];
}

- (UITableView *)tagInfoTableView {

    if (_tagInfoTableView== nil){
        _tagInfoTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStylePlain];
        _tagInfoTableView.delegate=self;
        _tagInfoTableView.dataSource=self;

        _tagInfoTableView.backgroundColor= HOME_BG_COLOR;
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

       [cell.zhImageButton addTarget:self action:@selector(takeTagImageClick) forControlEvents:UIControlEventTouchUpInside];


       if (_tagBackgroundImage){
           [cell.zhImageButton setBackgroundImage:_tagBackgroundImage forState:UIControlStateNormal];
       } else if (_tagsInfo.image){
           [cell.zhImageButton setBackgroundImageForState:cell.zhImageButton.state withURL:[NSURL URLWithString:_tagsInfo.image]];

       }

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

       cell.zhInputFiled.tag=indexPath.row;
       cell.zhInputFiled.delegate=self;

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

       cell.zhTextView.tag=indexPath.row;
       cell.zhTextView.delegate=self;

       return cell;
   }

    return nil;
}

/**
* 选择图片
*/
- (void)takeTagImageClick {

    UIActionSheet *actionSheet= [[UIActionSheet alloc] initWithTitle:@"选择图片方式" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"相机" otherButtonTitles:@"相册", nil];
    [actionSheet showInView:self.view];


}

#pragma mark UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{

    switch (buttonIndex){

        case 0:{

            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){

                UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
                imagePickerController.sourceType=UIImagePickerControllerSourceTypeCamera;
                imagePickerController.delegate=self;
                [self presentViewController:imagePickerController animated:YES completion:nil];

            } else{

                ZHALertViewShow(@"打不开相机");
            }

            break;
        }
        case 1:{
            if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){

                UIImagePickerController *imagePickerController= [[UIImagePickerController alloc] init];
                imagePickerController.sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
                imagePickerController.delegate=self;
                [self presentViewController:imagePickerController animated:YES completion:nil];

            } else{

                ZHALertViewShow(@"打不开相册");
            }

            break;
        }

        default:break;
    }

}
#pragma mark UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{





    UIImage *image=info[UIImagePickerControllerOriginalImage];

    _tagBackgroundImage=image;

    [self.tagInfoTableView reloadData];

    [picker dismissViewControllerAnimated:NO completion:nil];




}

- (void)reloadTableView {
    [self.tagInfoTableView reloadData];
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
#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSParameterAssert(rowHeightArray.count>indexPath.row);

    return [rowHeightArray[indexPath.row] floatValue];

}


#pragma mark UITextFiledDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField{


    switch (textField.tag){

        case 1:{

            _tagsInfo.name=textField.text;

            break;
        }
        case 2:{
            _tagsInfo.slug=textField.text;
        }
        case 4:{
            _tagsInfo.metaTitle=textField.text;
        }

        default:break;
    }


}
#pragma mark UITextViewDelegate
- (void)textViewDidEndEditing:(UITextView *)textView{

    switch (textView.tag){

        case 3:{
            _tagsInfo.internalBaseClassDescription=textView.text;
            break;
        }
        case 5:{
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

void ZHALertViewShow(NSString *message) {

    UIAlertView * alertView= [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];

}

NSString * ZHErrorMessage(NSError *error, NSString *errorMessage) {

    if (!errorMessage){

        errorMessage=error.userInfo[NSLocalizedDescriptionKey];
    }

    return errorMessage;

}
