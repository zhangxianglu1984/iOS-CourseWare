//
//  FriendCycleViewController.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/8.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "FriendCycleViewController.h"

@interface FriendCycleViewController ()

@end

@implementation FriendCycleViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.title = @"朋友圈";
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
