//
//  IMCFourthViewController.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCFourthViewController.h"

@interface IMCFourthViewController ()

@end

@implementation IMCFourthViewController

- (instancetype)init {
	if (self = [super init]) {
		self.title = @"Fourth";
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
	NSLog(@"IMCFourthViewController: 我被销毁了");
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
