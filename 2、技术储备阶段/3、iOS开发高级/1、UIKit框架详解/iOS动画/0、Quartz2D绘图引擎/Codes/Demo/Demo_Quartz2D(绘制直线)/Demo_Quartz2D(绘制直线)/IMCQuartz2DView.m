//
//  IMCQuartz2DView.m
//  Demo_Quartz2D(绘制直线)
//
//  Created by zhang xianglu on 15/9/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCQuartz2DView.h"

@interface IMCQuartz2DView ()

/**
 *  绘制直线
 */
- (void)drawLine;

@end


@implementation IMCQuartz2DView

/**
 *  系统在每次绘制该视图对象时调用
*/
- (void)drawRect:(CGRect)rect {
    [self drawLine];
}

#pragma mark - Private Methods

- (void)drawLine {
	//1、获取上下文(与当前视图绑定的上下文)
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	//2、创建并设置路径
	CGMutablePathRef mutablePath = CGPathCreateMutable();
	//画线: 1)设置起始点；2)设置目标点
	CGPathMoveToPoint(mutablePath, NULL, 50, 50);
	CGPathAddLineToPoint(mutablePath, NULL, 150, 150);
	CGPathAddLineToPoint(mutablePath, NULL, 50, 150);
	
	//封闭路径
	//CGPathAddLineToPoint(mutablePath, NULL, 50, 50);
	CGPathCloseSubpath(mutablePath);
	
	//3、将路径添加到上下文
	CGContextAddPath(context, mutablePath);
	
	
	//4、设置上下文属性
	//设置线条颜色(RGBA)
	CGContextSetRGBStrokeColor(context, 1.0, 0, 0, 1);
	//设置线宽
	CGContextSetLineWidth(context, 5.0);
	//设置填充颜色
	CGContextSetRGBFillColor(context, 0.0, 1.0, 0.0, 1.0);
	//设置端点样式
	CGContextSetLineCap(context, kCGLineCapRound);
	//设置线条的连接点样式
	CGContextSetLineJoin(context, kCGLineJoinRound);
	//设置虚线样式
	CGFloat lengths[] = {20.0,10.0}; 
	CGContextSetLineDash(context, 5.0, lengths, 2);
	
	
	//5、绘制路径
	 /**
	  *  kCGPathFill 填充(实心),
	  kCGPathStroke 画线(空心),
	  kCGPathFillStroke 既画线又填充,
	  */
	CGContextDrawPath(context, kCGPathFillStroke);
	
	//6、释放路径
	CGPathRelease(mutablePath);
}


@end
