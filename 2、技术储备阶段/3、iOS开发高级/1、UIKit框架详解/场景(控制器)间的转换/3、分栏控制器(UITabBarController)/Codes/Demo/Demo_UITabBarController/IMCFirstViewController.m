//
//  IMCFirstViewController.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCFirstViewController.h"

@interface IMCFirstViewController ()

@end

@implementation IMCFirstViewController


- (instancetype)init {
	if (self = [super init]) {
		self.title = @"First";
		
		UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemFavorites tag:101];
		self.tabBarItem = tabBarItem;
		
		self.tabBarItem.badgeValue = @"4";
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.tabBarController.tabBar.hidden = NO;

}

- (IBAction)switchButtonClickedAction:(UIButton *)button {
	self.tabBarController.selectedIndex = 1;
}

- (void)dealloc {
	NSLog(@"IMCFirstViewController: 我被销毁了");
}


@end
