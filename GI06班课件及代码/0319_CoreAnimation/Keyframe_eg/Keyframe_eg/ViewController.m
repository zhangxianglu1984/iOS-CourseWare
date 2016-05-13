//
//  ViewController.m
//  Keyframe_eg
//
//  Created by jianfeng on 15/3/19.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *arm;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arm.layer.anchorPoint = CGPointMake(0.5, 1);
    self.arm.layer.position = CGPointMake(185,226 );
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CAKeyframeAnimation *anim = [CAKeyframeAnimation animation];
    anim.keyPath = @"transform";
    
    anim.removedOnCompletion = NO;
    anim.fillMode = kCAFillModeForwards;
    
    NSValue *v00 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1)];
    NSValue *v0 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
    NSValue *v1 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(0, 0, 0, 1)];
//    NSValue *v2 = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI_4, 0, 0, 1)];
    anim.values = @[v00, v0, v1];
    
    anim.repeatCount = 5;
    anim.duration = 1;
    
    [self.arm.layer addAnimation:anim forKey:nil];
    
    
    
}

@end
