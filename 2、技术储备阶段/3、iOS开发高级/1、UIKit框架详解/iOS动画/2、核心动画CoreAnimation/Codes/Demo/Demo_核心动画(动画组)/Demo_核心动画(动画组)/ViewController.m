//
//  ViewController.m
//  Demo_核心动画(动画组)
//
//  Created by zhang xianglu on 15/6/25.
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
	//平移动画
	CABasicAnimation *translationAnim = [CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
	
	translationAnim.toValue = @200.0f;
	
	//缩放动画
	CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
	
	scaleAnim.toValue = @2.0;
	
	//旋转动画
	CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	rotationAnim.toValue = @(30.0 / 180.0 * M_PI);
	
	//动画组
	CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
	animationGroup.animations = @[translationAnim,scaleAnim,rotationAnim];
	
	animationGroup.duration = 4.0f;
	animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:@"easeInEaseOut"];
	animationGroup.autoreverses = YES;
	
	[_blueView.layer addAnimation:animationGroup forKey:@"animationGroup"];
}





@end
