//
// Created by hangzhang on 15/3/27.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import <JSONKit/JSONKit.h>
#import "ZHSettingViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHTitleImageView.h"
#import "ZHTitleInputCell.h"
#import "ZHTitleTextViewCell.h"
#import "ZHGhostManger.h"
#import "ZHAddOrEditTagViewController.h"
#import "ZHGSettingResponseBaseClass.h"
#import "ZHGSettingResponseSettings.h"
#import "UIButton+AFNetworking.h"
#import "StyleKitName.h"


#define BLOG_TITLE @"title"

#define BLOG_DESCRIPTION @"description"

#define BLOG_EMAIL @"email"

#define BLOG_LOGO @"logo"

#define BLOG_COVER @"cover"

#define BLOG_POSTPAGESIZE @"postsPerPage"

#define BLOG_THEME @"activeTheme"

#define BLOG_THEMES @"availableThemes"

@implementation ZHSettingViewController {

    NSArray *rowHeightArray;
    ZHGSettingResponseBaseClass *_settingInfo;
    NSString *_blogTitle;
    NSString *_blogDescription;
    NSString *_blogEmail;
    NSString *_blogLogo;
    NSString *_blogCover;
    NSString *_blogPostPageSize;
    NSString *_blogTheme;
    NSArray *_blogThemes;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.isShowNavgationView= YES;
    self.navgationView.titleLabel.text=@"博客设置";
    rowHeightArray=@[@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZHTITLE_TEXTVIEW_CELL_HEIGHT),@(ZHTITLE_IMAGE_VIEW_HEIGHT),@(ZHTITLE_IMAGE_VIEW_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT),@(ZH_TITLE_INPUT_CELL_HEIGHT)];

    [self.view addSubview:self.settingInfoTableView];

    [self.navgationView.rightButton setBackgroundImage:[StyleKitName addTagRightButton] forState:UIControlStateNormal];

    [self requestSetting];


}
-(void)requestSetting{
    [self HUDShow:@"正在获取配置信息"];
    __weak typeof(self) safeSelf = self;

    [[ZHGhostManger manger] requestSettingSuccess:^(ZHGSettingResponseBaseClass *response) {

        [safeSelf HUDHide:@"获取成功" afterDealy:.3];

        [safeSelf reloadSettingTableView:response];


    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (!errorMessage){
            errorMessage=error.userInfo[NSLocalizedDescriptionKey];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];


    }];
}

- (void)reloadSettingTableView:(ZHGSettingResponseBaseClass *)response {
    _settingInfo=response;

    if (response.settings.count){
        for (int i = 0; i < response.settings.count; ++i) {
             ZHGSettingResponseSettings *settingResponseSettings=response.settings[i];
             if ([settingResponseSettings.key isEqualToString:BLOG_TITLE]){
                 
                 _blogTitle=settingResponseSettings.value;

             } else if ([settingResponseSettings.key isEqualToString:BLOG_DESCRIPTION]){
                 _blogDescription=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_DESCRIPTION]){
                 _blogDescription=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_EMAIL]){
                 _blogEmail=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_LOGO]){
                 _blogLogo=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_COVER]){
                 _blogCover=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_POSTPAGESIZE]){
                 _blogPostPageSize=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_THEME]){
                 _blogTheme=settingResponseSettings.value;
             }else if ([settingResponseSettings.key isEqualToString:BLOG_THEMES]){
                 _blogThemes= (id) settingResponseSettings.value;
             }
        }
    }

    [self.settingInfoTableView reloadData];
}

- (UITableView *)settingInfoTableView {

    if (_settingInfoTableView== nil){
        _settingInfoTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStylePlain];
        _settingInfoTableView.delegate=self;
        _settingInfoTableView.dataSource=self;

        _settingInfoTableView.backgroundColor=[UIColor colorWithRed:0.988 green:0.988 blue:0.988 alpha:1];
        _settingInfoTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }



    return _settingInfoTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return rowHeightArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row==2 || indexPath.row==3){

       ZHTitleImageView *cell= [[ZHTitleImageView alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        NSString *title=@"";
      switch (indexPath.row){
          case 2:{

              title=@"博客LOGO";
              if (_blogLogo){
                  [cell.zhImageButton setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:_blogLogo]];
              }
              break;
          }
          case 3:{
              title=@"博客封面";

              if (_blogCover){
                  [cell.zhImageButton setBackgroundImageForState:UIControlStateNormal withURL:[NSURL URLWithString:_blogCover]];
              }
              break;
          }

          default:break;
      }

        cell.zhTitlelabel.text=title;
       [cell.zhImageButton addTarget:self action:@selector(takeTagImageClick) forControlEvents:UIControlEventTouchUpInside];


       return cell;

   } else if (indexPath.row==0 || indexPath.row==4 || indexPath.row==5 || indexPath.row==6){
       ZHTitleInputCell *cell= [[ZHTitleInputCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        NSString * titleText=@"";

        NSString *titileValue=@"";
       switch (indexPath.row){

           case 0:{
               titleText=@"博客名称";
               titileValue=_blogTitle;
               break;
           }
           case 4:{


                titleText=@"邮箱地址";
               titileValue=_blogEmail;

               break;
           }
           case 5:{

               titleText=@"博文一页显示条数";
               titileValue=_blogPostPageSize;

               break;
           }
           case 6:{
               titleText=@"主题设置";

               titileValue=_blogTheme;
           }




           default:break;
       }
        cell.zhTitleLabel.text=titleText;
       cell.zhInputFiled.tag=indexPath.row;
       cell.zhInputFiled.delegate=self;
        cell.zhInputFiled.text=titileValue;

       return cell;
   } else if (indexPath.row==1){
       ZHTitleTextViewCell *cell= [[ZHTitleTextViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];

        NSString *titileValue=@"";
       switch (indexPath.row){



           case 1:{
               cell.zhTitleLable.text=@"博客简介";
               titileValue=_blogDescription;



               break;

           }

           default:break;
       }

       cell.zhTextView.tag=indexPath.row;
       cell.zhTextView.delegate=self;
        cell.zhTextView.text=titileValue;

       return cell;
   }

    return nil;
}
#pragma UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

   if (rowHeightArray.count>indexPath.row){
       if (indexPath.row==rowHeightArray.count-1){
           return [rowHeightArray[indexPath.row] integerValue]+10;
       }
       return [rowHeightArray[indexPath.row] integerValue];
   }
    return 44;
}
- (void)takeTagImageClick {

}

@end