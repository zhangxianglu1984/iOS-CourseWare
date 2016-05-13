//
//  DataTool.m
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DataTool.h"
#import "Defines.h"
#import "CityWeather.h"
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"


@implementation DataTool

+ (CityWeather *)getCityWeatherWithCityCode:(NSString *)code
{
    // 1.url
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kGetCityWeatherInfo,code];
    NSURL *url = [NSURL URLWithString:urlStr];
    // 2.request
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    // 3.conn
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    // 如果有数据才进行解析,否则会导致崩溃
    NSDictionary *resultDic = nil;
    CityWeather *model0 = nil;
    if (data) {
        NSError *jsonError = nil;
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        resultDic = dic[@"data"];
        model0 = [CityWeather cityWeatherWithDic:resultDic];
    }
    else{
        NSLog(@"获取数据失败");
    }
    return model0;
}

+ (void)reloadDataWithCityCode:(NSString *)cityCode successBlock:(SuccessBlock)success andFailBlock:(FailBlock)fail
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kGetCityWeatherInfo,cityCode];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/plain"];

    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];
    [[AFNetworkActivityIndicatorManager sharedManager]incrementActivityCount];
    
    [manager GET:urlStr parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"数据获取成功:%@",responseObject);
        NSDictionary *dic = responseObject[@"data"];
        success(dic);
        [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        fail(error);
        [[AFNetworkActivityIndicatorManager sharedManager]decrementActivityCount];
    }];
}

@end
