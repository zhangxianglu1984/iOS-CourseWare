//
//  Application.m
//  UITableView_Plain
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Application.h"

@implementation Application

- (instancetype)initWithImageName:(NSString *)imageName appName:(NSString *)name andDesc:(NSString *)desc
{
    if (self = [super init]) {
        self.imageName = imageName;
        self.appName = name;
        self.desc = desc;
    }
    return self;
}

+ (instancetype)applicationWithImageName:(NSString *)imageName appName:(NSString *)name andDesc:(NSString *)desc
{
    return [[Application alloc]initWithImageName:imageName appName:name andDesc:desc];
}

@end
