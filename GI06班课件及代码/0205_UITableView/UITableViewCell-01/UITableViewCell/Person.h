//
//  Person.h
//  UITableViewCell
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (nonatomic, copy) NSString   *name;
@property (nonatomic, assign) BOOL      isMale;
@property (nonatomic, assign) NSInteger age;
@property (nonatomic, assign) float     height;
@property (nonatomic, assign) float     weight;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)personWithDic:(NSDictionary *)dic;

@end
