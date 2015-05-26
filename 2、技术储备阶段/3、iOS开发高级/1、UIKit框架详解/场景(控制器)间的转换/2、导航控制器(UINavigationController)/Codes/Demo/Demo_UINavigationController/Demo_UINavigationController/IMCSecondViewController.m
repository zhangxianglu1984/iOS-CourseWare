//
//  IMCSecondViewController.m
//  Demo_UINavigationController
//
//  Created by zhang xianglu on 15/5/6.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCSecondViewController.h"

@interface IMCSecondViewController ()

@end

@implementation IMCSecondViewController
- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		self.title = @"SecondViewController";
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
