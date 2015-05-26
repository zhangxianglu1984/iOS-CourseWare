//
//  AppDelegate.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/6.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AppDelegate.h"

#import "IMCFirstViewController.h"
#import "IMCSecondViewController.h"
#import "IMCThirdViewController.h"
#import "IMCFourthViewController.h"
#import "IMCFifthViewController.h"

@interface AppDelegate () <UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];	
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	//分栏控制器的用法
	IMCFirstViewController *firstViewController = [[IMCFirstViewController alloc] init];
	UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:firstViewController];
	
	
	//firstViewController.tabBarItem = @"First";
	
	IMCSecondViewController *secondViewController = [[IMCSecondViewController alloc] init];
	UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:secondViewController];
	
	IMCThirdViewController *thirdViewController = [[IMCThirdViewController alloc] init];
	
	IMCFourthViewController *fourthViewController = [[IMCFourthViewController alloc] init];
	
	IMCFifthViewController *fifthViewController = [[IMCFifthViewController alloc] init];
	
	NSArray *viewControllers = @[
		nav1,
		nav2,
		thirdViewController,
		fourthViewController,
		fifthViewController];
		
	UITabBarController *tabBarController = [[UITabBarController alloc] init];
	tabBarController.viewControllers = viewControllers;
	
	tabBarController.delegate = self;
	
	self.window.rootViewController = tabBarController;
	
	return YES;
}

#pragma mark - UITabBarController Delegate Methods
/** 场景是否要被呈现, 如果返回为NO,表示该场景不能被呈现**/
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
	
	return YES;
}

/** 场景已经呈现后调用 **/
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
	NSLog(@"我已经呈现了...");
}


@end











