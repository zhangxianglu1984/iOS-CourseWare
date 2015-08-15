//
//  IMCMainViewController.m
//  Demo_GCD基本使用
//
//  Created by zhang xianglu on 15/5/30.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoView;


@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
	//让任务只执行一次
//	static int a = 100;
//	a ++;
//	NSLog(@"%d",a);
	
	NSLog(@"dsfasdf");
	
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		NSLog(@"输出...");
	});
	
	NSLog(@"dfff");
	
	
	/**
	 *  去网络上下载一张图片，设置到photoView当中
	 */
	//第一步：创建串行队列
	//dispatch_queue_t queue = dispatch_queue_create("queue", nil);
	//获取全局并行队列
	//dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	
	//创建队列组
	//dispatch_queue_t queue = dispatch_queue_create("queue", nil);
	/*
	dispatch_group_t group = dispatch_group_create();
	
	NSLog(@"1：%@",[NSThread currentThread]);
	
	dispatch_group_async(group, queue, ^{
		NSLog(@"2：%@",[NSThread currentThread]);
		NSLog(@"执行队列组中的任务");
	});
	
	dispatch_group_notify(group, queue, ^{
		NSLog(@"6：%@",[NSThread currentThread]);
		NSLog(@"队列组中的任务执行完后，执行的代码");
	});
	
	dispatch_group_async(group, queue, ^{
		NSLog(@"3：%@",[NSThread currentThread]);
		NSLog(@"执行队列组中的任务");
	});
	
	dispatch_group_async(group, queue, ^{
		NSLog(@"4：%@",[NSThread currentThread]);
		NSLog(@"执行队列组中的任务");
	});
	
	dispatch_group_async(group, queue, ^{
		NSLog(@"5：%@",[NSThread currentThread]);
		NSLog(@"执行队列组中的任务");
	});
	
	dispatch_group_notify(group, queue, ^{
		NSLog(@"6：%@",[NSThread currentThread]);
		NSLog(@"队列组中的任务执行完后，执行的代码");
		
	});
	*/
	
	//第二步：向队列中放置任务
//	dispatch_async(queue, ^{
//		NSLog(@"输出所在的线程：%@",[NSThread currentThread]);
//		for (NSUInteger i = 0; i < 10000; i ++) {
//			NSLog(@"-------%lu--------",i);
//		}
//		
//		dispatch_sync(queue, ^{
//			[NSThread currentThread];
//		});
//	});
	
	/*
	__weak typeof(self) thisInstance = self;
	dispatch_async(queue, ^{
		NSLog(@"任务执行所在的线程：%@",[NSThread currentThread]);
	
		//第三步：编写任务
		NSURL *url = [NSURL URLWithString:@"http://a.hiphotos.baidu.com/image/pic/item/f7246b600c3387443bad6caa550fd9f9d62aa0f8.jpg"];
		
		NSURLRequest *request = [NSURLRequest requestWithURL:url];
		
		NSURLResponse *response;
		NSError *error;
		NSData *datas = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
		
		UIImage *photoImage = [UIImage imageWithData:datas];
		
		//将子线程中的数据传递到主线程(线程间通信)
		dispatch_async(dispatch_get_main_queue(), ^{
			NSLog(@"更新UI所在的线程：%@",[NSThread currentThread]);
			
//			[thisInstance.photoView performSelector:@selector(setImage:) withObject:photoImage];
//			
//			thisInstance.photoView.image = photoImage;

			NSLog(@"before....");
			
			//延迟执行任务的方式一
//			[thisInstance.photoView performSelector:@selector(setImage:) withObject:photoImage afterDelay:3];

			//async
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			
				NSLog(@"延迟显示：%@",[NSThread currentThread]);
				thisInstance.photoView.image = photoImage;
				
				NSLog(@"end....");
			});
			
			NSLog(@"after....");
		});
		
		
	});
	
	*/
	
	
}











@end
