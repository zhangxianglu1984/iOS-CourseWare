//
//  IMCPerson.m
//  Demo_单实例(GCD)
//
//  Created by zhang xianglu on 15/6/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCPerson.h"

static id sharedInstance = nil;

@implementation IMCPerson

+ (instancetype)sharedInstance {
	if (sharedInstance == nil) {
		sharedInstance = [[IMCPerson alloc] init];
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
