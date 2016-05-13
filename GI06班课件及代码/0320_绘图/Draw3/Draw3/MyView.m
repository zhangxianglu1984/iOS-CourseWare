//
//  MyView.m
//  Draw3
//
//  Created by jianfeng on 15/3/20.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "MyView.h"

@implementation MyView

// 系统自动调用,不能手动调用
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddArc(context, rect.size.width/ 2, rect.size.height/ 2, self.radius, 0, M_PI * 2, 0);
    [[UIColor lightGrayColor]set];
    CGContextFillPath(context);
}

- (void)setRadius:(float)radius
{
    _radius = radius;
    // 调用此方法后,系统会自动调用drawRect:方法
    [self setNeedsDisplay];
}


@end
