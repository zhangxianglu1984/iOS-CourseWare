//
//  IMCCounter.h
//  Exe_Timer
//
//  Created by zhang xianglu on 15/4/17.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
	IMCCounterStateOn,
	IMCCounterStateOff
} IMCCounterState;

@class IMCCounter;

@protocol IMCCounterDelegate 

@optional
/** 告诉代理,计数器的值改变了 **/
- (void)IMCCounter:(IMCCounter *)counter changeCount:(NSUInteger)count;

/** 告诉代理，计数器计数结束了 **/
- (void)IMCCounterCountOver:(IMCCounter *)counter;

@end

@interface IMCCounter : NSObject

@property(nonatomic,assign,readonly) NSUInteger counter;

@property(nonatomic,assign,readonly) IMCCounterState status;

@property(nonatomic,weak) id<IMCCounterDelegate> delegate;

/** 初始化方法 **/
- (id)initWithNumber:(NSUInteger)number;

/** 启动 **/
- (void)start;

/** 暂停 **/
- (void)pause;

/** 继续 **/
- (void)resume;

/** 停止 **/
- (void)stop;

/** 重置 **/
- (void)reset;

@end
