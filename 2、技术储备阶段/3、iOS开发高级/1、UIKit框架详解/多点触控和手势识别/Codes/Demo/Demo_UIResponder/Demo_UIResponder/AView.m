//
//  AView.m
//  Demo_UIResponder
//
//  Created by zhang xianglu on 15/5/4.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AView.h"

@interface AView ()

@property(nonatomic,weak) UIView *pinkView;

@end

@implementation AView

- (id)initWithCoder:(NSCoder *)coder{
	if (self = [super initWithCoder:coder]) {
		self.pinkView = [self viewWithTag:324];
		
		//视图是否响应事件
		self.userInteractionEnabled = NO;
		
		//多点触摸的开关
		self.multipleTouchEnabled = YES;
	}
	return self;
}

/** 开始触摸屏幕时 **/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	
	if (touch.tapCount == 2) {
		
	}
	
	NSLog(@"TouchCount: %lu",touches.count);
	
	CGPoint touchPoint = [touch locationInView:self];
	
	_pinkView.center = touchPoint;
	
}


/** 触摸屏幕移动的时候 **/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	UITouch *touch = [touches anyObject];
	
	CGPoint touchPoint = [touch locationInView:self];
	
	_pinkView.center = touchPoint;
}


/** 触摸离开屏幕时 **/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
}


/** 触摸事件被打断时 **/
/*
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}
*/

@end
