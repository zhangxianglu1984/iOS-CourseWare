//
//  FirstViewController.m
//  passValue_delegate
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"

@interface FirstViewController ()<SecondViewControllerDelegate>
{
    UILabel *label;
}

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"FirstViewController";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemCompose target:self action:@selector(pushSecondVC)];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(70, 100, 100, 40)];
    label.backgroundColor = [UIColor purpleColor];
    [self.view addSubview:label];
    
}

- (void)pushSecondVC
{
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    secondVC.delegate = self;
    [self.navigationController pushViewController:secondVC animated:YES];
}

- (void)dealWithString:(NSString *)str
{
    label.text = str;
}



@end
