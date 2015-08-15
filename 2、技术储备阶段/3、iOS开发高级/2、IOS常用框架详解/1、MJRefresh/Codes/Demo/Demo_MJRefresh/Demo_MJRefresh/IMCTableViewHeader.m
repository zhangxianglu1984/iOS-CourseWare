//
//  IMCTableViewHeader.m
//  Demo_MJRefresh
//
//  Created by zhang xianglu on 15/6/26.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCTableViewHeader.h"
#import "FLAnimatedImage.h"

@interface IMCTableViewHeader()

@property(nonatomic,weak) FLAnimatedImageView *iconImageView;

@end

@implementation IMCTableViewHeader

/** 初始化:创建子视图 */
- (void)prepare {
	[super prepare];
	
	//self.mj_h = 100.0f;
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"huojian" ofType:@"gif"];
	
	NSData *iconImageData = [NSData dataWithContentsOfFile:filePath];
	
	
	FLAnimatedImage *iconImage = [FLAnimatedImage animatedImageWithGIFData:iconImageData];
	FLAnimatedImageView *iconImageView = [[FLAnimatedImageView alloc] init];
	iconImageView.animatedImage = iconImage;
	
	[self addSubview:iconImageView];
	self.iconImageView = iconImageView;
	
}


/** 摆放子控件frame */
- (void)placeSubviews {
	[super placeSubviews];
	
	_iconImageView.frame = CGRectMake(0, 0, 50, 50);
}

@end
