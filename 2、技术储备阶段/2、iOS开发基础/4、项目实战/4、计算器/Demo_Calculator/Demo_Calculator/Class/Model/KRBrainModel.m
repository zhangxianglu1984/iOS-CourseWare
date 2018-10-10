//
//  KRBrainModel.m
//  Demo_Calculator
//
//  Created by xiangluzhang on 16/6/28.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "KRBrainModel.h"

@interface KRBrainModel ()

@property(nonatomic, strong) NSMutableArray *operatorStack;

@property(nonatomic, strong) NSMutableArray *operandStack;

/*
 *  压操作数栈
 **/
- (void)pushOperandStack:(NSNumber *)operand;

/*
 *   弹操作数栈
 **/
- (NSNumber *)popOperandStack;

/*
 *  读取栈顶的操作数
 **/
- (NSNumber *)topStackOperand;

- (void)p_clearOperandStack;

/*
 *  压操作符栈
 **/
- (void)pushOperatorStack:(NSString *)operat;

/*
 *   弹操作符栈
 **/
- (NSString *)popOperatorStack;

/*
 *  读取栈顶的操作符
 **/
- (NSString *)topStackOperator;

- (void)p_clearOperatorStack;

/*
 *  根据操作符运算两个操作数
 **/
- (NSNumber *)valueByOperator:(NSString *)operator onLeftOperand:(NSNumber *)aOperand rightOperand:(NSNumber *)bOperand;

- (void)calculateWithEqual;

/*
 *  做一次运算
 **/
- (void)calculate;

- (void)calculateWithOperator:(NSString *)operator;

/*
 *  判断两个运算符的优先级别
**/
- (BOOL)operator:(NSString *)operatorA higherPriorityThanOperator:(NSString *)operatorB;

@end

@implementation KRBrainModel

- (instancetype)init {
    if (self = [super init]) {
        self.operatorStack = [NSMutableArray arrayWithCapacity:2];
        self.operandStack = [NSMutableArray array];
    }
    return self;
}



- (NSNumber *)valueByOperator:(NSString *)operator onLeftOperand:(NSNumber *)aOperand rightOperand:(NSNumber *)bOperand {
    double operandA = [aOperand doubleValue];
    double operandB = [bOperand doubleValue];
    
    NSNumber *value = nil;
    if ([@"+" isEqualToString:operator]) {
        value = @(operandA + operandB);
    }
    else if ([@"-" isEqualToString:operator]) {
        value = @(operandA - operandB);
    }
    else if ([@"*" isEqualToString:operator]) {
        value = @(operandA * operandB);
    }
    else if ([@"/" isEqualToString:operator]) {
        value = (operandB == 0)? nil : @(operandA / operandB);
    }
    
    return value;
}

/*
 *  请输入操作符
 **/
- (void)inputOperator:(NSString *)operato {
    if (![@"=" isEqualToString:operato]) {
        [self calculateWithOperator:operato];
    } else {
        [self calculateWithEqual];
    }
    
}

- (void)calculateWithOperator:(NSString *)operator {
    //操作符栈顶没有操作符
    if([self topStackOperator] == nil) {
        [self pushOperatorStack:operator];
    }
    
    //操作符栈顶有操作符
    else {
        //优先级的判断：operato和栈顶的操作符比较优先级
        //如果压入的操作符比栈顶的操作符优先级要高
        if ([self operator:operator higherPriorityThanOperator:[self topStackOperator]]) {
            [self pushOperatorStack:operator];
        }
        
        //要压入的操作符不高于栈顶操作符优先级
        else {
            [self calculate];
            
            //做一次运算完,再继续运算
            [self calculateWithOperator:operator];
        }
    }
}



/*
 *  请输入操作数
 **/
- (void)inputOperand:(NSNumber *)operand {
    [self pushOperandStack:operand];
}

- (NSString *)topStackOperator {
    return [_operatorStack lastObject];
}

- (void)calculate {
    NSNumber *rightOperand = [self popOperandStack];
    NSNumber *leftOperand = [self popOperandStack];
    
    NSString *operator = [self popOperatorStack];
    
    NSNumber *value = [self valueByOperator:operator onLeftOperand:leftOperand rightOperand:rightOperand];
    
    [self pushOperandStack:value];
}

- (void)calculateWithEqual {
    if ([self topStackOperator] == nil) {
        if ([_delegate respondsToSelector:@selector(brainModel:calculatedValue:)]) {
            [_delegate brainModel:self calculatedValue:[self topStackOperand]];
        }
        return;
    }
    
    [self calculate];
    
    [self calculateWithEqual];
}

/*
 *  压操作数栈
 **/
- (void)pushOperandStack:(NSNumber *)operand {
    [_operandStack addObject:operand];
}

/*
 *   弹操作数栈
 **/
- (NSNumber *)popOperandStack {
    NSNumber *topNumber = [_operandStack lastObject];
    [_operandStack removeLastObject];
    return topNumber;
}

/*
 *  压操作符栈
 **/
- (void)pushOperatorStack:(NSString *)operat {
    [_operatorStack addObject:operat];
}

/*
 *   弹操作符栈
 **/
- (NSString *)popOperatorStack {
    NSString *operator = [_operatorStack lastObject];
    [_operatorStack removeLastObject];
    return operator;
}

- (NSNumber *)topStackOperand {
    return [_operandStack lastObject];
}

- (BOOL)operator:(NSString *)operatorA higherPriorityThanOperator:(NSString *)operatorB {
    if ([@"*" isEqualToString:operatorA] || [@"/" isEqualToString:operatorA]) {
        return ([@"+" isEqualToString:operatorB] || [@"-" isEqualToString:operatorB]);
    }
    
    return NO;
}

- (void)clear {
    [self p_clearOperandStack];
    [self p_clearOperatorStack];
}

- (void)p_clearOperatorStack {
    [_operandStack removeAllObjects];
}

- (void)p_clearOperandStack {
    [_operatorStack removeAllObjects];
}

@end
