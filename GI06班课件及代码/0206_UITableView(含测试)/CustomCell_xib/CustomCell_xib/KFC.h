//
//  KFC.h
//  CustomKFCCell
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KFC : NSObject

@property (nonatomic, copy  ) NSString  *title;
@property (nonatomic, assign) BOOL      isNew;
@property (nonatomic, assign) NSInteger price;
@property (nonatomic, copy  ) NSString  *desc;
@property (nonatomic, copy  ) NSString  *imageName;

- (instancetype)initWithDic:(NSDictionary *)dic;
+ (instancetype)kfcWithDic:(NSDictionary *)dic;

@end
