//
//  ViewController.m
//  NSCoding
//
//  Created by jianfeng on 15/3/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Student.h"
#import "Monitor.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)save:(id)sender {
//    [self normalObjArchive];
//    [self customObjArchive];
//    [self customSubObjArchive];
    
    [self multiObjsArchive];
    
}

- (IBAction)read:(id)sender {
//    [self normalObjUnarchive];
//    [self customObjUnarchive];
//    [self customSubObjUnarchive];
    [self multiObjsUnarchive];
}

// 返回沙盒中文件路径
- (NSString *)filePath
{
    NSString *homePath = NSHomeDirectory();
    NSString *docPath = [homePath stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"data.txt"];
    return filePath;
}

// 对普通的对象进行归档
- (void)normalObjArchive
{
    // 准备数据
    NSArray *arr = @[@"abc", @"def", @123];
    
    NSLog(@"%@",[self filePath]);
    BOOL success = [NSKeyedArchiver archiveRootObject:arr toFile:[self filePath]];
    if (success) {
        NSLog(@"归档成功");
    }
}

// 对普通的对象进行解档
- (void)normalObjUnarchive
{
    NSArray *arr = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"%@",arr);
}

// 对自定义的对象进行归档
- (void)customObjArchive
{
    Student *stu = [[Student alloc]init];
    stu.name = @"mm";
    stu.age = 18;
    
    BOOL success = [NSKeyedArchiver archiveRootObject:stu toFile:[self filePath]];
    if (success) {
        NSLog(@"归档自定义对象成功");
    }
}

// 对自定义对象进行解档
- (void)customObjUnarchive
{
    Student *stu = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"%@",stu);
}

// 对自定义对象的子类进行归档
- (void)customSubObjArchive
{
    Monitor *stu = [[Monitor alloc]init];
    stu.name = @"mm";
    stu.age = 18;
    stu.position = @"班长";
    
    BOOL success = [NSKeyedArchiver archiveRootObject:stu toFile:[self filePath]];
    if (success) {
        NSLog(@"归档自定义对象成功");
    }
}

// 对自定义对象子类进行解档
- (void)customSubObjUnarchive
{
    Monitor *stu = [NSKeyedUnarchiver unarchiveObjectWithFile:[self filePath]];
    NSLog(@"%@",stu);
}

// 归档多个对象
- (void)multiObjsArchive
{
    /* 除了将多个对象放置于数组或者字典中,再进行归档,
     * 要想一次性归档多个对象还可以使用以下方法
     */
    
    // 使用NSData实例作为归档的数据
    
    // 准备数据(NSMultableData)
    NSMutableData *data = [NSMutableData data];
    
    // 初始化archiver,并和data联系起来
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc]initForWritingWithMutableData:data];
    
    Student *stu1 = [[Student alloc]init];
    stu1.name = @"mm1";
    stu1.age = 18;
    
    Student *stu2 = [[Student alloc]init];
    stu2.name = @"mm2";
    stu2.age = 19;
    
    [archiver encodeObject:stu1 forKey:@"stu1"];
    [archiver encodeObject:stu2 forKey:@"stu2"];
    [archiver finishEncoding];
    
    BOOL success = [data writeToFile:[self filePath] atomically:YES];
    if (success) {
        NSLog(@"写入多个对象成功");
    }
}

// 解档多个对象
- (void)multiObjsUnarchive
{
    NSData *data = [NSData dataWithContentsOfFile:[self filePath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc]initForReadingWithData:data];
    Student *stu1 = [unarchiver decodeObjectForKey:@"stu1"];
    Student *stu2 = [unarchiver decodeObjectForKey:@"stu2"];
    NSLog(@"%@--%@",stu1, stu2);
    
}
@end









