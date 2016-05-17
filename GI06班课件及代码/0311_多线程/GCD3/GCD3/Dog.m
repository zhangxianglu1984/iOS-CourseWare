//
//  Dog.m
//  GCD3
//
//  Created by jianfeng on 15/3/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Dog.h"

@interface Dog()

@end

@implementation Dog

//// 有潜在问题:线程安全
//+ (instancetype)sharedDog
//{
//    if (!dog) {
//        dog = [[Dog alloc]init];
//    }
//    return dog;
//}

// 使用GDC创建单例模式,这样创建的单例模式是线程安全的
+ (instancetype)sharedDog
{
    static Dog *dog;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dog = [[Dog alloc]init];
    });
    return dog;
}

@end
