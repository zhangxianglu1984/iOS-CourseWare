//
//  ViewController.m
//  Demo_多线程资源竞争
//
//  Created by zhang xianglu on 15/5/29.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

/**
 *  总票数
 */
@property(nonatomic,assign) NSUInteger total;

- (void)sellTicket;


@end

@implementation ViewController

- (instancetype)initWithCoder:(NSCoder *)coder
{
	self = [super initWithCoder:coder];
	if (self) {
		self.total = 1000;
	}
	return self;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSThread *subThreadA = [[NSThread alloc] initWithTarget:self selector:@selector(sellTicket) object:nil];
	subThreadA.name = @"1号售票点";
	
	NSThread *subThreadB = [[NSThread alloc] initWithTarget:self selector:@selector(sellTicket) object:nil];
	subThreadB.name = @"2号售票点";
	
	[subThreadA start];
	[subThreadB start];
}

- (void)sellTicket {
	while (YES) {
		
		//阻塞0.5秒
		//[NSThread sleepForTimeInterval:0.5f];
		@synchronized(self){
			NSUInteger total = _total;
			if (total > 0) {
				total --;
				NSLog(@"%@卖了一张票,还剩余%ld张票",[NSThread currentThread].name,total);
				self.total = total;
			}else {
				break;
			}
		}
	}
	
}

@end
