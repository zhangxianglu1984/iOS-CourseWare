//
//  SecondViewController.m
//  Demo_PresentViewController
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "SecondViewController.h"

#import "ThirdViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)switchButtonClickedAction:(UIButton *)sender {
	ThirdViewController *thirdViewController = [[ThirdViewController alloc] init];

	[self presentViewController:thirdViewController animated:YES completion:^{
		NSLog(@"场景又切换了...");
	}];
}

- (IBAction)quitButtonClickedAction:(UIButton *)sender {
	//退出当前场景
	[self dismissViewControllerAnimated:YES completion:^{
		NSLog(@"哥走了...");
	}];
}

- (void)dealloc {
	NSLog(@"SecondViewController：我被销毁了");
}

@end
