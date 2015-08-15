//
//  AppInfo.h
//  Demo_多图片网络加载
//
//  Created by zhang xianglu on 15/6/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppInfo : NSObject

/**
 *  应用名称
 */
@property(nonatomic,copy) NSString *name;

/**
 *  下载量
 */
@property(nonatomic,copy) NSString *download;

/**
 *  图标地址
 */
@property(nonatomic,copy) NSString *icon;

/**
 *  遍历构造器
 */
+ (AppInfo *)appInfoWithDictionary:(NSDictionary *)dictionary;



@end
