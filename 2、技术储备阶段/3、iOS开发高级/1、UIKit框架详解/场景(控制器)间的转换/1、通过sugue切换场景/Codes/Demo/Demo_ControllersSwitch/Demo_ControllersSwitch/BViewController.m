//
//  BViewController.m
//  Demo_ControllersSwitch
//
//  Created by zhang xianglu on 15/5/8.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "BViewController.h"

@interface BViewController ()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_titleLabel.text = _name;
}

- (IBAction)backButtonClickedAction:(UIButton *)button {
	[self dismissViewControllerAnimated:YES completion:^{}];
}


@end
