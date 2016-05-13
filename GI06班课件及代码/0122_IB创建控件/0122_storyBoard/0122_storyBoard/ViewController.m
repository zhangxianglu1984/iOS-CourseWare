//
//  ViewController.m
//  0122_storyBoard
//
//  Created by jianfeng on 15/1/22.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)btnClicked:(UIButton *)sender {
    // 取账号输入框的内容
    NSString *accountString = self.accountField.text;
    if (accountString.length == 0) {
        NSLog(@"账户不能为空");
        return;
    }

    // 取密码输入框的内容
    NSString *passwordString = self.passwordField.text;
    if (passwordString.length == 0) {
        NSLog(@"密码不能为空");
        return;
    }
    // 组合成字符串并打印出来
    NSString *result = [NSString stringWithFormat:@"账户:%@,密码:%@",accountString,passwordString];
    NSLog(@"%@",result);
    
//    [self.accountField resignFirstResponder];
//    [self.passwordField resignFirstResponder];
    // 结束编辑收起键盘
    [self.view endEditing:YES];
    
    // 清空账号和密码
    self.accountField.text = nil;
    self.passwordField.text = @"";
    
    NSArray *imagesArray =@[[UIImage imageNamed:@"image1"],
                            [UIImage imageNamed:@"image2"],
                            [UIImage imageNamed:@"image3"],
                            [UIImage imageNamed:@"image4"],
                            [UIImage imageNamed:@"image5"]];
    
    UIImageView *animationImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 131, 125)];
    animationImageView.animationImages = imagesArray;//将序列帧数组赋给UIImageView的animationImages属性
    animationImageView.animationDuration = 0.25;//设置动画时间
    animationImageView.animationRepeatCount = 0;//设置动画次数 0 表示无限
    [animationImageView startAnimating];//开始播放动画
}
@end
