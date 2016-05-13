//
//  KFC.m
//  CustomKFCCell
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "KFC.h"

@implementation KFC

// 自定义初始化方法
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.title = dic[@"title"];
        self.isNew = [dic[@"isNew"] boolValue];
        self.price = [dic[@"price"] integerValue];
        self.desc = dic[@"desc"];
        self.imageName = dic[@"imageName"];
    }
    return self;
}

+ (instancetype)kfcWithDic:(NSDictionary *)dic
{
    return [[KFC alloc] initWithDic:dic];
}
@end
