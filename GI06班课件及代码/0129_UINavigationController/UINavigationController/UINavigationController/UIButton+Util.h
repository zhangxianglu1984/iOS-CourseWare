//
//  UIButton+Util.h
//  UINavigationController
//
//  Created by jianfeng on 15/1/29.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (Util)

+ (UIButton *)buttonWithFrame:(CGRect)frame target:(id)target andAction:(SEL)action;

@end
