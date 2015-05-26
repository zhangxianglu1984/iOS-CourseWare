//
//  ViewController.m
//  Demo_UIGestureRecognizer
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

#import "CustomGestureRecognizer.h"

@interface ViewController ()

@property(nonatomic,strong) CustomGestureRecognizer *gestureRecognizer;

- (void)customGestureRecognizedAction:(CustomGestureRecognizer *)gestureRecognizer;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	self.view.backgroundColor = [UIColor orangeColor];
}

- (void)customGestureRecognizedAction:(CustomGestureRecognizer *)gestureRecognizer {
	self.view.backgroundColor = [UIColor blueColor];
}

- (void)viewWillAppear:(BOOL)animated {
	self.gestureRecognizer = [[CustomGestureRecognizer alloc] initWithTarget:self action:@selector(customGestureRecognizedAction:)];
	
	_gestureRecognizer.allowAbleRange = 100.0f;
	
	[self.view addGestureRecognizer:_gestureRecognizer];
}

- (void)viewDidDisappear:(BOOL)animated {
	[self.view removeGestureRecognizer:_gestureRecognizer];
	self.gestureRecognizer = nil;
}

@end
