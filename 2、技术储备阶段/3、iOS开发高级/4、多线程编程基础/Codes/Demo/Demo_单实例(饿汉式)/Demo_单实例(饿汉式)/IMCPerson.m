//
//  IMCPerson.m
//  Demo_单实例(饿汉式)
//
//  Created by zhang xianglu on 15/6/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCPerson.h"

static id sharedInstance = nil;

@implementation IMCPerson

/**
 *  应用程序启动的时候调用(加载类到内存中)
 */
+ (void)load {
	//在类接收第一个消息之前调用initialize
	[super load];
	
	if (sharedInstance == nil) {
		@synchronized(self){
			if (sharedInstance == nil) {
				sharedInstance = [[IMCPerson alloc] init];
			}
		}
	}
}

+ (void)initialize {
	NSLog(@"initializePerson");
	[super initialize];
}


+ (instancetype)sharedInstance {
	return sharedInstance;
}

/**
 *  开辟内存的方法 alloc -> allocWithZone
 */
+ (instancetype)allocWithZone:(struct _NSZone *)zone {
	//减少加锁语句的运行次数，优化性能
	if(sharedInstance == nil){
		//加锁，防止多线程创建
		@synchronized(self){
			if (sharedInstance == nil) {
				sharedInstance = [super allocWithZone:zone];
			}
		}
	}
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
