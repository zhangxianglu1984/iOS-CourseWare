//
//  CityWeather.m
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "CityWeather.h"

@implementation CityWeather

- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        self.aqi = dic[@"aqi"];
        self.wendu = dic[@"wendu"];
        self.city = dic[@"city"];
        NSDictionary *subDic = dic[@"forecast"][0];
        self.date = subDic[@"date"];
        self.fengli = subDic[@"fengli"];
        self.fengxiang = subDic[@"fengxiang"];
        self.high = subDic[@"high"];
        self.low = subDic[@"low"];
        self.type = subDic[@"type"];
    }
    return self;
}

+ (instancetype)cityWeatherWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}




@end
