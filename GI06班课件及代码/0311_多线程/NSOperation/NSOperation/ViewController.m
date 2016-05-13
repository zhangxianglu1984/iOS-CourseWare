//
//  ViewController.m
//  NSOperation
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSOperationQueue *queue;
}

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化一个操作队列
    queue = [[NSOperationQueue alloc]init];
    // 设置最大并发数,
    [queue setMaxConcurrentOperationCount:2];
}
- (IBAction)clickButton:(id)sender {
    // NSOperation是一个抽象类,主要使用他的两个子类:NSInvocationOperation和operationBlock
    NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(costTimeTask) object:nil];
//    // 如果直接调用start方法,那么要执行的方法仍然是在主线程中
////    [operation start];
    // 把操作放到队里,就会马上执行(而且任务是执行在子线程)
    [queue addOperation:operation];
    
    NSBlockOperation *operationBlock = [NSBlockOperation blockOperationWithBlock:^{
        [self costTimeTask];
    }];
    [queue addOperation:operationBlock];
    
    // 添加依赖关系
//    [self dependencyTest];

}

- (void)dependencyTest
{
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"步骤1");
    }];
    
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"步骤2");
    }];
    
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"步骤3");
    }];
    
    // 可以通过添加依赖关系确定他们的执行顺序
    // op2依赖于op1的执行(op1执行完毕才执行op2)
    // 注意:在给操作添加依赖关系的时候不要添加循环依赖,否则线程任务都不能执行
    [op2 addDependency:op1];
    [op3 addDependency:op2];
    
    //    // 以下方法可以取消依赖关系
    //    [op3 removeDependency:op2];
    
    
    // 添加到操作队列的顺序并不等同于执行顺序
    [queue addOperation:op3];
    [queue addOperation:op1];
    [queue addOperation:op2];
}

- (void)costTimeTask
{
    @autoreleasepool {
        NSLog(@"%@",[NSThread currentThread]);
        int n = 0;
        for (int i = 0; i < 300; i++) {
            n++;
//            NSLog(@"-------%d",n);
        }
        
        // 在主线程中更新UI
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            self.imageView.image = [UIImage imageNamed:@"02"];
        }];
    }
    

}
@end








