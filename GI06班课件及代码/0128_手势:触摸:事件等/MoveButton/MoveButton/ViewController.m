//
//  ViewController.m
//  MoveButton
//
//  Created by jianfeng on 15/1/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "CustomButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CustomButton *button = [CustomButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 100, 100);
    button.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:button];
}



@end
