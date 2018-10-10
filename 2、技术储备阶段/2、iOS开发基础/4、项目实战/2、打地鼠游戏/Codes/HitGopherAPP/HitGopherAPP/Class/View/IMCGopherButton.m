//
//  IMCGopherButton.m
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "IMCGopherButton.h"

static const CGFloat kGopherButtonWidth = 72.0;
static const CGFloat kGopherButtonHeight = 72.0;

@interface IMCGopherButton ()

- (void)onClickedAction:(IMCGopherButton *)gopherButton;

@end

@implementation IMCGopherButton

/*
 *  创建一个IMCGopherButton对象，返回
 **/
+ (IMCGopherButton *)buttonWithX:(CGFloat)x y:(CGFloat)y tag:(NSInteger)tag{
    IMCGopherButton *gopherButton = [IMCGopherButton buttonWithType:UIButtonTypeCustom];
    
    gopherButton.tag = tag;
    
    gopherButton.frame = CGRectMake(x, y, kGopherButtonWidth, kGopherButtonHeight);
    
    gopherButton.gopherAppeared = NO;
    
    //把button自己设置自己的处理器
    [gopherButton addTarget:gopherButton action:@selector(onClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    return gopherButton;
}

- (void)onClickedAction:(IMCGopherButton *)gopherButton{
    //委托方
    //1、遵循被委托方制定的协议 <>
    //2、签订协议(设置代理)textField.delegate = self
    //3、履行协议条款(实现协议方法)
    
    //被委托方
    //1、制定一个协议，给委托方去遵循
    //2、定义一个属性，用于给委托方设置代理(前向声明)
    //3、给委托方发消息(调用委托方实现的协议方法),让委托方做事
    
    //判断委托方是否具备这个行为的实现
    if ([_delegate respondsToSelector:@selector(gopherButton:clickedOnGopherAppeared:)]) {
        [_delegate gopherButton:gopherButton clickedOnGopherAppeared:_gopherAppeared];
    }
    
}

- (void)setGopherAppeared:(BOOL)gopherAppeared{
    _gopherAppeared = gopherAppeared;
    
    if (_gopherAppeared) {
        [self setImage:[UIImage imageNamed:@"btn_img_normal_show"] forState:UIControlStateNormal];
        
        [self setImage:[UIImage imageNamed:@"btn_img_highlighted"] forState:UIControlStateHighlighted];
    }else {
        [self setImage:[UIImage imageNamed:@"btn_img_normal_hide"] forState:UIControlStateNormal];
        
        [self setImage:[UIImage imageNamed:@"btn_img_normal_hide"] forState:UIControlStateHighlighted];
    }
}



@end
