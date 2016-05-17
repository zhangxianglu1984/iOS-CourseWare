//
//  CustomButton.m
//  MoveButton
//
//  Created by jianfeng on 15/1/28.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "CustomButton.h"

@interface CustomButton()
{
    CGPoint beginPoint;
}
@end

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    beginPoint = [touch locationInView:self];
    NSLog(@"begin:%@",NSStringFromCGPoint(beginPoint));
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint nextPoint = [touch locationInView:self];
    NSLog(@"next:%@",NSStringFromCGPoint(nextPoint));
    
    CGFloat x = nextPoint.x - beginPoint.x;
    CGFloat y = nextPoint.y - beginPoint.y;
    
    self.center = CGPointMake(self.center.x + x, self.center.y + y);
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
