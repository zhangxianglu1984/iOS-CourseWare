//
//  ViewController.m
//  replyFunction
//
//  Created by jianfeng on 15/1/27.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "CustomAccessoryView.h"


@interface ViewController ()<CustomAccessoryViewDelegate>
{
    UILabel *label;
    UITextField *fakeTextField;
    CustomAccessoryView *accessoryView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self initViews];
}

- (void)initViews
{
    label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 200, 40)];
    label.text = @"你好吗?";
//    label.backgroundColor = [UIColor redColor];
    [self.view addSubview:label];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor lightGrayColor];
    button.frame = CGRectMake(CGRectGetMaxX(label.frame) + 5, CGRectGetMinY(label.frame), 40, CGRectGetHeight(label.frame));
    [button setTitle:@"回复" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(reply:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    // 创建一个隐藏的输入框,专门用来弹出键盘
    fakeTextField = [[UITextField alloc]initWithFrame:CGRectZero];
    [self.view addSubview:fakeTextField];
    fakeTextField.hidden = YES;
    
    [self initKeyboardAccessoryView];
}

- (void)initKeyboardAccessoryView
{
    accessoryView = [[CustomAccessoryView alloc]init];
    accessoryView.delegate = self;
    fakeTextField.inputAccessoryView = accessoryView;
}

#pragma mark - click method

- (void)reply:(UIButton *)button
{
    [fakeTextField becomeFirstResponder];
    [accessoryView becomeFirstResponder];
}

#pragma mark - CustomAccessoryViewDelegate

- (void)dealWithString:(NSString *)str
{
    NSLog(@"%@",str);
    label.text = str;
    
    [accessoryView resignFirstResponder];
    [fakeTextField resignFirstResponder];
}


@end
