//
//  ViewController.m
//  GCD
//
//  Created by jianfeng on 15/3/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"viewDidLoad:%@",[NSThread currentThread]);

}


// 使用同步函数往全局并发队列里面添加任务
- (void)syncGlobal
{
    // 1.获取一个并发队列
    // GCD已经默认给我们提供一个全局的并发队列
    // 参数:第一个:优先级 第二个:保留参数(用不到)直接传0
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    // 2.使用同步函数把任务放到全局并发队列
    dispatch_sync(queue, ^{
        NSLog(@"任务一:%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"任务二:%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"任务三:%@",[NSThread currentThread]);
    });
    
    // 结果:没有开启新的线程,都是在主线程(当前线程)运行
}
// 使用同步函数往串行队列里面添加任务
- (void)syncSerial
{
    // 1.需要自己创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue1", NULL);
    
    dispatch_sync(queue, ^{
        NSLog(@"任务一:%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"任务二:%@",[NSThread currentThread]);
    });
    
    dispatch_sync(queue, ^{
        NSLog(@"任务三:%@",[NSThread currentThread]);
    });
    
    // 结果:没有开启新的线程,都是在主线程(当前线程)运行
}

// 使用异步函数往串行队列里面添加任务
- (void)asyncSerial
{
    // 1.创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue2", NULL);
    
    // 2.添加任务
    dispatch_async(queue, ^{
        NSLog(@"任务一:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务二:%@",[NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"任务三:%@",[NSThread currentThread]);
    });
    
    // 结果:三个任务都在同一个("同一个"是因为加到了串行队列)新开辟(使用异步函数,有开辟新线程的能力)的子线程里执行
}

// 使用异步函数往并发队列里面添加任务(多使用这种方法,并发执行任务)
- (void)asyncGlobal
{
    // 1.获得一个全局并发队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    // 2.添加任务
    dispatch_async(queue, ^{
        NSLog(@"任务一:%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"任务二:%@",[NSThread currentThread]);
    });
    
    dispatch_async(queue, ^{
        NSLog(@"任务三:%@",[NSThread currentThread]);
    });
    
    // 结果:会开辟新线程,而且三个任务处于不同的线程中
}

// 使用同步函数向主队列添加任务(不可以的!!!)
- (void)syncMain
{
    // 1.获取队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 2.添加任务
    // 同步函数:只有在完成了预定的任务后才返回
    
    // 注意:不能够使用同步函数向主队列里面添加任务,否则不能执行
    dispatch_sync(queue, ^{
        NSLog(@"hello world");
    });
}

// 只能使用异步函数向主队列添加任务
- (void)asyncMain
{
    // 1.获取队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    // 2.添加任务
    dispatch_async(queue, ^{
        NSLog(@"hello world:%@",[NSThread currentThread]);
    });
}

@end





