//
//  AppDelegate.m
//  Demo_UINavigationController
//
//  Created by zhang xianglu on 15/5/6.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AppDelegate.h"

#import "IMCMainViewController.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0] 

@interface AppDelegate () <UINavigationControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
	self.window = [[UIWindow alloc] init];
	self.window.frame = [UIScreen mainScreen].bounds;
	self.window.backgroundColor = [UIColor whiteColor];
	[self.window makeKeyAndVisible];
	
	//[[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x067AB5)];
	//[UINavigationBar appearance].translucent = YES;
	
	//设置导航栏的标题字体
	/*
	NSShadow *shadow = [[NSShadow alloc] init]; 
	shadow.shadowColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];  
	
	NSDictionary *textAttributes = @{NSForegroundColorAttributeName:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0],NSFontAttributeName:[UIFont fontWithName:@ "HelveticaNeue-CondensedBlack"  size:21.0]};
	[[UINavigationBar appearance] setTitleTextAttributes:textAttributes];
	
	[[UIButton appearance] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	*/
	
	//初始化导航控制器的根控制器
	IMCMainViewController *mainViewController = [[IMCMainViewController alloc] init];
	
	UINavigationController *navigationController = [[UINavigationController alloc] initWithRootViewController:mainViewController];
	navigationController.delegate = self;
	
	NSShadow *shadow = [[NSShadow alloc] init]; 
	shadow.shadowColor = [UIColor colorWithRed:1.0 green:0.0 blue:0.0 alpha:0.8];
	
	navigationController.navigationBar.titleTextAttributes = @{
		NSForegroundColorAttributeName:[UIColor colorWithRed:245.0/255.0 green:245.0/255.0 blue:245.0/255.0 alpha:1.0],NSFontAttributeName:[UIFont fontWithName:@ "HelveticaNeue-CondensedBlack"  size:21.0],
		NSShadowAttributeName:shadow
	};
	
	//只要是UIButton类型的控件，我就把标题的颜色设置成红色
	[[UIButton appearance] setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	
	self.window.rootViewController = navigationController;
	
	return YES;
}

/** 新的场景将要呈现时调用 **/
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	NSLog(@"新的场景将要呈现了..");
}

/** 新的场景已经呈现时调用 **/
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
	NSLog(@"新的场景已经呈现了..");
}



@end
