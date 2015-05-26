//
//  IMCMainViewController.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/8.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

@end

@implementation IMCMainViewController

- (instancetype)init {
	if (self = [super init]) {
		NSString *pathOfModulesPlistFile = [[NSBundle mainBundle] pathForResource:@"Modules" ofType:@"plist"];
		
		NSArray *modules = [NSArray arrayWithContentsOfFile:pathOfModulesPlistFile];
		
		NSMutableArray *viewControllers = [NSMutableArray arrayWithCapacity:modules.count];
		
		for (NSDictionary *moduleInfo in modules) {
			//实例化一个storyBoard
			UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:moduleInfo[@"StoryBoardName"] bundle:nil];
			
			UIViewController *viewController = [storyBoard instantiateInitialViewController];
			
			[viewControllers addObject:viewController];
		}
		
		self.viewControllers = viewControllers;
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
