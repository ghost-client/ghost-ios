//
//  ViewController.m
//  ZHGhost
//
//  Created by hangzhang on 15/3/18.
//  Copyright (c) 2015年 hangzhang. All rights reserved.
//

#import "ViewController.h"
#import "ZHGhostManger.h"
#import "ZHDefine.h"
#import "HomeItemView.h"
#import "ZHFounction.h"
#import "StyleKitName.h"
#import "ZHHomeViewcontroller.h"
#import "ZHLoginViewController.h"
#import "ZHGContentItemResponseBaseClass.h"
#import "ZHTagsController.h"

#define ANMATION_TIME .3

#define ANMATION_LENGHT 150

@interface ViewController ()

@property (nonatomic, strong)ZHHomeViewcontroller *homeViewcontroller;

@end

@implementation ViewController {
    BOOL _isDismiss;

    ZHGhostManger *_ghostManger;

    NSMutableArray *_contentItems;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initView];


    [self gotoLoginController];







    // Do any additional setup after loading the view, typically from a nib.
}


- (void)initView {

    _ghostManger=[ZHGhostManger manger];

    _contentItems=[NSMutableArray array];

    self.isHaveNotTap= YES;

    self.view.backgroundColor=SCREEN_DEFINE_COLOR;

    UIImage *icon=[StyleKitName homeIcon];

    NSArray *topTitles=@[@"首页",@"标签",@"作者"];

    NSArray *footTitle=@[@"设置",@"未登录"];

    float itemHeight=50.f;

    NSInteger index=0;
    for (int i = 0; i <topTitles.count; ++i) {

        HomeItemView *itemView= [[HomeItemView alloc] initWithFrame:CGRectMake(0, ZHIOS7()+itemHeight*i, SCREEN_WIDTH, itemHeight)];

        [itemView setTitle:topTitles[i]];
        [self.view addSubview:itemView];

        [itemView setItemIcon:icon];

        itemView.tag=index;

        [itemView addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        index++;

    }

    for (int j = 0; j < footTitle.count; ++j) {

        HomeItemView *itemView= [[HomeItemView alloc] initWithFrame:CGRectMake(0, ZHFrameHeight(self.view)-itemHeight*(footTitle.count-j), SCREEN_WIDTH, itemHeight)];

        [itemView setTitle:footTitle[j]];
        [self.view addSubview:itemView];
        [itemView setItemIcon:icon];
        itemView.tag=index;

        [itemView addTarget:self action:@selector(itemButtonClick:) forControlEvents:UIControlEventTouchUpInside];

        index++;


    }

    [self.view addSubview:self.homeViewcontroller.view];

    [self.homeViewcontroller.navgationView.leftButton addTarget:self action:@selector(showView) forControlEvents:UIControlEventTouchUpInside];

}

- (void)showView {

    _isDismiss= !_isDismiss;

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



    __weak typeof(self) safeSelf = self;

    [_ghostManger allPostContentStatus:nil staticPages:nil page:0 include:nil success:^(ZHGContentItemResponseBaseClass *response) {


        [safeSelf reloadContent:response];


    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf showMessage:errorMessage];

    }];

}

- (void)reloadContent:(ZHGContentItemResponseBaseClass *)response {
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
