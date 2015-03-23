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


@implementation ZHAddOrEditTagViewController {

    UITableView *_tagInfoTableView;//展示TAG详情

    NSArray *sectionRows;
    
    
    BOOL _isEdit;
    ZHGTagsResponseTags *_tagsInfo;
}

- (void)viewDidLoad {

    self.isHaveNotTap= YES;

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    [self.navgationView.rightButton setTitle:@"完成" forState:UIControlStateNormal];

    [self.navgationView.rightButton addTarget:self action:@selector(doneButtonClick) forControlEvents:UIControlEventTouchUpInside];


    sectionRows=@[@3,@2,@1];

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
        submitBaseClass.internalBaseClassDescription=_tagsInfo.tagsDescription;
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
        _tagInfoTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStyleGrouped];
        _tagInfoTableView.delegate=self;
        _tagInfoTableView.dataSource=self;

        _tagInfoTableView.backgroundColor=[UIColor clearColor];

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

    NSParameterAssert(sectionRows.count>section);

    return [sectionRows[(NSUInteger) section] integerValue];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSUInteger cellIndex= ZHRowIndex(indexPath);

    NSArray *titleCellIndex=@[@(0),@(1),@(10)];

    if ([titleCellIndex containsObject:@(cellIndex)]){


        ZHTitleInputCell *cell= [[ZHTitleInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        switch (cellIndex){
            case 0:{
                cell.zhTitleLabel.text=@"Tag标题:";

                cell.zhInputFiled.text=_tagsInfo.name;



                break;
            }
            case 1:{
                cell.zhTitleLabel.text=@"URL:";

                cell.zhInputFiled.text=_tagsInfo.slug;
                break;
            }
            case 10:{
                cell.zhTitleLabel.text=@"SEO标题:";

                cell.zhInputFiled.text=_tagsInfo.metaTitle;
                break;

            }

            default:break;
        }

        cell.zhInputFiled.delegate=self;

        cell.zhInputFiled.tag=cellIndex;
        return cell;



    }

    NSArray *textViewArray=@[@(2),@(11)];

    if ([textViewArray containsObject:@(cellIndex)]){

        ZHTitleTextViewCell *cell= [[ZHTitleTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        switch (cellIndex){

            case 2:{
                cell.zhTitleLable.text=@"描述信息:";
                cell.zhTextView.text=_tagsInfo.tagsDescription;
                break;
            }
            case 11:{
                cell.zhTitleLable.text=@"SEO描述:";
                cell.zhTextView.text=_tagsInfo.metaDescription;
                break;
            }

            default:break;
        }
        cell.zhTextView.delegate=self;

        cell.zhTextView.tag=cellIndex;

        return cell;
    }

    if (cellIndex==20){

        ZHTitleSwithCell *cell= [[ZHTitleSwithCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        cell.zhTitleLabel.text=@"是否隐藏:";
        cell.zhSwith.on=_tagsInfo.hidden;
        [cell.zhSwith addTarget:self action:@selector(switchOnClick:) forControlEvents:UIControlEventValueChanged];

        return cell;
    }




    return nil;


}

- (void)switchOnClick:(UISwitch *)switchOnClick {

    [self dismissCurreentKeyBoard];

    _tagsInfo.hidden=switchOnClick.isOn;

}
#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSUInteger cellIndex= ZHRowIndex(indexPath);

    NSArray *textViewArray=@[@(2),@(11)];

    if ([textViewArray containsObject:@(cellIndex)]){

        return ZHTITLE_TEXTVIEW_CELL_HEIGHT;
    }

    return 44.f;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return sectionRows.count;
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
            _tagsInfo.tagsDescription=textView.text;
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
