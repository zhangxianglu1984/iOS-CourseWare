//
//  ZXLSQLiteDatabaseConfig.m
//  BiDaiBaoAPP
//
//  Created by zhang xianglu on 15/7/19.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ZXLSQLiteDatabaseConfig.h"

static id sharedInstance = nil;

@implementation ZXLSQLiteDatabaseConfig

- (NSString *)databaseFilePath {
	return CACHE_DIRECTORY;
}

- (NSString *)databaseFileName {
	return @"BiDaiBaoAPP.sqlite";
}


+ (instancetype)sharedConfig {
	if (sharedInstance == nil) {
		sharedInstance = [[ZXLSQLiteDatabaseConfig alloc] init];
	}
	return sharedInstance;
}

/**
 *  开辟内存的方法 alloc -> allocWithZone
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		sharedInstance = [super allocWithZone:zone];
	});
	
	return sharedInstance;
}

/**
 *  当给对象发送copy消息时，调用的方法
 *  [object copy]
 *  @param zone 
 *
 *  @return <#return value description#>
 */
- (id)copyWithZone:(NSZone *)zone {
	return sharedInstance;
}

@end