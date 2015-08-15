//
//  IMCMainViewController.m
//  Demo_AutoLayout_CVFL
//
//  Created by zhang xianglu on 15/5/27.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

//@property(nonatomic,weak) UIView *blueView;
//@property(nonatomic,weak) UIView *redView;

@end

/**
 *  Visual Format Language == VFL -> 布局
 */

@implementation IMCMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIView *blueView = [[UIView alloc] init];
	blueView.backgroundColor = [UIColor blueColor];
	[self.view addSubview:blueView];
	blueView.translatesAutoresizingMaskIntoConstraints = NO;
	
	UIView *redView = [[UIView alloc] init];
	redView.backgroundColor = [UIColor redColor];
	[self.view addSubview:redView];
	redView.translatesAutoresizingMaskIntoConstraints = NO;
	
	UIView *greenView = [[UIView alloc] init];
	greenView.backgroundColor = [UIColor greenColor];
	[self.view addSubview:greenView];
	greenView.translatesAutoresizingMaskIntoConstraints = NO;
	
	/**
	 *  1、格式化字符串
	 *  2、选项-->对齐方式
	 *  3、度量
	 *  4、容器-->包含了约束所涉及到的视图
	 *  优点：直观的将几个视图同时布局
	 *  V:Vertical H:Hort...
	 */
	 NSString *hVFL = @"H:|[blueView(==redView)]-20-[redView(==greenView)]-20-[greenView(==redView)]|";
	 NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hVFL 
							 options:0 
							 metrics:nil 
							   views:@{@"blueView": blueView,@"redView": redView,@"greenView": greenView}];
	[self.view addConstraints:hConstraints];
	
	NSString *vVFL = @"V:[blueView(==100@100)][redView(==blueView)][greenView(==blueView)]|";
	NSArray *bottomConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"blueView": blueView,
				@"redView": redView,
				@"greenView": greenView}];
	[self.view addConstraints:bottomConstraints];
	
	
	
	NSLayoutConstraint *blueViewHeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:300];
	blueViewHeightConstraint.priority = 100;
	[blueView addConstraint:blueViewHeightConstraint];
	
	/*
	
	NSArray *blueViewBottomConstraint = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[blueView]|" options:0 metrics:nil views:@{@"blueView": blueView}];
	[self.view addConstraints:blueViewBottomConstraint];
	*/
	/*
	NSLayoutConstraint *redViewHeightConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:200];
	[redView addConstraint:redViewHeightConstraint];
	
	NSLayoutConstraint *greenViewHeightConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:300];
	[greenView addConstraint:greenViewHeightConstraint];
	*/
	/*
	NSLayoutConstraint *brViewHeightConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
	[self.view addConstraint:brViewHeightConstraint];
	
	NSLayoutConstraint *rgViewHeightConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeHeight multiplier:1.0f constant:0];
	[self.view addConstraint:rgViewHeightConstraint];
	*/ 
	 
	/*
	NSString *hVFL = @"H:|[blueView(==redView)][redView(==blueView)]|";
	NSArray *hConstraints = [NSLayoutConstraint constraintsWithVisualFormat:hVFL 
		options:0 
		metrics:nil 
		views:@{@"blueView": blueView,
				@"redView": redView}];
	[self.view addConstraints:hConstraints];
	
	
	NSString *vVFL = @"V:|[blueView(==100)][redView(==blueView)]";
	NSArray *vConstraints = [NSLayoutConstraint constraintsWithVisualFormat:vVFL options:0 metrics:nil views:@{@"blueView": blueView,
				@"redView": redView}];
	[self.view addConstraints:vConstraints];
	*/
	
}


@end
