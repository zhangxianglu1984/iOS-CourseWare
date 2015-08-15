//
//  ViewController.m
//  Demo_核心动画(心跳)
//
//  Created by zhang xianglu on 15/6/25.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *heartView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	
	scaleAnim.fromValue = @0.3f;
	scaleAnim.toValue = @0.8f;
	
	CABasicAnimation *opacityAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
	
	opacityAnim.fromValue = @0.0f;
	opacityAnim.toValue = @0.7f;
	
	CAAnimationGroup *animGroup = [CAAnimationGroup animation];
	animGroup.animations = @[scaleAnim,opacityAnim];
	
	animGroup.duration = 0.3f;
	animGroup.repeatCount = HUGE_VALF;
	
	[_heartView.layer addAnimation:animGroup forKey:nil];
}

@end
