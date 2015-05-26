//
//  ViewController.m
//  Demo_UISwipeGestureRecognizer
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)viewSwipedAction:(UISwipeGestureRecognizer *)gesture {
	NSLog(@"滑动了");
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
}

@end
