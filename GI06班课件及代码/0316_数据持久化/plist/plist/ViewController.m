//
//  ViewController.m
//  plist
//
//  Created by jianfeng on 15/3/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"

@interface ViewController ()
{
    NSString *plistName;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 沙盒根路径
    NSString *homePath = NSHomeDirectory();
    // 获取documents文件夹
    NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
    NSLog(@"%@",docPath);
    plistName = [docPath stringByAppendingPathComponent:@"data.plist"];
}

- (IBAction)saveData:(id)sender {
    // 自定义的类不能写入plist
    Student *stu = [[Student alloc]init];
    stu.name = @"mengmeng";
    stu.age = 18;
    
    // 数据
    NSArray *arr = @[@"abc",@12, @YES];
    [arr writeToFile:plistName atomically:YES];
}
- (IBAction)readData:(id)sender {
    
    NSArray *arr = [NSArray arrayWithContentsOfFile:plistName];
    NSLog(@"%@",arr);
}

@end
