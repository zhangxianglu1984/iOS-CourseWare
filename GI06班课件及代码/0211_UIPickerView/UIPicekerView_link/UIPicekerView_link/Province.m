//
//  Province.m
//  UIPicekerView_link
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Province.h"

@implementation Province

+ (instancetype)provinceWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        // 把字典里面的键值对按照自身属性进行赋值
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
