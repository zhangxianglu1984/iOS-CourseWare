//
//  ViewController.m
//  GCD3
//
//  Created by jianfeng on 15/3/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"

#define global_queue dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    Dog *dog1 = [Dog sharedDog];
    
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    // 只执行一次
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        NSLog(@"touch");
//    });
    
    [self groupTest];
    
}

- (void)groupTest
{
    // 群组任务:把多个任务定义到群组中,当全部任务完成之后能够得到通知
    // 1.新建群组
    dispatch_group_t group = dispatch_group_create();
    
    // 2.添加任务
    __block int n = 0;
    dispatch_group_async(group, global_queue, ^{
        for (int i = 0; i < 5; i++) {
            n += i;
        }
    });
    
    __block int m = 0;
    dispatch_group_async(group, global_queue, ^{
        for (int i = 0; i < 10; i++) {
            m += i;
        }
    });
    
    // 3.群组任务完成后得到通知
    dispatch_group_notify(group, global_queue, ^{
        NSLog(@"m:%d + n:%d = %d",n,m,n + m);
    });
}


@end
