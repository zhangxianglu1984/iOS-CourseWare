//
//  ColorGroup.h
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ColorGroup : NSObject

@property (nonatomic, copy) NSString *groupName;
@property (nonatomic, strong) NSArray *colorGroup;
@property (nonatomic, assign) BOOL isOpen;

+ (instancetype)colorGroupWithDic:(NSDictionary *)dic;
- (instancetype)initWithDic:(NSDictionary *)dic;

@end
