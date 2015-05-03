//
//  IMCMainViewController.m
//  Demo_UIResponder
//
//  Created by zhang xianglu on 15/5/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

#import "IMCAResponderView.h"
#import "IMCAAResponderView.h"
#import "IMCAAAResponderView.h"

@interface IMCMainViewController ()

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	
	
	
}

/** 当一个或多个手指开始触摸屏幕 **/
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCMainViewController: touchesBegan..");
	
	[self.nextResponder touchesBegan:touches withEvent:event];
}

/** 当一个或多个手指在屏幕上移动 **/
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCMainViewController: touchesMoved..");
}

/** 当一个或多个手指离开屏幕 **/
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCMainViewController: touchesEnded..");
}

/** 当触摸序列被诸如：电话呼入，这样的系统事件中断 **/
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"IMCMainViewController: touchesCancelled..");
}



@end
