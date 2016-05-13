//
//  DataTool.h
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//  主要是负责向网络进行连接获取数据的

#import <Foundation/Foundation.h>
@class CityWeather;

typedef void(^SuccessBlock)(NSDictionary *dic);
typedef void(^FailBlock)(NSError *error);

@interface ConnTool : NSObject

+ (void)connWithURL:(NSString *)urlString successBlock:(SuccessBlock)success andFailBlock:(FailBlock)fail;


@end
