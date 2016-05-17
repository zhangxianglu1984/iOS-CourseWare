//
//  ViewController.m
//  CAAnimation_AnimationGroup
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
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.position = CGPointMake(100, 100);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    [self.view.layer addSublayer:layer];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // groupAnimation可以同时显示不同的动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    
    CABasicAnimation *anim0 = [CABasicAnimation animation];
    anim0.keyPath = @"position";
    anim0.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    
    CABasicAnimation *anim1 = [CABasicAnimation animation];
    anim1.keyPath = @"transform";
    anim1.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI, 1, 1, 0)];
    
    // 把不同的动画放入数组
    group.animations = @[anim0, anim1];
    group.removedOnCompletion = NO;
    group.fillMode = kCAFillModeForwards;
    group.duration = 2;
    [layer addAnimation:group forKey:@"key"];
}

- (IBAction)stopAnim:(id)sender {
    // 使用这种方法来停止动画
    [layer removeAnimationForKey:@"key"];
}

@end
