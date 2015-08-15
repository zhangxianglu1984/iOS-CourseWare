//
//  AppInfo.m
//  Demo_多图片网络加载
//
//  Created by zhang xianglu on 15/6/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "AppInfo.h"

@interface AppInfo ()

@end

@implementation AppInfo

+ (AppInfo *)appInfoWithDictionary:(NSDictionary *)dictionary {
	AppInfo *appInfo = [[AppInfo alloc] init];
	[dictionary enumerateKeysAndObjectsUsingBlock:^(id key, id obj, BOOL *stop) {
		//KVC 设置成员变量的值
		[appInfo setValue:obj forKey:key];//name->_name
		//获取成员变量的值
		//[appInfo valueForKey:key];
	}];

	return appInfo;
}


@end
