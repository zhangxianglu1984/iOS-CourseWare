//
//  ViewController.m
//  Demo_多线程(NSOperation)
//
//  Created by zhang xianglu on 15/6/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (void)operation:(NSString *)s;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//创建操作方式一：
//	NSInvocationOperation *invocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(operation:) object:@"HelloWorld"];
//	//多线程执行操作
//	[invocationOperation start];
	
	//创建操作方式二：
	//创建并发队列(类似于全局并发队列)
	NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
	
	//加入操作之前配置，子线程最大数量
	//operationQueue.maxConcurrentOperationCount = 3;
	
	//获得主队列
	//NSOperationQueue *mainQueue = [NSOperationQueue mainQueue];
	
	NSBlockOperation *blockOperation_1 = [NSBlockOperation blockOperationWithBlock:^{
		NSLog(@"-------------操作一开始执行---------------");
		NSLog(@"in block_1: %@",[NSThread currentThread]);
	}];
	
	[operationQueue addOperation:blockOperation_1];
	
	/*
	//向操作中添加多个任务
	[blockOperation addExecutionBlock:^{
		NSLog(@"in block_2: %@",[NSThread currentThread]);
	}];

	//向操作中添加多个任务
	[blockOperation addExecutionBlock:^{
		NSLog(@"in block_3: %@",[NSThread currentThread]);
	}];
	
	//向操作中添加多个任务
	[blockOperation addExecutionBlock:^{
		NSLog(@"in block_4: %@",[NSThread currentThread]);
	}];
	
	//向操作中添加多个任务
	[blockOperation addExecutionBlock:^{
		NSLog(@"in block_5: %@",[NSThread currentThread]);
	}];
	
	//向操作中添加多个任务
	[blockOperation addExecutionBlock:^{
		NSLog(@"in block_6: %@",[NSThread currentThread]);
	}];
	
	//向操作中添加多个任务
	[blockOperation addExecutionBlock:^{
		NSLog(@"in block_7: %@",[NSThread currentThread]);
	}];
	*/
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作二开始执行---------------");
		NSLog(@"in block_9: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作三开始执行---------------");
		NSLog(@"in block_10: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作四开始执行---------------");
		NSLog(@"in block_11: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作五开始执行---------------");
		NSLog(@"in block_9: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作六开始执行---------------");
		NSLog(@"in block_10: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作七开始执行---------------");
		NSLog(@"in block_11: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作八开始执行---------------");
		NSLog(@"in block_10: %@",[NSThread currentThread]);
	}];
	
	//为队列添加操作方式二
	[operationQueue addOperationWithBlock:^{
		//NSLog(@"-------------操作九开始执行---------------");
		NSLog(@"in block_11: %@",[NSThread currentThread]);
	}];
	
	NSBlockOperation *blockOperation_2 = [NSBlockOperation blockOperationWithBlock:^{
		NSLog(@"-------------操作二开始执行---------------");
		NSLog(@"in block_12: %@",[NSThread currentThread]);
	}];
	
	//操作二的执行，依赖于操作一，添加操作的依赖
	[blockOperation_2 addDependency:blockOperation_1];
	
	[operationQueue addOperation:blockOperation_2];
	
	NSBlockOperation *blockOperation_3 = [NSBlockOperation blockOperationWithBlock:^{
		NSLog(@"-------------操作三开始执行---------------");
		NSLog(@"in block_13: %@",[NSThread currentThread]);
	}];
	[blockOperation_3 addDependency:blockOperation_2];
	
	//操作完成后，可以做得任务(同一个线程，先后执行)
	[blockOperation_3 setCompletionBlock:^{
		NSLog(@"操作3完成啦！");
		NSLog(@"%@",[NSThread currentThread]);
	}];
	
	[operationQueue addOperation:blockOperation_3];
	
	//多线程执行操作(问题：任务可能会被分配到主线程中执行)
	//[blockOperation start];
}

- (void)operation:(NSString *)s {
	NSLog(@"%@",[NSThread currentThread]);
	NSLog(@"%@",s);
}











@end
