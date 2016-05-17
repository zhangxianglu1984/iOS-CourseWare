//
//  MyView.m
//  Draw2
//
//  Created by jianfeng on 15/3/20.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "MyView.h"

@implementation MyView

// 使用Quartz2D使头像变圆形
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGRect myRect = CGRectMake(20, 20, 100, 100);
    CGContextAddEllipseInRect(context, myRect);
    
    // 指定显示的范围(指定范围要在渲染之前)
    CGContextClip(context);
    CGContextStrokePath(context);
    
    UIImage *image = [UIImage imageNamed:@"01ha.jpg"];
    [image drawInRect:myRect];
    
    // 超出范围的不能显示
    NSString *str = @"dog";
    [str drawAtPoint:CGPointMake(0, 0) withAttributes:nil];
    
    
}


@end
