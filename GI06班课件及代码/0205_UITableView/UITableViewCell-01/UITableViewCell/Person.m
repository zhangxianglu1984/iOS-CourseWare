//
//  Person.m
//  UITableViewCell
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.age = [dic[@"age"] integerValue];
        self.isMale = [dic[@"isMale"] boolValue];
        self.weight = [dic[@"weight"] floatValue];
        self.height = [dic[@"height"] floatValue];
    }
    return self;
}

+ (instancetype)personWithDic:(NSDictionary *)dic
{
    return [[Person alloc]initWithDic:dic];
}


@end
