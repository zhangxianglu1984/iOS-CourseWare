//
//  CustomGestureRecognizer.m
//  Demo_UIGestureRecognizer
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "CustomGestureRecognizer.h"

#import <UIKit/UIGestureRecognizerSubclass.h>


@interface CustomGestureRecognizer ()

@property(nonatomic,assign) CGPoint startPoint;

@end

@implementation CustomGestureRecognizer

- (instancetype)init {
	if (self = [super init]) {
		self.allowAbleRange = 50;
	}
	return self;
}

- (instancetype)initWithTarget:(id)target action:(SEL)action {
	if (self = [super initWithTarget:target action:action]) {
		self.allowAbleRange = 50;
	}
	return self;
}

/** 触控方法 **/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
	_startPoint = [touch locationInView:self.view];
	
	NSLog(@"start point: %@",NSStringFromCGPoint(_startPoint));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	UITouch *touch = [touches anyObject];
	
	CGPoint endPoint = [touch locationInView:self.view];
	//触摸点X坐标
	CGFloat touchX = endPoint.x;
	//触摸点Y坐标
	CGFloat touchY = endPoint.y;
	
	NSLog(@"end point: %@",NSStringFromCGPoint(endPoint));
	
	//右下角X坐标
	CGFloat rightBottomX = self.view.bounds.size.width;
	//右下角的Y坐标
	CGFloat rightBottomY = self.view.bounds.size.height;
	
	//判断结束点
	if ((touchX >= rightBottomX-_allowAbleRange && touchX <= rightBottomX) && (touchY >= rightBottomY-_allowAbleRange && touchY <= rightBottomY)) {
		
		//判断开始点
		if((_startPoint.x >= 0 && _startPoint.x <= _allowAbleRange) && (_startPoint.y >= 0 && _startPoint.y <= _allowAbleRange)){
			//表示手势识别成功
			self.state = UIGestureRecognizerStateRecognized;
		}
	}
}



@end
