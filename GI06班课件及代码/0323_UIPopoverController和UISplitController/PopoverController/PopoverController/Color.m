//
//  Color.m
//  PopoverController
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "Color.h"

@implementation Color

+ (instancetype)colorWithName:(NSString *)name andColor:(UIColor *)Color{
    return [[self alloc]initWithName:name andColor:Color];
}

- (instancetype)initWithName:(NSString *)name andColor:(UIColor *)Color{
    if (self = [super init]) {
        self.name = name;
        self.color = Color;
    }
    return self;
}



@end
