//
//  IMCMainViewController.m
//  Demo_UINavigationController
//
//  Created by zhang xianglu on 15/5/6.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCFirstViewController.h"
#import "IMCSecondViewController.h"
#import "IMCThirdViewController.h"
#import "IMCFourthViewController.h"


@interface IMCMainViewController () 

- (void)toolBarButtonClickedAction:(UIBarButtonItem *)button;

@end

@implementation IMCMainViewController

- (instancetype)init {
	if (self = [super init]) {
		self.title = @"MainViewController";
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.navigationController.navigationBar.barTintColor = [UIColor blueColor];
	
	//UIImageView *backBarView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"btn_img_normal_show"]];
	//self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBarView];
	
	//左边栏按钮
	UIBarButtonItem *leftItem_1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
	
	UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
	imageView.image = [UIImage imageNamed:@"btn_img_normal_show"];
	
	UIBarButtonItem *leftItem_2 = [[UIBarButtonItem alloc] initWithCustomView:imageView];
	
	self.navigationItem.leftBarButtonItems = @[leftItem_1,leftItem_2];
	
	//右边栏按钮
	UIBarButtonItem *rightItem_1 = [[UIBarButtonItem alloc] initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:nil action:nil];
	
	//UIBarButtonItem *rightItem_2 = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"btn_img_normal_show"] style:UIBarButtonItemStylePlain target:nil action:nil];
	
	self.navigationItem.rightBarButtonItems = @[rightItem_1];
	
	//标题栏
	UIImageView *titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 40, 30)];
	titleImageView.image = [UIImage imageNamed:@"btn_img_normal_show"];
	titleImageView.contentMode = UIViewContentModeScaleAspectFit;
	
	//self.navigationItem.titleView = titleImageView;
	//self.navigationItem.title = @"主控制器";
	
	//隐藏导航栏
	self.navigationController.navigationBarHidden = NO;
	
	//显示工具栏
	self.navigationController.toolbarHidden = NO;
	
	UIBarButtonItem *toolBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(toolBarButtonClickedAction:)];
	self.toolbarItems = @[toolBarButtonItem];
}

- (void)toolBarButtonClickedAction:(UIBarButtonItem *)button {
	[self.navigationController setNavigationBarHidden:YES animated:YES];
}


- (IBAction)showViewControllerAction:(UIButton *)button {
	NSString *buttonTitle = [button titleForState:UIControlStateNormal];
	if ([@"FirstViewController" isEqualToString:buttonTitle]) {
		IMCFirstViewController *firstViewController = [[IMCFirstViewController alloc] init];
		
		firstViewController.contactorId = 24;
		
		
		
		
		//通过导航控制器来切换场景
		[self.navigationController pushViewController:firstViewController animated:YES];
		
	}else if([@"SecondViewController" isEqualToString:buttonTitle]){
		IMCSecondViewController *secondViewController = [[IMCSecondViewController alloc] init];
		
		[self.navigationController pushViewController:secondViewController animated:YES];
		
	}else if([@"ThirdViewController" isEqualToString:buttonTitle]){
		/**实例化ThirdViewController**/
		IMCThirdViewController *thirdViewController =[[IMCThirdViewController alloc] init];
		
		/**用navigationController把场景压进栈**/
		[self.navigationController pushViewController:thirdViewController animated:YES];
	
	}else if([@"FourthViewController" isEqualToString:buttonTitle]){
		 IMCFourthViewController *fourthViewController = [[IMCFourthViewController alloc] init];
		 
		 [self.navigationController pushViewController:fourthViewController animated:YES];
	}else if([@"FifthViewController" isEqualToString:buttonTitle]){
	}

}


@end
