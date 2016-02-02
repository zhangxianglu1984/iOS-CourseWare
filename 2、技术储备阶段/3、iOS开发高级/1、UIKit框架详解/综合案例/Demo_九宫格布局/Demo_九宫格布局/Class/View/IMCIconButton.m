//
//  IMCIconButton.m
//  Demo_九宫格布局
//
//  Created by xiangluzhang on 15/12/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCIconButton.h"

@implementation IMCIconButton

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    return CGRectMake((contentRect.size.width - 50.0) * 0.5, 0.0, 50.0, contentRect.size.height * 0.8);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
    return CGRectMake(0.0, self.imageView.bounds.size.height, contentRect.size.width, contentRect.size.height - self.imageView.bounds.size.height);
}



@end
