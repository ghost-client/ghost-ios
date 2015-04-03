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
#import "ZHAddOrEditTagViewController.h"
#import "PanDeleteButton.h"


@interface ZHTagsController ()
@property(nonatomic, strong) UITableView *tagsTableView;
@end

@implementation ZHTagsController {

    NSMutableArray * _tagsArray;

    ZHGhostManger *_ghostManger;
}
- (void)viewDidLoad {

    self.isHaveNotTap= YES;

    [super viewDidLoad];

    self.isShowNavgationView= YES;

    self.navgationView.titleLabel.text=@"TAG";

    _tagsArray=[NSMutableArray array];


    _ghostManger=[ZHGhostManger manger];

    [self.view addSubview:self.tagsTableView];

    [self tagsRequest];


    [self.navgationView.rightButton setBackgroundImage:[StyleKitName tagsRightButton] forState:UIControlStateNormal];
    [self.navgationView.rightButton addTarget:self action:@selector(addTagButtonClick) forControlEvents:UIControlEventTouchUpInside];



}
- (void)addTagButtonClick {

    ZHAddOrEditTagViewController *addOrEditTagViewController= [[ZHAddOrEditTagViewController alloc] init];



    [self.navigationController pushViewController:addOrEditTagViewController animated:YES];

}


-(void)tagsRequest{

    [self HUDShow:@"正在获取所有的TAG列表"];
    __weak typeof(self) safeSelf = self;

    [_ghostManger allTags:ZHGhostTagsLimitAll success:^(ZHGTagsResponseBaseClass *response) {

        [safeSelf HUDHide:@"获取成功" afterDealy:.3];

        [safeSelf reloadTagsTableView:response];


    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

        if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];

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

    cell.tagTitleLabel.text=tags.name;

    [cell.numberImageView setBackgroundImage:[StyleKitName imageOfTagNumberButtonWithTagNumber:[NSString stringWithFormat:@"%d", (int) tags.postCount]]forState:UIControlStateNormal];
   // cell.tagURLTitleLabel.text=[NSString stringWithFormat:@"%@/",tags.slug];

    [cell.panDeleteButton addPanDelete:indexPath];

    __weak typeof(self) safeSelf = self;


    [cell.panDeleteButton setPanDeleteComplete:^(NSIndexPath *deleteIndexPath) {

        [safeSelf willDeleteTag:deleteIndexPath];


    }];

    [cell.panDeleteButton setPanClickComplete:^(NSIndexPath *deleteIndexPath) {

        [safeSelf showPanClickComplete:indexPath];


    }];


    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return ZHTAG_CELL_HEIGHT;
}
- (void)showPanClickComplete:(NSIndexPath *)indexPath {


    ZHGTagsResponseTags *tags= _tagsArray[indexPath.row];

    ZHAddOrEditTagViewController *addOrEditTagViewController= [[ZHAddOrEditTagViewController alloc] init];

    [addOrEditTagViewController setEditTagInfo:tags];


    [self.navigationController pushViewController:addOrEditTagViewController animated:YES];
}

- (void)willDeleteTag:(NSIndexPath *)deleteIndexPath {
    ZHGTagsResponseTags *tags= _tagsArray[(NSUInteger) deleteIndexPath.row];
   __weak typeof(self) safeSelf = self;

    [[ZHGhostManger manger] deleteTag:(NSUInteger) tags.internalBaseClassIdentifier success:^(ZHGTagsResponseBaseClass *response) {


        [safeSelf deleteTagsSuccess:tags];

    }                          failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {

         if (errorMessage== nil){

            errorMessage=error.userInfo[@"NSLocalizedDescription"];
        }

        [self showMessage:errorMessage];

    }];
}

- (void)deleteTagsSuccess:(ZHGTagsResponseTags *)tags {
    [_tagsArray removeObject:tags];

    [self.tagsTableView reloadData];
}



@end