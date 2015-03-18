//
//  ViewController.m
//  ZHGhost
//
//  Created by hangzhang on 15/3/18.
//  Copyright (c) 2015年 hangzhang. All rights reserved.
//

#import "ViewController.h"
#import "ZHGhostManger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [[ZHGhostManger manger] congfigHost:@"http://js.uiapple.com"];

    [[ZHGhostManger manger] loginWithUserName:@"15038777234@163.com" passWord:@"zhanghang1990823"];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
