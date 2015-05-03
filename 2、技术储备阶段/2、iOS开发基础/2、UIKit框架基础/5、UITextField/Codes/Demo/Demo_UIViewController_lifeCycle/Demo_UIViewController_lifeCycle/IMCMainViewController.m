//
//  IMCMainViewController.m
//  Demo_UIViewController_lifeCycle
//
//  Created by zhang xianglu on 15/4/28.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

- (void)switchController;

@end

@implementation IMCMainViewController

/** 手动初始化，用代码初始化一个原始的UIViewController **/
- (id)init{
	if (self = [super init]) {
		NSLog(@"init");
	}
	return self;
}

/** Controller的初始化由stroyboard来完成 **/
- (id)initWithCoder:(NSCoder *)aDecoder {
	if(self = [super initWithCoder:aDecoder]){
		NSLog(@"initWithCoder");
	}
	return self;
}

/** 我们手动调用，用一个xib,nib文件来初始化一个controller **/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		NSLog(@"initWithNibName");
		[UIApplication sharedApplication].statusBarHidden = YES;
		
	}
	
	return self;
}

/** 实例化根视图 **/
- (void)loadView {
	NSLog(@"loadView..");
	[super loadView];
}

/** 根视图实例化完成后调用 **/
- (void)viewDidLoad {
    [super viewDidLoad];
	
	[UIApplication sharedApplication].applicationIconBadgeNumber = 3;
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2-50, 200, 100, 44);
	
	button.backgroundColor = [UIColor purpleColor];
	
	[button setTitle:@"点击" forState:UIControlStateNormal];
	
	[button addTarget:self action:@selector(switchController) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:button];
    
	NSLog(@"viewDidLoad...");
}

/** 根视图在显示之前调用 **/
- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	NSLog(@"viewWillAppear");
}

/** 在根视图显示之后调用 **/
- (void)viewDidAppear:(BOOL)animated {
	NSLog(@"viewDidAppear");
}

/** 在根视图隐藏之前调用 **/
- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"viewWillDisappear");
}

/** 在根视图隐藏之后调用 **/
- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"viewDidDisappear");
}


- (void)switchController {
	UIViewController *controller = [[UIViewController alloc] init];
	controller.view.backgroundColor = [UIColor redColor];
	
	[self presentViewController:controller animated:YES completion:^{
		
	}];
}

- (void)dealloc {
	NSLog(@"dealloc..");
}


@end
