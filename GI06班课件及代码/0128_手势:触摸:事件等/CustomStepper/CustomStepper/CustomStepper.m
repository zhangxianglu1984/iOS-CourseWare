//
//  CustomStepper.m
//  CustomStepper
//
//  Created by Apple on 15/1/27.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import "CustomStepper.h"

@interface CustomStepper()
{
    UIButton *plusButton;
    UIButton *minusButton;
    UITextField *textField;
    NSInteger _count;
}

@end

@implementation CustomStepper

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    if (self = [super initWithFrame:CGRectMake(0, 0, 240, 60)]) {
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bg"]];
        
        textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 0, 80, 60)];
//        textField.backgroundColor = [UIColor orangeColor];
        textField.center = self.center;
        textField.textAlignment = NSTextAlignmentCenter;
        textField.keyboardType = UIKeyboardTypeNumberPad;
        textField.font = [UIFont systemFontOfSize:25];
        textField.text = @"1";
        _count = 1;
        [self addSubview:textField];
        
        minusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        minusButton.frame = CGRectMake(5, 0, 60, 60);
        [minusButton setImage:[UIImage imageNamed:@"minus_red"] forState:UIControlStateNormal];
        [minusButton setImage:[UIImage imageNamed:@"minus_gray"] forState:UIControlStateHighlighted];
        [minusButton addTarget:self action:@selector(minus:) forControlEvents:UIControlEventTouchUpInside];
        minusButton.enabled = NO;
        [self addSubview:minusButton];
        
        plusButton = [UIButton buttonWithType:UIButtonTypeCustom];
        plusButton.frame = CGRectMake(self.bounds.size.width - 65, 0, 60, 60);
        [plusButton setImage:[UIImage imageNamed:@"plus_red"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageNamed:@"plus_gray"] forState:UIControlStateHighlighted];
        [plusButton addTarget:self action:@selector(plus:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusButton];
    }
    return self;
}

- (void)minus:(UIButton *)button
{
    self.count--;
    [self doThing];
}

- (void)plus:(UIButton *)button
{
    self.count++;
    [self doThing];
}

- (NSInteger)count
{
    return [textField.text integerValue];
}

- (void)setCount:(NSInteger)count
{
    _count = count;
    textField.text = [@(_count) stringValue];
}

- (void)doThing
{
    [self endEditing:YES];
    minusButton.enabled = !(_count == 1);
    textField.text = [@(_count) stringValue];
    if (_delegate && [_delegate respondsToSelector:@selector(customStepperValueDidChanged:)]) {
        [_delegate customStepperValueDidChanged:_count];
    }
}

@end
