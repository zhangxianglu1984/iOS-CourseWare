//
//  Province.h
//  UITableView_Group
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Province : NSObject

/**
 *  省份名称
 */
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSArray *cityArray;

- (instancetype)initWithName:(NSString *)name desc:(NSString *)desc andCities:(NSArray *)cities;
+ (instancetype)provinceWithName:(NSString *)name desc:(NSString *)desc andCities:(NSArray *)cities;


@end
