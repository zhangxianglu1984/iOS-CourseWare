//
//  DataTool.h
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CityWeather;

@interface DataTool : NSObject

+ (CityWeather *)getCityWeatherWithCityCode:(NSString *)code;

@end
