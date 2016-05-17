//
//  City.h
//  Weather
//
//  Created by jianfeng on 15/3/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, strong)NSArray *cities;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)cityWithDic:(NSDictionary *)dic;

@end
