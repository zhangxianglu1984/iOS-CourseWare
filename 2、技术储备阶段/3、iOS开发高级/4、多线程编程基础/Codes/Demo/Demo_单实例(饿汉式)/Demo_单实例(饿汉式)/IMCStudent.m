//
//  IMCStudent.m
//  Demo_单实例(饿汉式)
//
//  Created by zhang xianglu on 15/6/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCStudent.h"

@implementation IMCStudent

/**
 *  应用程序启动的时候调用(加载类到内存中)
 */
+ (void)load {
	NSLog(@"loadStudent");
	[super load];
}

+ (void)initialize {
	NSLog(@"initializeStudent");
	[super initialize];
}

@end
