//
// Created by hangzhang on 15/3/26.
// Copyright (c) 2015 hangzhang. All rights reserved.
//

#import "ZHAllUserViewController.h"
#import "ZHFounction.h"
#import "ZHDefine.h"
#import "ZHGhostManger.h"
#import "ZHAllUserResponseBaseClass.h"
#import "ZHTagTableViewCell.h"
#import "ZHAllUserResponseUsers.h"
#import "ZHAllUserResponseRoles.h"
#import "StyleKitName.h"


@implementation ZHAllUserViewController {

    UITableView *_userTableView;

    NSMutableArray *_usersArray;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    _usersArray=[NSMutableArray array];
    self.isShowNavgationView= YES;
    self.navgationView.titleLabel.text=@"用户列表";
    [self.view addSubview:self.userTableView];

    [self requestUsers];

}
-(void)requestUsers{


    __weak typeof(self) safeSelf = self;
    [self HUDShow:@"正在获取用户列表"];

    [[ZHGhostManger manger] allUserPage:1 limit:100 success:^(ZHAllUserResponseBaseClass *response) {

        [safeSelf HUDHide:@"获取成功" afterDealy:.3];

        [safeSelf allUserSuccessResponse:response];

    } failed:^(NSError *error, NSString *errorMessage, NSInteger errorCode) {




        if (errorMessage== nil){
            errorMessage=error.userInfo[NSLocalizedDescriptionKey];
        }

        [safeSelf HUDHide:errorMessage afterDealy:2];
    }];


}

- (void)allUserSuccessResponse:(ZHAllUserResponseBaseClass *)response {
    [_usersArray addObjectsFromArray:response.users];

    [self.userTableView reloadData];
}

- (UITableView *)userTableView {
    if (_userTableView== nil){
        _userTableView= [[UITableView alloc] initWithFrame:CGRectMake(0, ZHFrameNextY(self.navgationView), SCREEN_WIDTH, ZHFrameHeight(self.view)- ZHFrameNextY(self.navgationView)) style:UITableViewStylePlain];

        _userTableView.dataSource=self;
        _userTableView.delegate=self;
        _userTableView.separatorStyle=UITableViewCellSeparatorStyleNone;

    }
    return _userTableView;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _usersArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *string=@"cell";
     ZHTagTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:string];
    if (cell== nil){
        cell=  [[ZHTagTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:string];

    }

    ZHAllUserResponseUsers *users=_usersArray[indexPath.row];


    NSArray *array=users.roles;

    if (array.count>0){
        ZHAllUserResponseRoles *roles=array[0];
        [cell.numberImageView setBackgroundImage:[self imageNameRolesId:roles frame:cell.numberImageView.bounds] forState:UIControlStateNormal];
    }



    cell.tagTitleLabel.text=users.name;
    return cell;
}


-(UIImage *)imageNameRolesId:(ZHAllUserResponseRoles *)roles frame:(CGRect)frame{



    return [StyleKitName imageOfRolesButtonWithFrame:frame rolesText:roles.rolesDescription];

}


@end