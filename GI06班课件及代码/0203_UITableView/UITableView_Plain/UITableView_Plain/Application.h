//
//  Application.h
//  UITableView_Plain
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Application : NSObject

@property (nonatomic, strong) NSString *imageName;
@property (nonatomic, strong) NSString *appName;
@property (nonatomic, strong) NSString *desc;

- (instancetype)initWithImageName:(NSString *)imageName appName:(NSString *)name andDesc:(NSString *)desc;
+ (instancetype)applicationWithImageName:(NSString *)imageName appName:(NSString *)name andDesc:(NSString *)desc;

@end
