//
//  Province.m
//  UITableView_Group
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Province.h"

@implementation Province

- (instancetype)initWithName:(NSString *)name desc:(NSString *)desc andCities:(NSArray *)cities {
    if (self = [super init]) {
        self.name = name;
        self.desc = desc;
        self.cityArray = cities;
    }
    return self;
}

+ (instancetype)provinceWithName:(NSString *)name desc:(NSString *)desc andCities:(NSArray *)cities
{
    return [[Province alloc]initWithName:name desc:desc andCities:cities];
}

@end
