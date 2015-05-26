//
//  ThirdViewController.m
//  Demo_PresentViewController
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)quitButtonClickedAction:(UIButton *)sender {
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"我又被销毁了...");
	}];
}

- (void)dealloc {
	NSLog(@"ThirdViewController：我被销毁了");
}
@end
