//
//  PinkViewController.m
//  BlockRetainCycle
//
//  Created by 敖 然 on 15/4/28.
//  Copyright (c) 2015年 CoderAR. All rights reserved.
//

#import "PinkViewController.h"

typedef void(^MyBlock)();

@interface PinkViewController ()
{
    NSInteger age;
}

@property (nonatomic, copy) MyBlock block;

@end

@implementation PinkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    __weak PinkViewController *weakSelf = self;
//    __weak typeof(self) wSelf = self;

    self.block = ^{
//        NSLog(@"执行了block");
//        [wSelf print];
        NSLog(@"%d",age);
    };
    
    self.block();
}

- (void)print
{
    NSLog(@"print方法调用");
}

- (void)dealloc
{
    NSLog(@"pink dealloc");
}



@end
