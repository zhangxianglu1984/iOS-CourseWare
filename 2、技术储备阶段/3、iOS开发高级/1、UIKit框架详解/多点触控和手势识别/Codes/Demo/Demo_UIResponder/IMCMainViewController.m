//
//  IMCMainViewController.m
//  Demo_UIResponder
//
//  Created by zhang xianglu on 15/5/4.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

#import "AView.h"

@interface IMCMainViewController ()

@property (weak, nonatomic) IBOutlet AView *aView;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIResponder Methods
/** 开始触摸屏幕时 **/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	//NSUInteger touchesCount = touches.count;
	
	UITouch *touch = [touches anyObject];
	CGPoint touchPoint = [touch locationInView:self.view];
	NSLog(@"IMCMainViewController.touchesBegan--触摸点的位置:%@",NSStringFromCGPoint(touchPoint));
}

/** 触摸屏幕移动的时候 **/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	//NSUInteger touchesCount = touches.count;
	
	UITouch *touch = [touches anyObject];
	CGPoint touchPoint = [touch locationInView:self.view];
	NSLog(@"IMCMainViewController.touchesMoved--触摸点的位置:%@",NSStringFromCGPoint(touchPoint));
}

/** 触摸离开屏幕时 **/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	//NSUInteger touchesCount = touches.count;
	
	UITouch *touch = [touches anyObject];
	CGPoint touchPoint = [touch locationInView:self.view];
	NSLog(@"IMCMainViewController.touchesEnded--触摸点的位置:%@",NSStringFromCGPoint(touchPoint));
}

/** 触摸事件被打断时 **/
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}

@end
