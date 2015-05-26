//
//  IMCMainViewController.m
//  Demo_UITapGestureRecognizer
//
//  Created by zhang xianglu on 15/5/4.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

- (void)viewDoubleTapped:(UITapGestureRecognizer *)gesture;

@end

@implementation IMCMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	
	//1、创建手势识别器，注册处理器
	UITapGestureRecognizer *doubleTappedGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewDoubleTapped:)];
	
	//2、配置手势识别器
	doubleTappedGestureRecognizer.numberOfTapsRequired = 2;
	
	//3、将手势识别器绑定给视图
	[self.view addGestureRecognizer:doubleTappedGestureRecognizer];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)viewTapped:(UITapGestureRecognizer *)gesture {
	NSLog(@"viewTapped...");
}

- (void)viewDoubleTapped:(UITapGestureRecognizer *)gesture {
	NSLog(@"viewDoubleTapped...");
}


@end
