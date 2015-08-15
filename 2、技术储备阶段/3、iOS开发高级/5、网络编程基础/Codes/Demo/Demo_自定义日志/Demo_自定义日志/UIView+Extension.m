//
//  UIView+Extension.m
//  Demo_自定义日志
//
//  Created by zhang xianglu on 15/6/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "UIView+Extension.h"

@implementation UIView(Extension)

- (CGFloat)x {
	return self.frame.origin.x;
}

- (void)setX:(CGFloat)x {
	CGRect viewFrame = self.frame;
	viewFrame.origin.x = x;
}

@end
