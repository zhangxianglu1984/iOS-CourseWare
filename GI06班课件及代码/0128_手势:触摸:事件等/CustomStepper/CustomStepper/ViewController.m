//
//  ViewController.m
//  CustomStepper
//
//  Created by Apple on 15/1/27.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import "ViewController.h"
#import "CustomStepper.h"

@interface ViewController ()<CustomStepperDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomStepper *stepper = [[CustomStepper alloc]init];
    stepper.center = CGPointMake(160, 160);
    stepper.delegate = self;
    stepper.count = 10;
    [self.view addSubview:stepper];
}

- (void)customStepperValueDidChanged:(NSInteger)value
{
    NSLog(@"%d",value);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
