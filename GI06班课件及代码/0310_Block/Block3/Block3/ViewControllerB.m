//
//  ViewControllerB.m
//  Block3
//
//  Created by jianfeng on 15/3/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewControllerB.h"

@interface ViewControllerB()
{
    UITextField *textField;
}

@end

@implementation ViewControllerB

+ (instancetype)viewControllerBWithBlock:(passValueBlock)block
{
    ViewControllerB *vcb = [[self alloc]init];
    vcb.block = block;
    return vcb;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"控制器B";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"传值" style:UIBarButtonItemStylePlain target:self action:@selector(passValue)];
    
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(goBackToVCA)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    self.navigationItem.leftBarButtonItem = leftItem;
    
    textField = [[UITextField alloc]initWithFrame:CGRectMake(50, 50, 200, 40)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.center = CGPointMake(self.view.bounds.size.width/2, 200);
    textField.placeholder = @"请输入要传的值";
    [self.view addSubview:textField];
}

- (void)passValue
{
    [textField resignFirstResponder];
    self.block(textField.text);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)goBackToVCA
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end










