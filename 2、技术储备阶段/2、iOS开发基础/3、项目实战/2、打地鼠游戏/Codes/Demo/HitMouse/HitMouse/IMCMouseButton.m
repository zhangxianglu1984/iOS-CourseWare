//
//  IMCMouseButton.m
//  PlayMouse
//
//  Created by zhang xianglu on 15/4/21.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMouseButton.h"

/** 没有地鼠的图片 **/
static NSString *const kImageNameOfMouseDisappear = @"btn_img_normal_hide";

/** 有地鼠的图片 **/
static NSString *const kImageNameOfMouseAppear = @"btn_img_normal_show";

/** 打中地鼠的图片 **/
static NSString *const kImageNameOfMouseHitted = @"btn_img_highlighted";

@interface IMCMouseButton ()
	
/** 地鼠显示状态 **/
@property(nonatomic,assign) BOOL isMouseAppear;

/** 当自己被点击时的处理方法 **/
- (void)onClicked;

@end


@implementation IMCMouseButton
/** IB文件来创建该类的对象，要执行这个初始化方法 **/
- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.isMouseAppear = NO;
		[self addTarget:self action:@selector(onClicked) forControlEvents:UIControlEventTouchUpInside];
	}
	return self;
}

- (void)appearMouse {
	self.isMouseAppear = YES;
}

- (void)disappearMouse {
	self.isMouseAppear = NO;
}

#pragma mark - Setters And Getters
- (void)setIsMouseAppear:(BOOL)isMouseAppear {
	_isMouseAppear = isMouseAppear;
	//根据地鼠的状态，设置图片
	if (_isMouseAppear) {
		//设置显示地鼠的图片
		[self setImage:[UIImage imageNamed:kImageNameOfMouseAppear] forState:UIControlStateNormal];
		//设置点击后的图片
		[self setImage:[UIImage imageNamed:kImageNameOfMouseHitted] forState:UIControlStateHighlighted];
	}else {
		[self setImage:[UIImage imageNamed:kImageNameOfMouseDisappear] forState:UIControlStateNormal];
		
		[self setImage:[UIImage imageNamed:kImageNameOfMouseDisappear] forState:UIControlStateHighlighted];
	}
}

#pragma mark - Event Methods
- (void)onClicked {
	if (_isMouseAppear == YES) {
		self.isMouseAppear = NO;
		[_delegate onAppearedMouseHitted:self];
	}
}

@end
