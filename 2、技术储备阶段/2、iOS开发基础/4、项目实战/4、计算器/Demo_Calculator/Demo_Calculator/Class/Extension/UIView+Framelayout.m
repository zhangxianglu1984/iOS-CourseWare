//
//  UIView+Extension.m
//  Demo_Calculator
//
//  Created by xiangluzhang on 16/6/24.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "UIView+Framelayout.h"

@implementation UIView (Framelayout)

- (CGFloat)x {
    return self.origin.x;
}

- (void)setX:(CGFloat)x {
    CGPoint viewOrigin = self.origin;
    viewOrigin.x = x;
    self.origin = viewOrigin;
}

- (CGFloat)y {
    return self.origin.y;
}

- (void)setY:(CGFloat)y {
    CGPoint viewOrigin = self.origin;
    viewOrigin.y = y;
    self.origin = viewOrigin;
}

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect viewFrame = self.frame;
    viewFrame.origin = origin;
    self.frame = viewFrame;
}

- (CGFloat)width {
    return self.size.width;
}

- (void)setWidth:(CGFloat)width {
    CGSize viewSize = self.size;
    viewSize.width = width;
    self.size = viewSize;
}

- (CGFloat)height {
    return self.size.height;
}

- (void)setHeight:(CGFloat)height {
    CGSize viewSize = self.size;
    viewSize.height = height;
    self.size = viewSize;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect viewFrame = self.frame;
    viewFrame.size = size;
    self.frame = viewFrame;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    CGPoint viewCenter = self.center;
    viewCenter.x = centerX;
    self.center = viewCenter;
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    CGPoint viewCenter = self.center;
    viewCenter.y = centerY;
    self.center = viewCenter;
}

@end
