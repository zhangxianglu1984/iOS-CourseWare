//
//  ViewController.m
//  0123_UIViewControllerLifeCycle
//
//  Created by jianfeng on 15/1/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerB.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)loadView
{
    [super loadView];
    NSLog(@"loadView A");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad A");
    [UIApplication sharedApplication].applicationIconBadgeNumber = 3;


}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear A");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear A");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)clickButton:(UIButton *)sender {
    ViewControllerB *vcB = [[ViewControllerB alloc]init];
    [self presentViewController:vcB animated:YES completion:nil];
}
@end
