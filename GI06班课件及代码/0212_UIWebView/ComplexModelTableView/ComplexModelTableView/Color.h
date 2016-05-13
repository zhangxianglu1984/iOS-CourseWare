//
//  Color.h
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Color : NSObject

@property (nonatomic, copy) NSString *colorName;
@property (nonatomic, copy) NSString *colorValue;

+ (instancetype)colorWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
