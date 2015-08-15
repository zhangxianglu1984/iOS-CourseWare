//
//  ZXLTableViewCell.m
//  Demo_TableView(新版)
//
//  Created by zhang xianglu on 15/6/17.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLTableViewCell.h"

@interface ZXLTableViewCell ()

@property(nonatomic,weak) UIView *blueView;


@end

@implementation ZXLTableViewCell

- (instancetype)init
{
	self = [super init];
	if (self) {
		//NSLog(@"Cell init");
	}
	return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		NSLog(@"Cell initWithCoder: %@",_titleLabel);
		
		UIView *blueView = [[UIView alloc] init];
		blueView.backgroundColor = [UIColor blueColor];
		[self addSubview:blueView];
		self.blueView = blueView;
		
		blueView.translatesAutoresizingMaskIntoConstraints = NO;
		
		
		
	}
	return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
	self = [super initWithFrame:frame];
	if (self) {
		//NSLog(@"Cell initWithFrame");
	}
	return self;
}

/**
 *  IB文件里的空间都已经被实例化了
 */
- (void)awakeFromNib {
	[super awakeFromNib];
	
	NSLog(@"Cell awakeFromNib:%@",_titleLabel);
}


- (void)layoutSubviews {
	[super layoutSubviews];
}


@end
