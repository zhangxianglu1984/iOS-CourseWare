//
//  KRBrainModel.h
//  Demo_Calculator
//
//  Created by xiangluzhang on 16/6/28.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KRBrainModel;

@protocol KRBrainModelDelegate <NSObject>

/*
 *  计算出结果后，通知代理
 **/
- (void)brainModel:(KRBrainModel *)brainModel calculatedValue:(NSNumber *)value;

@end

@interface KRBrainModel : NSObject

@property(nonatomic, weak) id<KRBrainModelDelegate> delegate;

/*
 *  请输入操作符
 **/
- (void)inputOperator:(NSString *)operato;

/*
 *  请输入操作数
 **/
- (void)inputOperand:(NSNumber *)operand;

- (void)clear;


@end
