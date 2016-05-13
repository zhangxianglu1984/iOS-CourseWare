//
//  DataTool.h
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CityWeather;

typedef void(^SuccessBlock)(NSDictionary *dic);
typedef void(^FailBlock)(NSError *error);

@interface DataTool : NSObject

+ (CityWeather *)getCityWeatherWithCityCode:(NSString *)code;

+ (void)reloadDataWithCityCode:(NSString *)cityCode successBlock:(SuccessBlock)success andFailBlock:(FailBlock)fail;

@end
