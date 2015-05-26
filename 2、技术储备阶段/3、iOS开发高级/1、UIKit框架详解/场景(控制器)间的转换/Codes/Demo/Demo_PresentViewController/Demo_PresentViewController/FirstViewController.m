//
//  FirstViewController.m
//  Demo_PresentViewController
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "FirstViewController.h"

#import "SecondViewController.h"

@interface FirstViewController ()

@property (weak, nonatomic) IBOutlet UIButton *switchButton;

- (void)switchButtonClickedAction:(UIButton *)button;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
	[_switchButton addTarget:self action:@selector(switchButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)switchButtonClickedAction:(UIButton *)button {
	//两个直接的场景切换
	SecondViewController *secondViewController = [[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
	
	//直接切换场景的方法
	[self presentViewController:secondViewController animated:YES completion:^{
		NSLog(@"场景切换成功了！");
	}];
}

- (void)dealloc {
	NSLog(@"FirstViewController：我被销毁了");
}

@end
