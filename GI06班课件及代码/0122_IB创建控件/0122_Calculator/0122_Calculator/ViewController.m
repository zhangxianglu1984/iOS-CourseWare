//
//  ViewController.m
//  0122_Calculator
//
//  Created by jianfeng on 15/1/22.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UITextFieldDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.num1Field.clearsOnBeginEditing = YES;
    self.num2Field.clearsOnBeginEditing = YES;
    
    self.num1Field.delegate = self;
    self.num2Field.delegate = self;
}

- (IBAction)calculate:(UIButton *)sender {
    // 获取两个输入框的值(它们都是字符串类型)
    NSString *num1String = self.num1Field.text;
    NSString *num2String = self.num2Field.text;
    // 计算两个数的和
    int result = [num1String intValue] + [num2String intValue];
//    self.resultLabel.text = [NSString stringWithFormat:@"%d",result];
    // 将结果显示到jieguo
    self.resultLabel.text = [@(result) stringValue];
    
    [self.view endEditing:YES];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField{
//    if (textField == self.num1Field) {
//        NSLog(@"这是第一个tf开始编辑");
//    }
//    else{
//        NSLog(@"这是第二个tf开始编辑");
//    }
    self.resultLabel.text = @"";
}

@end
