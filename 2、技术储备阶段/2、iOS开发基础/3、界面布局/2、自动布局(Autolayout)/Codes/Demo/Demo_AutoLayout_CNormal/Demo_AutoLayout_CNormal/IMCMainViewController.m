//
//  IMCMainViewController.m
//  Demo_AutoLayout_CNormal
//
//  Created by zhang xianglu on 15/5/27.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

//@property (weak, nonatomic) IBOutlet UIView *greenView;

@property(nonatomic,strong) NSLayoutConstraint *redViewBottomConstraint;


@end

@implementation IMCMainViewController

- (IBAction)startButtonClickedAction:(UIButton *)sender {

}

- (IBAction)updateButtonClickedAction:(UIButton *)sender {
	//NSLog(@"%@",self.view.constraints);

	[self.view setNeedsLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	UIView *redView = [[UIView alloc] init];
	redView.backgroundColor = [UIColor redColor];
	[self.view addSubview:redView];
	redView.translatesAutoresizingMaskIntoConstraints = NO;
	
	
	UIView *greenView = [[UIView alloc] init];
	greenView.backgroundColor = [UIColor greenColor];
	[self.view addSubview:greenView];
	greenView.translatesAutoresizingMaskIntoConstraints = NO;
	
 /**
  *  1、redView紧贴左边
  *  2、greenView紧贴右边
  *  3、高度100，高度相等
  *  4、redView.width=greenView.width
  *  5、redView.trailing = greenView.leading
  */
	NSLayoutConstraint *redViewLeadingConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0f constant:0];
	[self.view addConstraint:redViewLeadingConstraint];
	
	self.redViewBottomConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
	
	[self.view addConstraint:_redViewBottomConstraint];
	
	NSLayoutConstraint *redViewHeightConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100];
	[redView addConstraint:redViewHeightConstraint];
	
	NSLayoutConstraint *greenViewTrailingConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0f constant:0];
	[self.view addConstraint:greenViewTrailingConstraint];
	
	NSLayoutConstraint *greenViewBottomConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
	[self.view addConstraint:greenViewBottomConstraint];
	
	NSLayoutConstraint *greenViewHeightConstraint = [NSLayoutConstraint constraintWithItem:greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0f constant:100];
	[greenView addConstraint:greenViewHeightConstraint];
	

	UIView *blueView = [[UIView alloc] init];
	blueView.backgroundColor = [UIColor blueColor];
	blueView.tag = 110;
	[self.view addSubview:blueView];
	blueView.translatesAutoresizingMaskIntoConstraints = NO;
	
	NSLayoutConstraint *topAlignConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeTop multiplier:1.0f constant:0];
	[self.view addConstraint:topAlignConstraint];
	
	NSLayoutConstraint *bottomAlignConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeBottom multiplier:1.0f constant:0];
	[self.view addConstraint:bottomAlignConstraint];
	
	NSLayoutConstraint *blueViewLeadingConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeTrailing
		multiplier:1.0f constant:20];
	[self.view addConstraint:blueViewLeadingConstraint];
	
	NSLayoutConstraint *blueViewTrailingConstraint = [NSLayoutConstraint constraintWithItem:blueView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeLeading
		multiplier:1.0f constant:-20];
	[self.view addConstraint:blueViewTrailingConstraint];
	
	NSLayoutConstraint *rbWidthEqualConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:blueView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
	[self.view addConstraint:rbWidthEqualConstraint];
 	
	NSLayoutConstraint *rgWidthEqualConstraint = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:greenView attribute:NSLayoutAttributeWidth multiplier:1.0f constant:0];
	[self.view addConstraint:rgWidthEqualConstraint];
	
	
	
	//关闭相关的视图的autoResizing
	//_greenView.translatesAutoresizingMaskIntoConstraints = NO;
	/*
	NSArray *greenViewConstraints = _greenView.constraints;
	NSLog(@"greenView: %@",greenViewConstraints);
	
	NSLog(@"self.view: %@",self.view.constraints);
	*/
	
	/**
	 *  构造一个完成公式 AView.property = BView.property*multiple + constant
	 */
	/*
	NSLayoutConstraint *centerXConstraint = [NSLayoutConstraint constraintWithItem:_greenView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0f constant:0];
	
	NSLog(@"%f",centerXConstraint.priority);
	
	[self.view addConstraint:centerXConstraint];
	
	NSLayoutConstraint *centerYConstraint = [NSLayoutConstraint constraintWithItem:_greenView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0f constant:0];
	[self.view addConstraint:centerYConstraint];
	
	NSLog(@"%f",centerYConstraint.priority);
	
	NSLayoutConstraint *widthConstraint = [NSLayoutConstraint constraintWithItem:_greenView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
	
	[_greenView addConstraint:widthConstraint];
	
	NSLayoutConstraint *heightConstraint = [NSLayoutConstraint constraintWithItem:_greenView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
	
	
	[_greenView addConstraint:heightConstraint];
	*/
	
	
}




@end
