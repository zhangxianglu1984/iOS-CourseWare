//
//  ViewController.m
//  Demo_核心动画(图标摇动)
//
//  Created by zhang xianglu on 15/6/25.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *iconView;


- (IBAction)startAnimButtonClickedAction:(UIButton *)sender;
- (IBAction)stopAnimButtonClickedAction:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	//_iconView.layer.anchorPoint = CGPointMake(1.0f, 0);
	
	_iconView.layer.borderColor = [UIColor grayColor].CGColor;
	_iconView.layer.borderWidth = 5.0f;
	
	_iconView.layer.cornerRadius = 10.0f;
	
	_iconView.layer.masksToBounds = YES;
}


- (IBAction)startAnimButtonClickedAction:(UIButton *)sender {
	CABasicAnimation *rotationAnim = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
	
	rotationAnim.duration = 1.0f;
	rotationAnim.autoreverses = YES;
	rotationAnim.repeatCount = HUGE_VALF;
	
	rotationAnim.fromValue = @(-5.0f / 180.0 * M_PI);
	rotationAnim.toValue = @(5.0f / 180.0 * M_PI);
	
	[_iconView.layer addAnimation:rotationAnim forKey:@"rotationAnim"];
}

- (IBAction)stopAnimButtonClickedAction:(UIButton *)sender {
	[_iconView.layer removeAnimationForKey:@"rotationAnim"];
}
@end
