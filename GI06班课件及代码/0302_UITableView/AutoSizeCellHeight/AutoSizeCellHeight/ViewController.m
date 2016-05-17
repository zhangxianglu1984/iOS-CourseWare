//
//  ViewController.m
//  AutoSizeCellHeight
//
//  Created by jianfeng on 15/3/2.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#define kLabelWidth 200

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // label高度对于文字的自适应
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, kLabelWidth, 0)];
    label.backgroundColor = [UIColor orangeColor];
    NSString *str = @"不忘历史才能开辟未来，善于继承才能善于创新。优秀传统文化是一个国家、一个民族传承和发展的根本，如果丢掉了，就割断了精神命脉";
    label.text = str;
    label.numberOfLines = 0;
    label.font = [UIFont systemFontOfSize:17.0];
    [self.view addSubview:label];
    
    // 让label能够适应文字的内容大小
    // 方法一:
//    [label sizeToFit];
    
    // 方法二:
    // 1. 根据字符串算出要展示这串字符串所需的区域
    CGRect labelFrame = [str boundingRectWithSize:CGSizeMake(kLabelWidth, 0)
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17.0]}
                                          context:nil];
    

    
    // 2.得到区域的高度
    CGFloat height = labelFrame.size.height;
    
    // 3.根据得到的高度给label的height赋值
    CGRect frame = label.frame;
    frame.size.height = height;
    label.frame = frame;
}


@end
