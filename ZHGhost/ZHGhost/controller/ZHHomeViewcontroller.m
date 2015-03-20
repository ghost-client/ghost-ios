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


@interface ZHHomeViewcontroller()

@property (nonatomic, strong)ZHHomeBannerView *bannerView;

@property (nonatomic, strong)UITableView *homeTableView;

@end

@implementation ZHHomeViewcontroller {

    NSArray *_contentItem;
}

- (void)viewDidLoad {

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.view.backgroundColor=[UIColor whiteColor];

    [self.navgationView.leftButton setBackgroundImage:[StyleKitName homeIcon] forState:UIControlStateNormal];

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

    cell.titleLabel.text=posts.title;

    cell.iconImageView.image=[StyleKitName homeIcon];

    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ZHHOME_TABLEVIEWCELL_HEIGHT;
}




- (void)reloadTableView:(NSArray *)array {

    _contentItem=array;

    [self.homeTableView reloadData];


}


@end