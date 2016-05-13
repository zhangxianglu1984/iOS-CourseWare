//
//  DrawView.m
//  Draw
//
//  Created by jianfeng on 15/3/20.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

/**
 *  在drawRect:中使用UIGraphicsGetCurrentContext()得到的上下文输入目标就是layer
 *  在同一上下文中后面设置的图形状态会覆盖前面的,所以如果要两部分路径显示不同的状态,就需要渲染两次
 */

// 当view第一次要显示的时候调用
- (void)drawRect:(CGRect)rect {
    // 1.获取当前view的图形上下文
    // 只有在drawRect:方法里面调用UIGraphicsGetCurrentContext()函数,才能获取图形上下文,否则获取到的是空
    CGContextRef context = UIGraphicsGetCurrentContext();
    
//    [self drawLineWithContext:context];
//    [self drawTriangleWithContext:context];
//    [self drawRectWithContext:context];
//    [self drawEllipseWithContext:context];
//    [self drawArcWithContext:context];
//    [self drawText];
//    [self drawImage];
//    [self drawBezierWithContext:context];
//    [self matrixOperationWithContext:context];
    
//    [self drawTwoCircle:context];
    [self drawWithPathWithContext:context];
}

// 绘制直线
- (void)drawLineWithContext:(CGContextRef) context
{
    // 2.绘制图形到上下文
    // 2.1起点
    CGContextMoveToPoint(context, 20, 20);
    
    // 2.2终点
    CGContextAddLineToPoint(context, 100, 100);
    
    //    CGContextMoveToPoint(context, 120, 120);
    
    // 如果第二条线的起点从第一条线的中点开始,那么可以直接调用addLineToPoint的方法
    CGContextAddLineToPoint(context, 180 , 20);
    
    // 设置颜色
    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1.0);
    
    // 设置宽度
    CGContextSetLineWidth(context, 10);
    
    // 设置线条两头的样式
    CGContextSetLineCap(context, kCGLineCapRound);
    
    // 设置连接处的样式
    CGContextSetLineJoin(context, kCGLineJoinRound);
    
    // 3.把图形上下文里面的内容渲染到layer
    // 绘制一个空心的路径
    CGContextStrokePath(context);
}

// 三角形(多边形)
- (void)drawTriangleWithContext:(CGContextRef)context
{
    // 2.绘制图形到上下文
    // 2.1起点
    CGContextMoveToPoint(context, 20, 20);
    
    // 2.2第二个点
    CGContextAddLineToPoint(context, 100, 100);
    
    // 2.3第三个点
    CGContextAddLineToPoint(context, 180 , 20);
    
    // 2.4 关闭路径
    CGContextClosePath(context);
    
    // 设置颜色 (颜色等的设置记得要放在渲染之前)
    [[UIColor orangeColor] set];
    
    
    // 下面四个方法需要和渲染的方法匹配
//    CGContextSetRGBStrokeColor(context, 1, 0, 0, 1.0);
    // OC方法设置颜色
//    [[UIColor blueColor] setStroke];
    
//    CGContextStrokePath(context);
    
//    CGContextSetRGBFillColor(context, 1, 0, 0, 1.0);
    // OC方法设置颜色
//    [[UIColor purpleColor]setFill];
    
    CGContextFillPath(context);
}

// 矩形
- (void)drawRectWithContext:(CGContextRef)context
{
    // 绘制矩形方法一:绘制多边形方法(上面绘制三角形的方法)
    // 方法二:
//    CGContextAddRect(context, CGRectMake(30, 30, 100, 80));
//    CGContextStrokePath(context);
    
    // 方法三:把方法二的两句话结合成一句
//    CGContextStrokeRect(context, CGRectMake(50, 50, 50, 50));
//    CGContextFillRect(context, CGRectMake(50, 50, 50, 50));
    
    // 方法四:使用OC的语法
//    UIRectFill(CGRectMake(100, 100, 80, 60));
    // 空心矩形,使用的字眼是frame而不是stroke
    UIRectFrame(CGRectMake(100, 100, 60, 80));
}

// 椭圆
- (void)drawEllipseWithContext:(CGContextRef)context
{
    // 方法一:
    // 2.绘制
    CGContextAddEllipseInRect(context, CGRectMake(20, 20, 150, 150));
    [[UIColor purpleColor] set];
    // 3.渲染
    CGContextFillPath(context);
    
//    // 方法二:通过绘制弧线的方式绘制圆形
//    CGContextAddArc(context, 50, 50, 50, 0, M_PI * 2, 0);
//    [[UIColor orangeColor] set];
//    CGContextFillPath(context);
}

// 弧线
- (void)drawArcWithContext:(CGContextRef)context
{
    // 2.绘制
    // 参数:
    // 1:CGContextRef 上下文
    // 2和3:圆弧所在的圆心的坐标
    // 4:圆弧所在圆的半径
    // 5和6:圆弧开始的弧度和结束的弧度(0度在水平线圆心的左边)
    // 7:绘制的方向(0顺时针,1逆时针)
    CGContextAddArc(context, 100, 100, 50, 0, M_PI_2, 1);
    CGContextClosePath(context);
    // 3.渲染
    CGContextStrokePath(context);
}

// 绘制文字(比UILabel更轻量级)
- (void)drawText
{
    // 不需要获取上下文,也无需渲染,因为OC已经封装在方法中
    NSString *str = @"HellworldHello world1Hello worldHelloworldHelloworldHello w2orldHelloworldHellowor3ldHellwor5ldHelloworl6dHelloworld";
    
    NSMutableDictionary *attrDic = [NSMutableDictionary dictionary];
    [attrDic setObject:[UIFont systemFontOfSize:15] forKey:NSFontAttributeName];
    attrDic[NSBackgroundColorAttributeName] = [UIColor orangeColor];
    
    // 制定一个左上角起始点开始绘制(不会换行,超过layer的部分不显示)
//    [str drawAtPoint:CGPointMake(0, 0) withAttributes:attrDic];
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextAddRect(context, CGRectMake(0, 0, 100, 100));
    CGContextStrokePath(context);
    
    // drawInRect:withAttributes:这个方法会把文字绘制在制定的矩形范围内,而且会自动换行,但是如果超过了矩形的范围,超过的也不会显示
    [str drawInRect:CGRectMake(0, 0, 100, 100) withAttributes:attrDic];
}

// 绘制图像
- (void)drawImage
{
    UIImage *image = [UIImage imageNamed:@"001"];
    // 使用这种方法会显示图片的原始尺寸
//    [image drawAtPoint:CGPointMake(0, 0)];
    
    // 这种方法会使图片拉伸并填充整个矩形框
//    [image drawInRect:CGRectMake(0, 0, 100, 50)];
    
    // 在指定的矩形框内平铺图片
    [image drawAsPatternInRect:CGRectMake(0, 0, 200, 200)];
}

// 绘制贝塞尔曲线
- (void)drawBezierWithContext:(CGContextRef)context
{
    // 参数
    // 1.上下文
    // 2和3:表示的是控制点的坐标
    // 4和5:表示的时结束点的坐标
    CGContextMoveToPoint(context, 20, 20);
    CGContextAddQuadCurveToPoint(context, 120, 180, 150, 20);
    
    CGContextStrokePath(context);
}

// 矩阵变换
- (void)matrixOperationWithContext:(CGContextRef)context
{
    
    // 矩阵变化是针对layer的变换
//    CGContextRotateCTM(context, M_PI_4);
//    CGContextTranslateCTM(context, -20, 100);
    CGContextScaleCTM(context, 0.5, 0.5);

    CGContextAddRect(context, CGRectMake(80, 30, 100, 80));

    CGContextStrokePath(context);
}

// 绘制两个图形(后绘制的图形会覆盖掉前面绘制的图形)
- (void)drawTwoCircle:(CGContextRef)context
{
    CGContextAddArc(context, 50, 50, 50, 0, M_PI * 2, 0);
    [[UIColor orangeColor] set];
    CGContextFillPath(context);
    
    CGContextAddArc(context, 50, 50, 25, 0, M_PI * 2, 0);
    [[UIColor redColor]set];
    CGContextFillPath(context);
}

// 使用路径的方式绘制图形
// 所有绘制的方法名和之前的一样,只是把方法里面的context换成path
- (void)drawWithPathWithContext:(CGContextRef) context
{
    // 1.上下文
    // 2.绘制
    // 2.1 新建路径,在使用Quartz2D绘图的过程中,看到(retain,copy,create)这几个字样,就要进行释放.
    CGMutablePathRef path = CGPathCreateMutable();
    // 2.2 完善路径
    CGPathMoveToPoint(path, NULL, 30, 30);
    CGPathAddLineToPoint(path, NULL, 180, 80);
    // 2.3 把路径添加到上下文
    CGContextAddPath(context, path);
    // 3.渲染
//    CGContextStrokePath(context);
    CGContextDrawPath(context, kCGPathStroke);
    // 4.释放
    CGPathRelease(path);
    
    CGMutablePathRef pathCircle = CGPathCreateMutable();
    CGPathAddEllipseInRect(pathCircle, NULL, CGRectMake(50, 50, 50, 50));
    CGContextAddPath(context, pathCircle);
    CGContextDrawPath(context, kCGPathStroke);
    CGPathRelease(pathCircle);
}



@end









