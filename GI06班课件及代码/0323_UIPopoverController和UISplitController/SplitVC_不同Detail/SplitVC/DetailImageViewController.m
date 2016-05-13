//
//  DetailImageViewController.m
//  SplitVC
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DetailImageViewController.h"

@interface DetailImageViewController ()

@end

@implementation DetailImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor purpleColor];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    label.text = @"我是图片";
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
}


@end
