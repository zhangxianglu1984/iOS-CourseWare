//
//  IMCSecondViewController.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCSecondViewController.h"

@interface IMCSecondViewController ()

@end

@implementation IMCSecondViewController

- (instancetype)init {
	if (self = [super init]) {
		UIImage *tabBarItemImage = [UIImage imageNamed:@"btn_img_normal_show"];
        
		
		tabBarItemImage = [tabBarItemImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
	
		UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Second" image:tabBarItemImage tag:102];
		
		self.tabBarItem = tabBarItem;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
	NSLog(@"IMCSecondViewController: 我被销毁了");
}


@end
