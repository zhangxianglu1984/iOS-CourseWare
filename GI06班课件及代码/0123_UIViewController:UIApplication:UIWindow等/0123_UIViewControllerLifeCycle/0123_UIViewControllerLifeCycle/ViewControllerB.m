//
//  ViewControllerB.m
//  0123_UIViewControllerLifeCycle
//
//  Created by jianfeng on 15/1/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewControllerB.h"

@implementation ViewControllerB

- (void)loadView
{
    [super loadView];
//    UIView *view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    self.view = view;
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"loadView");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"viewDidLoad");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillAppear:animated];
     NSLog(@"viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    NSLog(@"viewDidDisappear");
}

- (void)dealloc
{
    NSLog(@"ViewControllerB被销毁了");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"收到了内存警告");
}

- (void)clickButton:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
