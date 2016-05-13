//
//  CustomAccessoryView.m
//  replyFunction
//
//  Created by jianfeng on 15/1/27.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "CustomAccessoryView.h"

@interface CustomAccessoryView()
{
    UITextField *inputTextField;
    UIButton *sendButton;
}

@end

@implementation CustomAccessoryView

- (instancetype)init
{
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 44)];
    if (self) {
        self.backgroundColor = [UIColor lightGrayColor];
        
        //
        inputTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 5, 260, 34)];
        inputTextField.background = [UIImage imageNamed:@"tfbg"];
        inputTextField.leftViewMode = UITextFieldViewModeAlways;
        inputTextField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, 10)];
        [self addSubview:inputTextField];

        //
        sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        sendButton.frame = CGRectMake(CGRectGetMaxX(inputTextField.frame)+5, 0, 44, 44);
        [sendButton setTitle:@"发送" forState:UIControlStateNormal];
        [sendButton addTarget:self action:@selector(sendMsg:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:sendButton];
    }
    return self;
}

- (void)becomeFirstResponder
{
    [inputTextField becomeFirstResponder];
}

- (NSString *)showString
{
    return inputTextField.text;
}

- (void)resignFirstResponder
{
    [inputTextField resignFirstResponder];
    inputTextField.text = nil;
}

- (void)sendMsg:(UIButton *)button
{
    [self.delegate dealWithString:inputTextField.text];
}



@end
