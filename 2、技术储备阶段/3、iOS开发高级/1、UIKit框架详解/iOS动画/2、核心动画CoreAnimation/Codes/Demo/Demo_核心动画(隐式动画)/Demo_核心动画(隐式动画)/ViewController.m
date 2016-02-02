//
//  ViewController.m
//  Demo_核心动画(隐式动画)
//
//  Created by zhang xianglu on 15/6/24.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,weak) CALayer *blueLayer;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	//COCOS2d Layer
	CALayer *blueLayer = [CALayer layer];
	
	blueLayer.backgroundColor = [UIColor blueColor].CGColor;
	
	blueLayer.bounds = CGRectMake(0, 0, 100, 100);
	blueLayer.anchorPoint = CGPointMake(0.5, 0.5);
	blueLayer.position = CGPointMake(200, 250);
	
//	//控制图层速度（0,1）
	blueLayer.speed = 0.1f;
	
	[self.view.layer addSublayer:blueLayer];
	
	self.blueLayer = blueLayer;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//_blueLayer.backgroundColor = [UIColor redColor].CGColor;
	//_blueLayer.position = CGPointMake(0, 200);
	//_blueLayer.bounds = CGRectMake(0, 0, 300, 300);
    
	_blueLayer.transform = CATransform3DMakeRotation(2 * M_PI, 1, 1, 1);
    
//	_blueLayer.transform = CATransform3DMakeScale(2.0, 1, 1);
	
//	_blueLayer.transform = CATransform3DMakeTranslation(200, 200, 0);	
//
//	_blueLayer.opacity = 0.0;
	
}

@end
