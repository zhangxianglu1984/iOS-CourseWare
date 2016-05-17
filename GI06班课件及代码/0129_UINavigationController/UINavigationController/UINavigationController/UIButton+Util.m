//
//  UIButton+Util.m
//  UINavigationController
//
//  Created by jianfeng on 15/1/29.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "UIButton+Util.h"

@implementation UIButton (Util)

+ (UIButton *)buttonWithFrame:(CGRect)frame target:(id)target andAction:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.backgroundColor = [UIColor redColor];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    return button;
}





@end
