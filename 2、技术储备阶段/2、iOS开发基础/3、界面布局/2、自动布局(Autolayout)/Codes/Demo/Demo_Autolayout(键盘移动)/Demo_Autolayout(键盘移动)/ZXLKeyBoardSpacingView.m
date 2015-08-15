//
//  ZXLKeyBoardSpacingView.m
//  Demo_Autolayout(键盘移动)
//
//  Created by zhang xianglu on 15/6/18.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLKeyBoardSpacingView.h"

@interface ZXLKeyBoardSpacingView()

@property(nonatomic,strong) NSLayoutConstraint *keyBoardSpacingViewHeightConstraint;


- (void)layoutKeyBoardSpacingView;

- (void)registerKeyBoardNotificationHandlers;

@end

@implementation ZXLKeyBoardSpacingView

+ (instancetype)installToView:(UIView *)parentView {
	if (!parentView) return nil;
	
	ZXLKeyBoardSpacingView *keyBoardSpacingView = [[self alloc] init];
	[parentView addSubview:keyBoardSpacingView];
	
	[keyBoardSpacingView layoutKeyBoardSpacingView];
	
	[keyBoardSpacingView registerKeyBoardNotificationHandlers];
	
	return keyBoardSpacingView;
}

- (void)layoutKeyBoardSpacingView {
	self.backgroundColor = [UIColor blueColor];

	self.translatesAutoresizingMaskIntoConstraints = NO;
	
	if(!self.superview) return;
	
	for (NSString *visualFormat in @[@"H:|[keyBoardSpacingView]|",@"V:[keyBoardSpacingView]|"]) {
		NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"keyBoardSpacingView": self}];
		[self.superview addConstraints:constraints];
	}
	
	self.keyBoardSpacingViewHeightConstraint = [NSLayoutConstraint constraintWithItem:self attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:0.0f];
	
	[self addConstraint:_keyBoardSpacingViewHeightConstraint];
}

- (void)registerKeyBoardNotificationHandlers {
	/**
	 *  注册键盘显示通知处理器
	 */
	[[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillShowNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
		NSDictionary *userInfo = note.userInfo;
		
		//键盘上升动画持续时间
		CGFloat keyBoardUpDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
		
		//键盘上升结束后的Frame
		CGRect keyBoardUpEndFrame = [self.superview convertRect:[userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue] fromView:self.window];
		
		CGRect windowFrame = [self.superview convertRect:self.window.frame fromView:self.window];
		
		CGFloat moveUpOffset = (windowFrame.size.height - keyBoardUpEndFrame.origin.y) + self.superview.frame.origin.y;
		
		NSLog(@"moveUpOffset: %g",moveUpOffset);
		
		_keyBoardSpacingViewHeightConstraint.constant = moveUpOffset;
		[UIView animateWithDuration:keyBoardUpDuration animations:^{
			[self.superview layoutIfNeeded];
		}];
	}];
	
	/**
	 *  注册键盘隐藏通知处理器
	 */
	[[NSNotificationCenter defaultCenter] addObserverForName:UIKeyboardWillHideNotification object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification *note) {
		NSDictionary *userInfo = note.userInfo;
		
		//键盘下降动画持续时间
		CGFloat keyBoardDownDuration = [userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue];
		
		_keyBoardSpacingViewHeightConstraint.constant = 0;
		[UIView animateWithDuration:keyBoardDownDuration animations:^{
			[self.superview layoutIfNeeded];
		}];
	}];
}


@end
