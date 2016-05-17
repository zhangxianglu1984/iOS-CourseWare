//
//  CityWeather.h
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityWeather : NSObject

@property (nonatomic, copy) NSString *wendu;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *high;
@property (nonatomic, copy) NSString *low;
@property (nonatomic, copy) NSString *fengxiang;
@property (nonatomic, copy) NSString *fengli;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *aqi;
@property (nonatomic, copy) NSString *city;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)cityWeatherWithDic:(NSDictionary *)dic;

@end
