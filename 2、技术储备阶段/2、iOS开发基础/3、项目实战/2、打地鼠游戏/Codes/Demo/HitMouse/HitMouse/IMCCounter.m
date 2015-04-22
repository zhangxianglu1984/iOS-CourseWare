//
//  IMCCounter.m
//  Exe_Timer
//
//  Created by zhang xianglu on 15/4/17.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCCounter.h"

@interface IMCCounter () 

@property(nonatomic,strong) NSTimer *timer;
@property(nonatomic,assign) NSUInteger counter;
@property(nonatomic,assign) NSUInteger number;
@property(nonatomic,assign) IMCCounterState status;

/** 计数 **/
- (void)count:(NSTimer *)timer;

@end

@implementation IMCCounter


#pragma mark - Init Methods
- (id)initWithNumber:(NSUInteger)number {
	if (self = [super init]) {
		/** 定时器的初始化 **/
		self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(count:) userInfo:nil repeats:YES];
		_timer.fireDate = [NSDate distantFuture];
		
		/** number初始化 **/
		self.number = number;
		
		/** count初始化 **/
		self.counter = number;
		
		/** state初始化 **/
		self.status = IMCCounterStateOff;
	}
	return self;
}

#pragma mark - Setters And Getters
- (void)setStatus:(IMCCounterState)status {
	_status = status;
	switch (_status) {
  		case IMCCounterStateOn:
			_timer.fireDate = [NSDate distantPast];
			break;
			
		case IMCCounterStateOff:
			_timer.fireDate = [NSDate distantFuture];
			break;
			
  		default:
			break;
	}
}

#pragma mark - Public Methods
- (void)start {
	self.status = IMCCounterStateOn;
}

- (void)pause {
	self.status = IMCCounterStateOff;
}


- (void)resume {
	self.status = IMCCounterStateOn;
}


- (void)stop {
	self.status = IMCCounterStateOff;
	self.counter = _number;
	
	[_delegate counterCountOver:self];
}

#pragma mark - Private Methods
- (void)count:(NSTimer *)timer {
	self.counter --;
	if (_counter == 0) {
		[self stop];
	}
}

- (void)setCounter:(NSUInteger)counter {
	_counter = counter;
	[_delegate counter:self changeCount:_counter];
}

@end








