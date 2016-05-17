//
//  City.m
//  Weather
//
//  Created by jianfeng on 15/3/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "City.h"

@implementation City

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.name = dic[@"province"][@"name"];
        self.code = dic[@"province"][@"code"];
//        self.cities = dic[@"cities"];
        
        NSMutableArray *citiesModelArray = [NSMutableArray array];
        NSArray *arr = dic[@"cities"];
        for (NSDictionary *cityDic in arr) {
            City *city = [[City alloc]init];
            city.name = cityDic[@"name"];
            city.code = cityDic[@"code"];
            [citiesModelArray addObject:city];
        }
        self.cities = citiesModelArray;
    }
    return self;
}

+ (instancetype)cityWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

@end
