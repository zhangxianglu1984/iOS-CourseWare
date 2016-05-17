//
//  ViewController.m
//  NSThread2
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (IBAction)clickButton:(id)sender {
    // 使用NSThread创建一个新的线程有三种方法
    // performSelector...(见上一个工程)
    
    // 方法二:执行完这句后直接执行线程任务
    [NSThread detachNewThreadSelector:@selector(costTimeTask) toTarget:self withObject:nil];
    
    // 实例方法创建线程执行任务,需要使用start让线程运行
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(costTimeTask) object:nil];
//    [thread start];
    
//    [self costTimeTaskLoop];
}

- (void)costTimeTask
{
    NSLog(@"%@",[NSThread currentThread]);
    // 线程任务最好放到自动释放池中,否则容易引起内存泄露,而且难以发现
    @autoreleasepool {
        
        NSLog(@"costTimeTask:%@",[NSThread currentThread]);
        int n = 0;
        for (int i = 0; i < 1000; i++) {
            n++;
            // 打印日志是一个很耗时的操作,所以在应用提交appStore审核前,要去掉所有的打印语句!!!
            NSLog(@"costTimeTask:%d",n);
        }
    }
}

- (void)costTimeTaskLoop
{
    for (int i = 0 ; i < 20; i++) {
        NSLog(@"currentThread:%@",[NSThread currentThread]);
        [NSThread detachNewThreadSelector:@selector(costTimeTask) toTarget:self withObject:nil];
    }
}

@end
