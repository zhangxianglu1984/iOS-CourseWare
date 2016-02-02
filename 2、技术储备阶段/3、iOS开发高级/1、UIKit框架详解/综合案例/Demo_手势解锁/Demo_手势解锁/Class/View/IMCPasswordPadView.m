//
//  IMCPasswordPadView.m
//  Demo_手势解锁
//
//  Created by xiangluzhang on 15/12/15.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCPasswordPadView.h"

static const CGFloat kPasswordPadButtonWidth = 74.0;
static const CGFloat kPasswordPadButtonHeight = 74.0;


@interface IMCPasswordPadView ()

@property(nonatomic,strong) NSMutableArray *passwordPadButtons;

@property(nonatomic,strong) NSMutableArray *touchedPasswordPadButtons;

- (void)p_initPasswordPadButtons;

- (UIButton *)p_buttonInTouchPoint:(CGPoint)touchPoint;

@end

@implementation IMCPasswordPadView

- (instancetype)init {
    if (self = [super init]) {
        [self p_initPasswordPadButtons];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)p_initPasswordPadButtons {
    for (NSInteger i = 0; i < 9; i ++) {
        UIButton *passwordPadButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        passwordPadButton.userInteractionEnabled = NO;
        
        passwordPadButton.tag = i;
        
        //普通状态下的图片
        [passwordPadButton setImage:[UIImage imageNamed:@"gesture_node_normal"] forState:UIControlStateNormal];
        
        //normal hightlighted selected button.select = YES
        [passwordPadButton setImage:[UIImage imageNamed:@"gesture_node_highlighted"] forState:UIControlStateSelected];
        
        [self addSubview:passwordPadButton];
        
        self.passwordPadButtons[i] = passwordPadButton;
        
    }
}

//给子视图布局
- (void)layoutSubviews {
    [super layoutSubviews];
    
    //计算间距
    CGFloat passwordPadButtonHorizontalSpace = (self.frame.size.width - kPasswordPadButtonWidth * 3.0) * 0.5;
    CGFloat passwordPadButtonVerticalSpace = (self.frame.size.height - kPasswordPadButtonHeight * 3.0) * 0.5;
    
    for (NSInteger i = 0; i < 3; i ++) {
        
        CGFloat passwordPadButtonCenterY = kPasswordPadButtonHeight * 0.5 + kPasswordPadButtonHeight * i + passwordPadButtonVerticalSpace * i;
        
        for (NSInteger j = 0; j < 3; j ++) {
            UIButton *passwordPadButton = self.passwordPadButtons[3*i+j];
            
            passwordPadButton.bounds = (CGRect){0.0,0.0,kPasswordPadButtonWidth,kPasswordPadButtonHeight};
            
            CGFloat passwordPadButtonCenterX = kPasswordPadButtonWidth * 0.5 + kPasswordPadButtonWidth * j + passwordPadButtonHorizontalSpace * j;
            
            passwordPadButton.center = (CGPoint){passwordPadButtonCenterX,passwordPadButtonCenterY};
        }
    }
}

- (NSMutableArray *)passwordPadButtons {
    if (_passwordPadButtons == nil) {
        self.passwordPadButtons = [NSMutableArray array];
    }
    return _passwordPadButtons;
}

- (NSMutableArray *)touchedPasswordPadButtons {
    if (_touchedPasswordPadButtons == nil) {
        self.touchedPasswordPadButtons = [NSMutableArray array];
    }
    return _touchedPasswordPadButtons;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    UIButton *buttonInTouchPoint = [self p_buttonInTouchPoint:touchPoint];
    if (buttonInTouchPoint != nil) {
        buttonInTouchPoint.selected = YES;
        [self.touchedPasswordPadButtons addObject:buttonInTouchPoint];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    CGPoint touchPoint = [touch locationInView:self];
    
    UIButton *buttonInTouchPoint = [self p_buttonInTouchPoint:touchPoint];
    UIButton *buttonInLastTouchPoint = [self.touchedPasswordPadButtons lastObject];
    
    if (buttonInTouchPoint != nil && buttonInTouchPoint.tag != buttonInLastTouchPoint.tag) {
        buttonInTouchPoint.selected = YES;
        [self.touchedPasswordPadButtons addObject:buttonInTouchPoint];
    }
    
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    if (self.touchedPasswordPadButtons.count <= 0) {
        return;
    }
    
    NSMutableString *password = [NSMutableString string];
    [self.touchedPasswordPadButtons enumerateObjectsUsingBlock:^(UIButton *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.selected = NO;
        
        //0-2-3-5-
        [password appendFormat:@"%ld-",obj.tag];
    }];
    
    [password deleteCharactersInRange:NSMakeRange(password.length-1, 1)];
    
    if ([_delegate respondsToSelector:@selector(passwordPadView:didFinishInputPassword:)]) {
        [_delegate passwordPadView:self didFinishInputPassword:password];
    }
    
    [self.touchedPasswordPadButtons removeAllObjects];
    
    [self setNeedsDisplay];
}

- (UIButton *)p_buttonInTouchPoint:(CGPoint)touchPoint {
    UIButton *buttonInTouchPoint = nil;

    for (UIButton *passwordPadButton in self.passwordPadButtons) {
        //检测一个点是否在某个视图的范围内
        if(CGRectContainsPoint(passwordPadButton.frame, touchPoint)) {
            buttonInTouchPoint = passwordPadButton;
            break;
        }
    }
    
    return buttonInTouchPoint;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    NSInteger touchedPasswordPadButtonCount = self.touchedPasswordPadButtons.count;
    
    if (touchedPasswordPadButtonCount != 0) {
        UIBezierPath *bezierPath = [UIBezierPath bezierPath];
        bezierPath.lineWidth = 8.0;
        [[UIColor grayColor] set];
        
        for (NSInteger i = 0; i < touchedPasswordPadButtonCount; i ++) {
            UIButton *touchedPasswordPadButton = [self.touchedPasswordPadButtons objectAtIndex:i];
            
            CGPoint touchedPasswordPadButtonCenter = touchedPasswordPadButton.center;
            
            if (i == 0) {
                [bezierPath moveToPoint:touchedPasswordPadButtonCenter];
            } else {
                [bezierPath addLineToPoint:touchedPasswordPadButtonCenter];
            }
        }
        
        [bezierPath stroke];
    }
    
    
}

@end
