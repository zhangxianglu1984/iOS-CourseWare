//
//  ViewController.m
//  Demo_NSURLConnection
//
//  Created by zhang xianglu on 15/6/1.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	/**
	 * 你要访问那台服务器的资源？
	 */
	NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
	
	/**
	 * 构造一个http请求(Request)
	 */
	//NSURLRequest *request = [NSURLRequest requestWithURL:url];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	request.HTTPMethod = @"POST";
	
	NSString *params = [NSString stringWithFormat:@"Machine_id=xx&Device=0&Key=ddddd"];
	
	request.HTTPBody = [params dataUsingEncoding:NSUTF8StringEncoding];
	
	
	/**
	 *  将请求发送给服务器
	 */
//	NSURLResponse *response;
//	NSError *error;
	/**
	 *  在当前线程发送一个HTTP请求
	 */
//	NSData *datas = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
	
	/**
	 *  queue参数，表示completionHandler块要在哪个队列中执行
	 */
	 
	 NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	[NSURLConnection sendAsynchronousRequest:request queue: queue completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
		
		NSLog(@"当前线程: %@",[NSThread currentThread]);
		
		NSString *content = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		NSLog(@"content: %@",content);
		
	}];
	
	
//	NSString *content = [[NSString alloc] initWithData:datas encoding:NSUTF8StringEncoding];
//	NSLog(@"%@",content);
	
	
}

@end
