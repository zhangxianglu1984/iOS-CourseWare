//
//  ViewController.m
//  resignKeyboard
//
//  Created by jianfeng on 15/1/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>
{
    UITapGestureRecognizer *tap;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
    if (tap) {
        [self.view removeGestureRecognizer:tap];
    }
}

- (IBAction)clickButton:(id)sender {
    NSLog(@"click");
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(resign:)];
    [self.view addGestureRecognizer:tap];
}

- (void)resign:(UITapGestureRecognizer *)ges
{
    [self.view endEditing:YES];
    [self.view removeGestureRecognizer:ges];
}




@end
