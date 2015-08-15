//
//  ViewController.m
//  Demo_视图动画(用法)
//
//  Created by zhang xianglu on 15/6/25.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalConstraint;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//视图动画的用法(支持Autolayout)
	[UIView animateWithDuration:2.0f animations:^{
		_horizontalConstraint.constant += 200;
	
		//更新约束
		//第一步，告诉系统，需要更具更新的约束，重新布局
		//修改约束
		[self.view setNeedsLayout];
		//强制系统在当前时刻重新布局
		[self.view layoutIfNeeded];
	
//		//修改视图的属性
//		CGPoint blueViewCenterPoint = _blueView.center;
//		_blueView.center = CGPointMake(blueViewCenterPoint.x + 100, blueViewCenterPoint.y);
//		
//		_blueView.backgroundColor = [UIColor greenColor];
//		
//		_blueView.transform = CGAffineTransformMakeRotation(M_PI);
	}];
}

@end
