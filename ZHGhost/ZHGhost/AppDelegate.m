//
//  AppDelegate.m
//  ZHGhost
//
//  Created by hangzhang on 15/3/18.
//  Copyright (c) 2015年 hangzhang. All rights reserved.
//

#import "AppDelegate.h"
#import "FLEXManager.h"
#import "ZHDefine.h"
#import "ZHBaseHomeViewController.h"
#import "ZHGhostManger.h"
#import "ZHLoginViewController.h"
#import "ZHUserInfoModelBaseClass.h"
#import "ZHHomeViewcontroller.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    self.window= [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];

    //**获取用户的信息
    UINavigationController *navigationController= nil;

    NSString *userName= nil;
    NSDictionary *dictionary=[[NSUserDefaults standardUserDefaults] objectForKey:USER_INFO_KEY];
    if (dictionary.allKeys.count>0){

        userName=dictionary.allKeys[0];

        ZHUserInfoModelBaseClass *userInfoModelBaseClass=[ZHUserInfoModelBaseClass modelObjectWithDictionary:dictionary[userName]];

        [[ZHGhostManger manger] congfigHost:userInfoModelBaseClass.host];

    }

   if ( userName && [[ZHGhostManger manger] isLogin:userName]){

       ZHBaseHomeViewController *controller= [[ZHBaseHomeViewController alloc] init];

       [controller contentItems];

       navigationController= [[UINavigationController alloc] initWithRootViewController:controller];

       [controller setHomeNavgationController:navigationController];


   } else{

       ZHLoginViewController *controller= [[ZHLoginViewController alloc] init];

       navigationController= [[UINavigationController alloc] initWithRootViewController:controller];


   }


     navigationController.delegate=self;




    self.window.rootViewController=navigationController;

    [self.window makeKeyAndVisible];

    [[FLEXManager sharedManager] showExplorer];


    return YES;
}
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{

    if ([viewController isKindOfClass:[ZHHomeViewcontroller class]]){
        ZHHomeViewcontroller *homeViewcontroller= [[ZHHomeViewcontroller alloc] init];

        [homeViewcontroller setHomeNavgationController:navigationController];
    }


}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
