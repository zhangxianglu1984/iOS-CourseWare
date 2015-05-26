//
//  AViewController.m
//  Demo_UINavigationController
//
//  Created by zhang xianglu on 15/5/8.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AViewController.h"

@interface AViewController ()

@end

@implementation AViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)bViewControllerButtonClickedAction:(UIButton *)button {
	[self performSegueWithIdentifier:@"234" sender:self];
}

- (IBAction)cViewControllerButtonClickedAction:(UIButton *)sender {
	[self performSegueWithIdentifier:@"123" sender:self];
}



@end
