//
//  AppDelegate.m
//  UITabBarController
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewControllerA.h"
#import "ViewControllerB.h"
#import "ViewControllerC.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    
    UITabBarController *tbvc = [[UITabBarController alloc]init];
    
    ViewControllerA *vcA = [[ViewControllerA alloc]init];
    vcA.tabBarItem.title = @"消息";
    UIImage *image = [UIImage imageNamed:@"circle"];
//    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vcA.tabBarItem.image = image;
    vcA.tabBarItem.badgeValue = @"new";
    
    
    ViewControllerB *vcB = [[ViewControllerB alloc]init];
    vcB.view.backgroundColor = [UIColor orangeColor];
    UITabBarItem *bItem = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:100];
    vcB.tabBarItem = bItem;
    
    ViewControllerC *vcC = [[ViewControllerC alloc]init];
    vcC.view.backgroundColor = [UIColor greenColor];
    UITabBarItem *cItem = [[UITabBarItem alloc]initWithTitle:@"我" image:[UIImage imageNamed:@"circle"] selectedImage:nil];
    vcC.tabBarItem = cItem;
    
    UINavigationController *navC = [[UINavigationController alloc]initWithRootViewController:vcC];
    
    
    
    tbvc.viewControllers = @[vcA, vcB, navC];
    
    // 该变tabbar的颜色
//    tbvc.tabBar.barTintColor = [UIColor blackColor];
    
    // 修改item点中时候的颜色
//    [[UITabBar appearance] setTintColor:[UIColor blackColor]];
    
    self.window.rootViewController = tbvc;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
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
