//
//  ViewController.m
//  Demo_核心动画(关键帧动画)
//
//  Created by zhang xianglu on 15/6/24.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CAKeyframeAnimation *keyframeAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation"];
	
	keyframeAnimation.duration = 10;
	
	keyframeAnimation.keyTimes = @[@0.0,@0.1,@0.5,@0.6,@1.0];
	
	CAMediaTimingFunction *func_1 = [CAMediaTimingFunction functionWithName:@"linear"];
	CAMediaTimingFunction *func_2 = [CAMediaTimingFunction functionWithName:@"easeOut"];
	CAMediaTimingFunction *func_3 = [CAMediaTimingFunction functionWithName:@"linear"];
	CAMediaTimingFunction *func_4 = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
	
	keyframeAnimation.timingFunctions = @[func_1,func_2,func_3,func_4];
	
	NSValue *original = [NSValue valueWithCGPoint:CGPointZero];
	
	NSValue *rightOffset = [NSValue valueWithCGPoint:CGPointMake(100, 0)];
	NSValue *downOffset = [NSValue valueWithCGPoint:CGPointMake(100, 100)];
	NSValue *leftOffset = [NSValue valueWithCGPoint:CGPointMake(0, 100)];
	NSValue *upOffset = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
	
	keyframeAnimation.values = @[original,rightOffset,downOffset,leftOffset,upOffset];
	
	
	[_blueView.layer addAnimation:keyframeAnimation forKey:nil];
}













@end
