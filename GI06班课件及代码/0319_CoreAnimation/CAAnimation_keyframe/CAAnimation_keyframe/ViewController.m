//
//  ViewController.m
//  CAAnimation_keyframe
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
    
    layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 50, 50);
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self keyFrameValues];
//    [self keyFramePath];
}

// 使用keyPath的path属性设置动画
- (void)keyFramePath
{
    // 1.创建动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 效果
    anim.keyPath = @"position";
    
    // 绘制一个图形(路径)
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddEllipseInRect(path, NULL, CGRectMake(50, 100, 200, 200));
    
    // 路径赋值给动画
    anim.path = path;
    
    // 可以设置每段的执行时间(比例)
    anim.keyTimes = @[@(0.0), @(0.1), @(0.5), @(0.9), @(1.0)];
    
    // 持续时间
    anim.duration = 2;
    
    // 设置重复次数
    anim.repeatCount = MAXFLOAT;
    
    // 不让返回的语句组合
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 2.动画添加到layer
    [layer addAnimation:anim forKey:nil];
    
    // 前面有create字眼,这边要release
    CGPathRelease(path);
}

// 使用keyPath的values属性设置动画
- (void)keyFrameValues
{
    // 1.创建动画
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    
    // 效果
    anim.keyPath = @"position";
    
    // 设置走动路径
    NSValue *v00 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
    NSValue *v0 = [NSValue valueWithCGPoint:CGPointMake(200, 100)];
    NSValue *v1 = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    NSValue *v2 = [NSValue valueWithCGPoint:CGPointMake(100, 200)];
    NSValue *v3 = [NSValue valueWithCGPoint:CGPointMake(100, 100)];

    anim.values = @[v00,v0, v1, v2, v3];
    
    // 可以设置每段的执行时间(比例)
    anim.keyTimes = @[@(0.0), @(0.1), @(0.5), @(0.9), @(1.0)];
    
    // 持续时间
    anim.duration = 2;
    
    // 设置重复次数
    anim.repeatCount = MAXFLOAT;
    
    // 不让返回的语句组合
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 2.动画添加到layer
    [layer addAnimation:anim forKey:nil];
}


@end
