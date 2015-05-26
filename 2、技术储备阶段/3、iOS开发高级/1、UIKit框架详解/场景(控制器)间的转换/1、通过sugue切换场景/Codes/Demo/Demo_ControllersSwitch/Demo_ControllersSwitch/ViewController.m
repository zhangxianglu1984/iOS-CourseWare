//
//  ViewController.m
//  Demo_ControllersSwitch
//
//  Created by zhang xianglu on 15/5/8.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

#import "BViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (IBAction)switchButtonClickedAction:(UIButton *)button {
	//手动执行segue
	NSString *identifier = @"switchSegue";
	[self performSegueWithIdentifier:identifier sender:self];

}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if ([segue.identifier isEqualToString:@"switchSegue"]) {
		BViewController *destinationViewController = (BViewController *)segue.destinationViewController;
		
		destinationViewController.name = @"晓鑫吃快餐..";
	}
}

@end
