//
//  IMCFirstViewController.m
//  Demo_UINavigationController
//
//  Created by zhang xianglu on 15/5/6.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCFirstViewController.h"

#import "IMCSecondViewController.h"

#import "IMCMainViewController.h"

@interface IMCFirstViewController () <UINavigationControllerDelegate>

@end

@implementation IMCFirstViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.title = @"FirstViewController";
		
		
		//self.navigationItem.hidesBackButton = YES;
		
		//self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:nil action:nil];
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	/** 用颜色设置背景 **/
	[self.navigationController.navigationBar setBarTintColor:[UIColor redColor]];
    
	//self.navigationController.toolbarHidden = NO;
	
	NSArray *viewControllers = self.navigationController.viewControllers;
	NSLog(@"viewController的个数: %lu",viewControllers.count);
	
	//self.navigationController.navigationBar.translucent = YES;
	
}



- (IBAction)switchButtonClickedAction:(UIButton *)button {
	NSString *buttonTitle = [button titleForState:UIControlStateNormal];
	
	if ([@"FirstViewController" isEqualToString:buttonTitle]) {
		//压栈时，任何时候都是新建场景
		IMCFirstViewController *firstViewController = [[IMCFirstViewController alloc] init];
	
		[self.navigationController pushViewController:firstViewController animated:YES];
	}else if ([@"SecondViewController" isEqualToString:buttonTitle]){
		IMCSecondViewController *secondViewController = [[IMCSecondViewController alloc] init];
		
		[self.navigationController pushViewController:secondViewController animated:YES];
	}

}

- (IBAction)backToMainButtonClickedAction:(UIButton *)button {
	//[self.navigationController popToRootViewControllerAnimated:YES];
	
	NSArray *viewControllers = self.navigationController.viewControllers;
	for (UIViewController *viewController in viewControllers) {
		if ([viewController isMemberOfClass:[IMCMainViewController class]]) {
			
			[self.navigationController popToViewController:viewController animated:YES];
			break;
		}
	}
}

- (IBAction)backAction:(UIButton *)button {
	//[_delegate infoBack:self number:(NSUInteger)电话号码]

	[self.navigationController popViewControllerAnimated:YES];
	
	
	//[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)dealloc {
	NSLog(@"IMCFirstViewController：我被销毁了.");
}



@end
