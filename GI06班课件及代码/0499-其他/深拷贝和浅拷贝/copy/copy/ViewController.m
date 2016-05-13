//
//  ViewController.m
//  copy
//
//  Created by 敖 然 on 15/4/28.
//  Copyright (c) 2015年 CoderAR. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 总结：只有对不可变对象进行copy，才是浅拷贝，其他都是深拷贝~！
    
}

// 对不可变对象进行mutableCopy
// 是深拷贝
- (void)deepCopy3
{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"aaa", @"bbb", @"ccc"]];
    NSArray *arr2 = [arr copy];
    
    NSLog(@"arr2mutableCopy后的arr：%ld",(unsigned long)[arr retainCount]);
    NSLog(@"arr2mutableCopy后的arr2：%ld",(unsigned long)[arr2 retainCount]);
    
    NSLog(@"%p",arr);
    NSLog(@"%p",arr2);
}

// 对可变对象进行copy
// 是深拷贝
- (void)deepCopy2
{
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"aaa", @"bbb", @"ccc"]];
    NSMutableArray *arr2 = [arr mutableCopy];
    
    NSLog(@"arr2mutableCopy后的arr：%ld",(unsigned long)[arr retainCount]);
    NSLog(@"arr2mutableCopy后的arr2：%ld",(unsigned long)[arr2 retainCount]);
    
    NSLog(@"%p",arr);
    NSLog(@"%p",arr2);
}

// 对不可变对象进行mutableCopy
// 是深拷贝
- (void)deepCopy1
{
    NSArray *arr = @[@"aaa", @"bbb", @"ccc"];
    NSMutableArray *arr2 = [arr mutableCopy];
    
    NSLog(@"arr2mutableCopy后的arr：%ld",(unsigned long)[arr retainCount]);
    NSLog(@"arr2mutableCopy后的arr2：%ld",(unsigned long)[arr2 retainCount]);
    
    NSLog(@"%p",arr);
    NSLog(@"%p",arr2);
}


// 对不可变对象进行copy
// 是浅拷贝
- (void)lightCopy
{
    NSArray *arr = @[@"aaa", @"bbb", @"ccc"];
    
    NSLog(@"arr初始化后：%ld",(unsigned long)[arr retainCount]);
    
    [arr retain];
    
    NSLog(@"arr进行retain后：%ld",(unsigned long)[arr retainCount]);
    
    NSArray *arr2 = [arr copy];
    NSLog(@"arr2copy后的arr：%ld",(unsigned long)[arr retainCount]);
    NSLog(@"arr2copy后的arr2：%ld",(unsigned long)[arr2 retainCount]);
    
    NSLog(@"%p",arr);
    NSLog(@"%p",arr2);
}



@end
