//
//  ViewController.m
//  NSAttributedString
//
//  Created by jianfeng on 15/2/13.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 用一个label去显示富文本
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(20, 50, 280, 60)];
    [self.view addSubview:label];
    
    NSString *showStr = @"Hello World";
    
    // 初始化可变的(以现有的字符串初始化)
    NSMutableAttributedString *mAttributedString = [[NSMutableAttributedString alloc]initWithString:showStr];
    
    // 一个一个添加
//    [mAttributedString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:40.0f] range:NSMakeRange(0, 5)];
//    [mAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 5)];
    
    // 以字典的形式添加
    NSDictionary *dic = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:40.0f],
                          NSForegroundColorAttributeName : [UIColor redColor]};
    [mAttributedString addAttributes:dic range:NSMakeRange(0, 5)];
    
    label.attributedText = mAttributedString;
    
    // 初始化不可变的
//    NSAttributedString *attributedString = [[NSAttributedString alloc]initWithString:showStr attributes:dic];
//    label.attributedText = attributedString;
    
}


@end












