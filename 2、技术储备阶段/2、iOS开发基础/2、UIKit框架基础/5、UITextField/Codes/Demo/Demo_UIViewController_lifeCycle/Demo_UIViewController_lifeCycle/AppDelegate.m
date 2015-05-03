//
//  AppDelegate.m
//  Demo_UIViewController_lifeCycle
//
//  Created by zhang xianglu on 15/4/28.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AppDelegate.h"
#import "IMCMainViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
	NSLog(@"willFinishLaunchingWithOptions..");
	
	return YES;
}

/** 当应用程序正常启动后调用 **/
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	NSLog(@"didFinishLaunchingWithOptions: 当应用程序正常启动后调用");
	
	self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
	[_window makeKeyAndVisible];
	
	IMCMainViewController *controller = [[IMCMainViewController alloc] initWithNibName:@"IMCMainViewConttroller" bundle:nil];
	
	_window.rootViewController = controller;
	
	return YES;
}

/** 无法交互的时候调用 **/
- (void)applicationWillResignActive:(UIApplication *)application{
	NSLog(@"applicationWillResignActive..");
}

/** 能够与用户交互的时候调用 **/
- (void)applicationDidBecomeActive:(UIApplication *)application{
	NSLog(@"applicationDidBecomeActive...");
}

/** 当应用程序进入后台时调用 **/
- (void)applicationDidEnterBackground:(UIApplication *)application{
	NSLog(@"applicationDidEnterBackground...");
}

/** 当应用程序将要进入前台时调用 **/
- (void)applicationWillEnterForeground:(UIApplication *)application{
	NSLog(@"applicationWillEnterForeground..");
}

/** 应用程序关闭时调用 **/
- (void)applicationWillTerminate:(UIApplication *)application{
	NSLog(@"applicationWillTerminate...");
}


@end
