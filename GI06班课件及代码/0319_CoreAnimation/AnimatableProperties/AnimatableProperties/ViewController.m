//
//  ViewController.m
//  AnimatableProperties
//
//  Created by jianfeng on 15/3/19.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 隐式动画
    // 每个UIView的layer叫做rootlayer(根层),所有的非根层都存在隐式动画
    // 当对非根层的layer的部分属性进行修改的时候,默认会自动地产生一些动画效果
    // 这些属性被成为AnimatableProperties(可动画的属性),在CALayer的源文件中,带有Animatable字眼的,都是可动画的属性
    
    layer = [CALayer layer];
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(200, 200);
    [self.view.layer addSublayer:layer];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    layer.bounds = CGRectMake(0, 0, 200, 200);
//    layer.position = CGPointMake(200, 300);
    
    // 关闭隐式动画
    [CATransaction begin];
    [CATransaction setDisableActions:YES];
    
    layer.backgroundColor = [UIColor blueColor].CGColor;
    
    [CATransaction commit];
}




@end
