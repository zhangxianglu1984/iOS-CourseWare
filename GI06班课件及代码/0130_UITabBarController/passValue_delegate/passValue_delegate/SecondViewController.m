//
//  SecondViewController.m
//  passValue_delegate
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    UILabel *label;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"SecondViewControler";
    self.view.backgroundColor = [UIColor orangeColor];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(70, 100, 100, 40)];
    label.text = @"abcde";
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(70, 150, 100, 100)];
    [button setTitle:@"传值回去" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(passValue:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)passValue:(UIButton *)button
{
    [self.delegate dealWithString:label.text];
    [self.navigationController popViewControllerAnimated:YES];
}




@end
