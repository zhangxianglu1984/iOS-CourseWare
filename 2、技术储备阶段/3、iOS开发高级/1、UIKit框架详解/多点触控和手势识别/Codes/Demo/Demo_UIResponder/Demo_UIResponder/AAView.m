//
//  AAView.m
//  Demo_UIResponder
//
//  Created by zhang xianglu on 15/5/4.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AAView.h"

@implementation AAView

/** 开始触摸屏幕时 **/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	//NSUInteger touchesCount = touches.count;
	
	NSLog(@"AAView.touchesBegan..");
	
	/*
	 
		UITouch *touch = [touches anyObject];
		CGPoint touchPoint = [touch locationInView:self];
		NSLog(@"AView.touchesBegan--触摸点的位置:%@",NSStringFromCGPoint(touchPoint));
	 */
	
	//将触摸事件手动交由下一个响应者处理
	[self.nextResponder touchesBegan:touches withEvent:event];
}


/** 触摸屏幕移动的时候 **/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
	//NSUInteger touchesCount = touches.count;
	NSLog(@"AAView.touchesMoved..");
	/*
	 UITouch *touch = [touches anyObject];
	 CGPoint touchPoint = [touch locationInView:self];
	 NSLog(@"AView.touchesMoved--触摸点的位置:%@",NSStringFromCGPoint(touchPoint));
	 */
	[self.nextResponder touchesMoved:touches withEvent:event];
}


/** 触摸离开屏幕时 **/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
	//NSUInteger touchesCount = touches.count;
	NSLog(@"AAView.touchesEnded..");
	/*
	 UITouch *touch = [touches anyObject];
	 CGPoint touchPoint = [touch locationInView:self];
	 NSLog(@"AView.touchesEnded--触摸点的位置:%@",NSStringFromCGPoint(touchPoint));
	 */
	[self.nextResponder touchesEnded:touches withEvent:event];
}


/** 触摸事件被打断时 **/
/*
 - (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event{}
 */

@end
