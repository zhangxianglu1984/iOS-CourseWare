//
//  ViewController.m
//  CAAnimation_Basic
//
//  Created by jianfeng on 15/3/19.
//  Copyright (c) 2015年 test. All rights reserved.
//

// BasicAnimation

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *layer;
    UIView *view;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    layer = [CALayer layer];
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(200, 200);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
    
    view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CALayer *layer1 = view.layer;
    
    // 1.创建Animation
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 要执行什么样的动画
    anim.keyPath = @"transform";
    
    // 缩放结果是什么呀
//    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
    anim.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeTranslation(200, 300, 0)];
    
    // 下面两句共同决定了layer的动画执行完之后不返回初始位置
    anim.removedOnCompletion = NO; // 执行完之后不要删除动画
    anim.fillMode = kCAFillModeForwards;// 保存的是最新的动画状态
    
    // 设置动画的执行时间
    anim.duration = 2;
    
    anim.delegate = self;
    
    // 2.添加到layer上
    [layer1 addAnimation:anim forKey:nil];
}

// 核心动画执行后,取到的frame还是初始值,和动画之前的值没有变化
- (void)animationDidStart:(CAAnimation *)anim
{
    NSLog(@"begin");
    NSLog(@"%@",NSStringFromCGRect(view.frame));
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    NSLog(@"stop");
    NSLog(@"%@",NSStringFromCGRect(view.frame));
}

- (void)boundsTest
{
    // 1.创建Animation
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 要执行什么样的动画
    anim.keyPath = @"bounds";
    
    // 缩放结果是什么呀
    anim.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 200, 200)];
    
    // 下面两句共同决定了layer的动画执行完之后不返回初始位置
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 设置动画的执行时间
    anim.duration = 2;
    
    // 2.添加到layer上
    [layer addAnimation:anim forKey:nil];
}

- (void)positionTest
{
    // 1.创建Animation
    CABasicAnimation *anim = [CABasicAnimation animation];
    // 要执行什么样的动画
    anim.keyPath = @"position";
    // 从哪里开始
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    // 到哪里去
    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(300, 300)];
    // 表示在当前基础上增加的量
    //    anim.byValue = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    
    // 下面两句共同决定了layer的动画执行完之后不返回初始位置
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    // 设置动画的执行时间
    anim.duration = 2;
    
    // 2.添加到layer上
    [layer addAnimation:anim forKey:nil];
}

@end
