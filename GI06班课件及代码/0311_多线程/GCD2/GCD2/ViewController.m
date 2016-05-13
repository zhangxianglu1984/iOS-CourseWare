//
//  ViewController.m
//  GCD2
//
//  Created by jianfeng on 15/3/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#define GLOBAL_QUEUE dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 延迟执行
    // 方法一:任务会在当前线程执行
//    [self performSelector:@selector(print) withObject:nil afterDelay:3];
    
    
    // 方法二:GCD(可以选择在哪个线程里面执行)
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), GLOBAL_QUEUE, ^{
        [self print];
    });
}

- (void)print
{
    NSLog(@"打印任务完毕");
    NSLog(@"%@",[NSThread currentThread]);
}

// 主线程更新UI
- (void)normal
{
    // GCD最常用的例子
    // 使用异步函数向全局并发队列里面添加任务
    dispatch_async(GLOBAL_QUEUE, ^{
        // 执行线程任务
        NSLog(@"hello : %@",[NSThread currentThread]);
        
        // 在主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = [UIImage imageNamed:@"02.jpg"];
        });
    });
}


@end
