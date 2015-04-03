//
// Created by hangzhang on 15/3/18.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHHomeViewcontroller.h"
#import "StyleKitName.h"
#import "ZHHomeBannerView.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHGContentItemResponsePosts.h"
#import "ZHHomeTableViewCell.h"
#import "ZHGhostContentViewController.h"
#import "ZHMarkDownEditController.h"


@interface ZHHomeViewcontroller()

@property (nonatomic, strong)ZHHomeBannerView *bannerView;

@property (nonatomic, strong)UITableView *homeTableView;

@end

@implementation ZHHomeViewcontroller {

    NSArray *_contentItem;
    UINavigationController *_homeNavgationController;
}

- (void)viewDidLoad {

    self.isHaveNotTap= YES;

    [super viewDidLoad];

    self.isShowNavgationView= YES;



    [self.navgationView.leftButton setBackgroundImage:[StyleKitName homeLeftButton] forState:UIControlStateNormal];



    self.navgationView.titleLabel.text=@"君赏博客";

    [self.view addSubview:self.bannerView];

    [self.view addSubview:self.homeTableView];

     self.bannerView.bannerImages=@[[UIImage imageNamed:@"banner1.jpg"],[UIImage imageNamed:@"banner2.jpg"],[UIImage imageNamed:@"banner3.jpg"],[UIImage imageNamed:@"banner4.jpg"]];

}



- (ZHHomeBannerView *)bannerView {

    if (_bannerView== nil){
        _bannerView= [[ZHHomeBannerView alloc] init];
        _bannerView.frame= CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, 200);
    }

    return _bannerView;
}

- (UITableView *)homeTableView {
    if (_homeTableView== nil){
        _homeTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.bannerView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.bannerView)) style:UITableViewStylePlain];
        _homeTableView.dataSource=self;
        _homeTableView.delegate=self;
        _homeTableView.backgroundColor=[UIColor clearColor];
        _homeTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _homeTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _contentItem.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *string=@"cell";

    ZHHomeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell== nil){
        cell= [[ZHHomeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];

    }

    ZHGContentItemResponsePosts *posts=_contentItem[indexPath.row];

    cell.zhtitleLabel.text=posts.title;

   // cell.iconImageView.image=[StyleKitName homeIcon];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ZHHOME_TABLEVIEWCELL_HEIGHT;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

     ZHGContentItemResponsePosts *posts=_contentItem[indexPath.row];

    ZHGhostContentViewController *controller= [[ZHGhostContentViewController alloc] init];

    [controller setGhostContent:posts];

    [_homeNavgationController pushViewController:controller animated:YES];


}


- (void)reloadTableView:(NSArray *)array {

    _contentItem=array;

    [self.homeTableView reloadData];


}

- (void)setHomeNavgationController:(UINavigationController *)navigationController {
    
    _homeNavgationController=navigationController;
    
}


@end