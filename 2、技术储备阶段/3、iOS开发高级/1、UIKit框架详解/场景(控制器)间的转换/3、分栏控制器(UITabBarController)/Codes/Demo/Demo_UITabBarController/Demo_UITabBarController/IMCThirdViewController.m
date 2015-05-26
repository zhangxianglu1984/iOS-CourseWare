//
//  IMCThirdViewController.m
//  Demo_UITabBarController
//
//  Created by zhang xianglu on 15/5/7.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCThirdViewController.h"

@interface IMCThirdViewController ()

@end

@implementation IMCThirdViewController

- (instancetype)init {
	if (self = [super init]) {
		//UITabBarItem *tabBarItem = [[UITabBarItem alloc] initWithTitle:@"Third" image:<#(UIImage *)#> selectedImage:<#(UIImage *)#>]
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
	NSLog(@"IMCThirdViewController: 我被销毁了");
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
