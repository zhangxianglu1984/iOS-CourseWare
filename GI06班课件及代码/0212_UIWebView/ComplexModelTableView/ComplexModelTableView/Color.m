//
//  Color.m
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Color.h"

@implementation Color

+ (instancetype)colorWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
