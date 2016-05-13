//
//  CustomTabBarController.m
//  ClockDemo
//
//  Created by 敖 然 on 15/3/2.
//  Copyright (c) 2015年 imcore. All rights reserved.
//

#import "CustomTabBarController.h"
#import "WorldClockController.h"
#import "CloclController.h"
#import "StopWatchController.h"
#import "CounterController.h"

@implementation CustomTabBarController

- (instancetype)init
{
    if (self = [super init]) {
        WorldClockController *worldClockVC = [[WorldClockController alloc]init];
        UINavigationController *nav0 = [[UINavigationController alloc]initWithRootViewController:worldClockVC];
        UITabBarItem *tabBarItem0 = [[UITabBarItem alloc]initWithTabBarSystemItem:UITabBarSystemItemFeatured tag:100];
        nav0.tabBarItem = tabBarItem0;
        
        CloclController *clockVC = [[CloclController alloc]init];
        UINavigationController *nav1 = [[UINavigationController alloc]initWithRootViewController:clockVC];
        UITabBarItem *tabBarItem1 = [[UITabBarItem alloc]initWithTitle:@"闹钟" image:[UIImage imageNamed:@"alarm"] tag:101];
        nav1.tabBarItem = tabBarItem1;
        
        StopWatchController *stopWatchController = [[StopWatchController alloc]init];
        UINavigationController *nav2 = [[UINavigationController alloc]initWithRootViewController:stopWatchController];
        UITabBarItem *tabBarItem2 = [[UITabBarItem alloc]initWithTitle:@"秒表" image:[UIImage imageNamed:@"stopWatch"] tag:102];
        nav2.tabBarItem = tabBarItem2;
        
        CounterController *counterVC = [[CounterController alloc]init];
        UINavigationController *nav3 = [[UINavigationController alloc]initWithRootViewController:counterVC];
        UITabBarItem *tabBarItem3 = [[UITabBarItem alloc]initWithTitle:@"计时器" image:[UIImage imageNamed:@"timer"] tag:103];
        nav3.tabBarItem = tabBarItem3;
        
        self.viewControllers = @[nav0, nav1, nav2, nav3];
        
        self.selectedIndex = 2;
    }
    return self;
}

@end
