//
//  ZHBaseHomeViewController.m
//  ZHGhost
//
//  Created by hangzhang on 15/3/18.
//  Copyright (c) 2015年 hangzhang. All rights reserved.
//

#import "ZHBaseHomeViewController.h"
#import "ZHGhostManger.h"
#import "ZHDefine.h"
#import "HomeItemView.h"
#import "ZHFounction.h"
#import "StyleKitName.h"
#import "ZHHomeViewcontroller.h"
#import "ZHLoginViewController.h"
#import "ZHGContentItemResponseBaseClass.h"
#import "ZHTagsController.h"
#import "ZHAddOrEditTagViewController.h"
#import "ZHGUserInfoResponseUsers.h"
#import "ZHGUserInfoResponseBaseClass.h"
#import "ZHAllUserViewController.h"

#define ANMATION_TIME .3

#define ANMATION_LENGHT 150

@interface ZHBaseHomeViewController ()

@property (nonatomic, strong)ZHHomeViewcontroller *homeViewcontroller;

@end

@implementation ZHBaseHomeViewController {
    BOOL _isDismiss;

    ZHGhostManger *_ghostManger;

    NSMutableArray *_contentItems;
    NSMutableArray * _itemViewArray;
}

- (void)viewDidLoad {

    self.isHaveNotTap= YES;
    [super viewDidLoad];

    [self initView];


    [self.homeViewcontroller setHomeNavgationController:self.navigationController];






    // Do any additional setup after loading the view, typically from a nib.
}




- (void)initView {

    _ghostManger=[ZHGhostManger manger];

    _contentItems=[NSMutableArray array];
    UIImage *icon=[StyleKitName homeIcon];
    _itemViewArray =[NSMutableArray array];

    self.isHaveNotTap= YES;

    self.view.backgroundColor=SCREEN_DEFINE_COLOR;


    NSArray *topTitles=@[@"首页",@"标签",@"作者"];

    NSArray *footTitle=@[@"设置",@"未登录"];

    float itemHeight=50.f;

    NSInteger index=0;
    for (int i = 0; i <topTitles.count; ++i) {

        HomeItemView *itemView= [[HomeItemView alloc] initWithFrame:CGRectMake(0, ZHIOS7()+itemHeight*i, SCREEN_WIDTH, itemHeight)];

        [itemView setTitle:topTitles[i]];
        [self.view addSubview:itemView];

        [itemView setItemIcon:icon];

        if (i==1){
            [itemView setItemIcon:[StyleKitName imageOfHomeIconTagsButtonWithFrame:itemView.bounds]];
        } else if (i==2){
            [itemView setItemIcon:[StyleKitName imageOfHomeAutherIconButtonWithFrame:itemView.bounds]];
        }

        itemView.tag=index;

        [itemView addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        index++;

        [_itemViewArray addObject:itemView];

    }

    for (int j = 0; j < footTitle.count; ++j) {

        HomeItemView *itemView= [[HomeItemView alloc] initWithFrame:CGRectMake(0, ZHFrameHeight(self.view)-itemHeight*(footTitle.count-j), SCREEN_WIDTH, itemHeight)];

        [itemView setTitle:footTitle[j]];
        [self.view addSubview:itemView];
        [itemView setItemIcon:icon];
        itemView.tag=index;

        if (j==0){
            [itemView setItemIcon:[StyleKitName homeIconSetting]];
        } else{
            [itemView setItemIcon:[StyleKitName hommIconUser]];
        }
        [itemView addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        index++;

        [_itemViewArray addObject:itemView];



    }

    [self.view addSubview:self.homeViewcontroller.view];

    [self.homeViewcontroller.navgationView.leftButton addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)showView {



    if (_isDismiss){


        __weak typeof(self) safeSelf = self;

        [UIView animateWithDuration:ANMATION_TIME animations:^{


            safeSelf.homeViewcontroller.view.frame= CGRectMake(0, 0, ZHFrameWidth(self.view), ZHFrameHeight(self.view));

        }];


    } else{

        __weak typeof(self) safeSelf = self;

        [UIView animateWithDuration:ANMATION_TIME animations:^{


            safeSelf.homeViewcontroller.view.frame= CGRectMake(ANMATION_LENGHT, 0, ZHFrameWidth(self.view), ZHFrameHeight(self.view));

        }];


    }
    _isDismiss= !_isDismiss;
}

- (void)itemButtonClick:(UIButton *)itemButtonClick {

    [self showView];


    switch (itemButtonClick.tag){

        case 4:{

            [self gotoLoginController];

        }
            break;
        case 1:{

            ZHTagsController *tagsController= [[ZHTagsController alloc] init];

            [self.navigationController pushViewController:tagsController animated:YES];

        }
            break;
        case 2:{
            ZHAllUserViewController *userViewController= [[ZHAllUserViewController alloc] init];
            [self.navigationController pushViewController:userViewController animated:YES];

            break;
        }

        default:break;
    }



}

- (void)gotoLoginController {

    ZHLoginViewController *loginViewController= [[ZHLoginViewController alloc] init];

    __weak typeof(self) safeSelf = self;

    [loginViewController loginSuccess:^(ZHGTokenResponseBaseClass *response) {


        [safeSelf contentItems];


    }];


    [self presentViewController:loginViewController animated:YES completion:^{

    }];
}

-(void)contentItems{


    [self HUDShow:@"正在更新博客列表"];

    __weak typeof(self) safeSelf = self;

    [_ghostManger allPostContentStatus:nil staticPages:nil page:0 include:nil success:^(ZHGContentItemResponseBaseClass *response) {

        [safeSelf reuqestAutherInfo];


        [safeSelf reloadContent:response];


    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];

    }];

}
-(void)reuqestAutherInfo{

    __weak typeof(self) safeSelf = self;


    [_ghostManger userInfoSuccess:^(ZHGUserInfoResponseBaseClass *response) {

        [safeSelf didRequestUserInfo:response];

        [safeSelf HUDHide:@"获取成功" afterDealy:.3];


    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];


    }];


}

- (void)didRequestUserInfo:(ZHGUserInfoResponseBaseClass *)response {
    for(ZHGUserInfoResponseUsers *users in response.users ){

            if ([users.email isEqualToString:_ghostManger.currentLoginUserName]){
                _ghostManger.currentUser=users;

                NSParameterAssert(_itemViewArray.count>4);

                HomeItemView *itemView=_itemViewArray[4];

                [itemView setTitle:users.name];
            }
        }
}

- (void)setHomeNavgationController:(UINavigationController *)navigationController {

    [self.homeViewcontroller setHomeNavgationController:navigationController];

}


- (void)reloadContent:(ZHGContentItemResponseBaseClass *)response {

    [_contentItems removeAllObjects];

    [_contentItems addObjectsFromArray:response.posts];

    [self.homeViewcontroller reloadTableView:_contentItems];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (ZHHomeViewcontroller *)homeViewcontroller {

    if (_homeViewcontroller== nil){
        _homeViewcontroller= [[ZHHomeViewcontroller alloc] init];
    }
    return _homeViewcontroller;
}


@end
