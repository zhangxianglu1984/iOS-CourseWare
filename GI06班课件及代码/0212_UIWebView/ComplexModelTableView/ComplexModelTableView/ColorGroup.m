//
//  ColorGroup.m
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ColorGroup.h"
#import "Color.h"

@implementation ColorGroup

+ (instancetype)colorGroupWithDic:(NSDictionary *)dic
{
    return [[self alloc]initWithDic:dic];
}

// dic[@"groupName"]--> 字符串
// dic[@"colorGroup"] --> 数组(数组里面放的是字典)
- (instancetype)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
// 方法2(直接从字段取值)
        self.groupName = dic[@"groupName"];
        
        NSArray *colorArray = dic[@"colorGroup"];
        
        NSMutableArray *modelArray = [NSMutableArray array];
        for (NSDictionary *dic in colorArray) {
            Color *color = [Color colorWithDic:dic];
            // 并存储到一个临时的数组里面
            [modelArray addObject:color];
        }
        self.colorGroup = modelArray;
        self.isOpen = NO;

// 方法一(使用KVC)
//        // 执行完这句 self.colorGroup是数组,而且这个数组里面装的是字典
//        [self setValuesForKeysWithDictionary:dic];
//        
//        // 我们需要这个数组里面放的是color的模型
//        NSMutableArray *modelArray = [NSMutableArray array];
//        // 对字典数组进行遍历,把每个元素(字典)转化成模型
//        for (NSDictionary *dic in self.colorGroup) {
//            Color *color = [Color colorWithDic:dic];
//            // 并存储到一个临时的数组里面
//            [modelArray addObject:color];
//        }
//        
//        self.colorGroup = modelArray;
    }
    return self;
}

@end
