//
//  Beauty.m
//  CellExam
//
//  Created by Apple on 15/2/7.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import "Beauty.h"

@implementation Beauty

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"name"];
        self.avartar = dic[@"avartar"];
        self.isLike = [dic[@"isLike"] boolValue];
    }
    return self;
}

+ (instancetype)beautyWithDic:(NSDictionary *)dic
{
    return [[self alloc] initWithDic:dic];
}





@end
