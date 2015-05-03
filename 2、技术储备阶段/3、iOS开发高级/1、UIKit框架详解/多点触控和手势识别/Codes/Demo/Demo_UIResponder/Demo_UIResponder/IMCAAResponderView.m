//
//  IMCAAResponderView.m
//  Demo_UIResponder
//
//  Created by zhang xianglu on 15/5/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCAAResponderView.h"

@implementation IMCAAResponderView

/** 当一个或多个手指触摸屏幕 **/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCAAResponderView: touchesBegan..");
	
	[self.nextResponder touchesBegan:touches withEvent:event];
}

/** 当一个或多个手指在屏幕上移动 **/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCAAResponderView: touchesMoved..");
}

/** 当一个或多个手指离开屏幕 **/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCAAResponderView: touchesEnded..");
}

/** 当触摸序列被诸如：电话呼入，这样的系统时间中断 **/
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCAAResponderView: touchesCancelled..");
}

@end
