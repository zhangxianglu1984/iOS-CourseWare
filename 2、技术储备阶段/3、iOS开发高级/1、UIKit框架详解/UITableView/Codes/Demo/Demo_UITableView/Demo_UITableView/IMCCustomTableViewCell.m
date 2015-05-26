//
//  IMCCustomTableViewCell.m
//  Demo_UITableView
//
//  Created by zhang xianglu on 15/5/14.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCCustomTableViewCell.h"

static const NSUInteger kSelectedBackgroundViewSeparatorTag = 110;

static const NSUInteger kBackgroundViewSeparatorTag = 111;

@interface IMCCustomTableViewCell ()

- (void)p_initSubViews;

@end

@implementation IMCCustomTableViewCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.selectionStyle = UITableViewCellSelectionStyleGray;
		self.backgroundColor = [UIColor clearColor];
		
		[self p_initSubViews];
	}
	return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	/** 非选中视图的分割线 **/
	UIView *backgroundViewSeparator = [self.backgroundView viewWithTag:kBackgroundViewSeparatorTag];
	backgroundViewSeparator.frame = CGRectMake(0, self.backgroundView.bounds.size.height-1, self.backgroundView.bounds.size.width, 1);
	
	/** 选中视图的分割线 **/
	UIView *selectedBackgroundViewSeparator = [self.selectedBackgroundView viewWithTag:kSelectedBackgroundViewSeparatorTag];
	selectedBackgroundViewSeparator.frame = CGRectMake(0, self.selectedBackgroundView.bounds.size.height-1, self.selectedBackgroundView.bounds.size.width, 1);
}

#pragma mark - Private Methods
- (void)p_initSubViews {
	/** 创建非选中背景视图 **/
	UIView *backgroundView = [[UIView alloc] init];
	backgroundView.frame = CGRectZero;
	backgroundView.backgroundColor = [UIColor clearColor];
	
	/** 非选中视图分割线 **/
	UIView *backgroudViewSeparator = [[UIView alloc] init];
	backgroudViewSeparator.frame = CGRectZero;
	backgroudViewSeparator.backgroundColor = [UIColor blueColor];
	backgroudViewSeparator.tag = kBackgroundViewSeparatorTag;
	[backgroundView addSubview:backgroudViewSeparator];
	
	self.backgroundView = backgroundView;
	
	
	/** 创建选中背景视图 **/
	UIView *selectedBackgroundView = [[UIView alloc] init];
	selectedBackgroundView.frame = CGRectZero;
	selectedBackgroundView.backgroundColor = [UIColor greenColor];
	
	/** 选中视图分割线 **/
	UIView *selectedBackgroudViewSeparator = [[UIView alloc] init];
	selectedBackgroudViewSeparator.frame = CGRectZero;
	selectedBackgroudViewSeparator.backgroundColor = [UIColor blueColor];
	selectedBackgroudViewSeparator.tag = kSelectedBackgroundViewSeparatorTag;
	[selectedBackgroundView addSubview:selectedBackgroudViewSeparator];
	
	self.selectedBackgroundView = selectedBackgroundView;
}











@end
