//
//  ViewController.m
//  Draw
//
//  Created by jianfeng on 15/3/20.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#import "DrawView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    DrawView *drawView = [[DrawView alloc]initWithFrame:CGRectMake(50, 50, 200, 200)];
    drawView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:drawView];
}



@end
