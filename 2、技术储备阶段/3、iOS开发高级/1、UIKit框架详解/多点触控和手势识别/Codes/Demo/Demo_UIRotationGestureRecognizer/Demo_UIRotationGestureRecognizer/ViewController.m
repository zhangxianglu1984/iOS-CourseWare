//
//  ViewController.m
//  Demo_UIRotationGestureRecognizer
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)viewRotatedAction:(UIRotationGestureRecognizer *)gesture {
	_greenView.transform = CGAffineTransformMakeRotation(gesture.rotation);
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
