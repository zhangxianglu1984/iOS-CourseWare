//
//  ViewController.m
//  Demo_核心动画(显式动画)
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
	//第一步：创建相关动画实例(KVC)
	CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    
//    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    
	//第二步：配置动画实例的相关属性
	basicAnimation.duration = 2.0;
	//basicAnimation.repeatCount = HUGE_VALF;
    
    basicAnimation.beginTime = CACurrentMediaTime() + 2.0;
    
    basicAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
	
//	//避免动画复位
//	basicAnimation.fillMode = kCAFillModeForwards;
//	basicAnimation.removedOnCompletion = NO;
	
	//起始值，可选。如果不设置，表示属性的当前值
	//basicAnimation.fromValue = (id)[UIColor blueColor].CGColor;
	CGSize offset = CGSizeMake(0, 300);
	basicAnimation.toValue = [NSValue valueWithCGSize:offset];
    
    //basicAnimation.toValue = @(3.14);
	
	//第三步：将动画实例加到视图的图层中,动画自动执行
    [_blueView.layer addAnimation:basicAnimation forKey:nil];
}








@end
