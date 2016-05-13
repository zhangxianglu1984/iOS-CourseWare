//
//  ViewController.m
//  CustomLayer
//
//  Created by jianfeng on 15/3/19.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CALayer *layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    // 决定Layer在父类中的位置
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    // 确定layer身上哪个点会处在postion那个位置
    // 锚点:1.可以确定layer的位置  2.控制layer旋转的轴
//    layer.anchorPoint = CGPointMake(0, 0);// 锚点
    [self.view.layer addSublayer:layer];
    
    layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1); 
}


@end
