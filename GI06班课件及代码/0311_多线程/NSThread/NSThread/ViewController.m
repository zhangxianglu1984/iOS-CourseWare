//
//  ViewController.m
//  NSThread
//
//  Created by jianfeng on 15/3/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // [NSThread currentThread]可以判断当前操作是执行在哪个线程中
    // 如果number 为 1,表示在主线程
    NSLog(@"viewDidLoad:%@",[NSThread currentThread]);
    
}

- (IBAction)clickButtonTop:(id)sender {
    
     NSLog(@"clickButtonTop:%@",[NSThread currentThread]);
    
    // 新建一个后台线程,并在该线程中执行调用
    [self performSelectorInBackground:@selector(costTimeTask) withObject:nil];
    
}

- (IBAction)clickButtonBottom:(id)sender {
    int n = 0;
    for (int i = 0; i < 1000; i++) {
        n++;
    }
    NSLog(@"normalTask:%d",n);
    
}

- (void)costTimeTask
{
    // 线程任务最好放到自动释放池中,否则容易引起内存泄露,而且难以发现
    @autoreleasepool {
        
        // 线程休眠(多用于调试)
//        [NSThread sleepForTimeInterval:2];
        
        NSLog(@"%@",[NSThread currentThread]);
        int n = 0;
        for (int i = 0; i < 1000; i++) {
            n++;
            // 打印日志是一个很耗时的操作,所以在应用提交appStore审核前,要去掉所有的打印语句!!!
            NSLog(@"costTimeTask:%d",n);
        }
        [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:YES];
    }
    

//    // 本例中,这个方法和上面一行方法等效
//    [self.imageView performSelectorOnMainThread:@selector(setImage:) withObject:[UIImage imageNamed:@"02.jpg"] waitUntilDone:YES];
}

- (void)updateUI
{
    NSLog(@"updateUI:%@",[NSThread currentThread]);
    self.imageView.image = [UIImage imageNamed:@"02.jpg"];
}



@end
