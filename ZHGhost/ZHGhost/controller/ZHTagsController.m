//
// Created by hangzhang on 15/3/20.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHTagsController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHTagTableViewCell.h"
#import "ZHGTagsResponseTags.h"
#import "StyleKitName.h"
#import "ZHGhostManger.h"
#import "ZHGTagsResponseBaseClass.h"


@interface ZHTagsController ()
@property(nonatomic, strong) UITableView *tagsTableView;
@end

@implementation ZHTagsController {

    NSMutableArray * _tagsArray;

    ZHGhostManger *_ghostManger;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.titleLabel.text=@"TAG";

    _tagsArray=[NSMutableArray array];


    _ghostManger=[ZHGhostManger manger];

    [self.view addSubview:self.tagsTableView];

    [self tagsRequest];


    [self.navgationView.rightButton setTitle:@"新增" forState:UIControlStateNormal];

}
-(void)tagsRequest{

    __weak typeof(self) safeSelf = self;

    [_ghostManger allTags:ZHGhostTagsLimitMax success:^(ZHGTagsResponseBaseClass *response) {

        [safeSelf reloadTagsTableView:response];


    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf showMessage:errorMessage];

    }];

}

- (void)reloadTagsTableView:(ZHGTagsResponseBaseClass *)response {
    [_tagsArray addObjectsFromArray:response.tags];

    [self.tagsTableView reloadData];
}

- (UITableView *)tagsTableView {
    if (_tagsTableView== nil){
        _tagsTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStylePlain];
        _tagsTableView.dataSource=self;
        _tagsTableView.delegate=self;
    }
    return _tagsTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _tagsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *string=@"cell";

    ZHTagTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell== nil){
        cell= [[ZHTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];

    }

    ZHGTagsResponseTags *tags=_tagsArray[indexPath.row];

    cell.iconImageView.image=[StyleKitName homeIcon];

    cell.tagTitleLabel.text=tags.name;

    cell.numberImageView.image=[StyleKitName homeIcon];


    return cell;
}


@end