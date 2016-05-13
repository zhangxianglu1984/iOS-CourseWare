//
//  ViewController.m
//  UITableViewController
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",self.view);
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    TableViewController *tableVC = [[TableViewController alloc]init];
    [self.navigationController pushViewController:tableVC animated:YES];
}


@end
