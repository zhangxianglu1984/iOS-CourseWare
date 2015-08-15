//
//  IMCMainViewController.m
//  Demo_对象归档
//
//  Created by zhang xianglu on 15/7/2.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "IMCPerson.h"
#import "IMCPolice.h"

@interface IMCMainViewController ()

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	//一次性归档多个对象
//	NSMutableData *datas = [NSMutableData data];
//	
//	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:datas];
//	
//	[archiver encodeObject:@"1" forKey:@"1"];
//	[archiver encodeObject:@"1" forKey:@"1"];
//	[archiver encodeObject:@"1" forKey:@"1"];
//	[archiver encodeObject:@"1" forKey:@"1"];
//	
//	[archiver finishEncoding];
//	
//	[datas writeToFile:dkjf atomically:sdf];

	//读取一次性归档的对象
	NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:[NSData dataWithContentsOfFile:@""]];
	
//	NSString *p1 = [unarchiver decodeObjectForKey:@"1"];
//	NSString *p1 = [unarchiver decodeObjectForKey:@"1"];
//	NSString *p1 = [unarchiver decodeObjectForKey:@"1"];
//	NSString *p1 = [unarchiver decodeObjectForKey:@"1"];

	[unarchiver finishDecoding];	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	IMCPolice *police = [[IMCPolice alloc] init];
	police.name = @"李四";
	police.age = 150;
	police.brand = @"督查";	
	
	NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
	
	NSString *archivedFilePath = [cachePath stringByAppendingPathComponent:@"userPhoto.archive"];
	
	[NSKeyedArchiver archiveRootObject:police toFile:archivedFilePath];
		
		
		//获取Documents路径 Library/Cache
//	NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//	
//	NSString *archivedFilePath = [cachePath stringByAppendingPathComponent:@"userPhoto.archive"];
//	
//	IMCPerson *person = [NSKeyedUnarchiver unarchiveObjectWithFile:archivedFilePath];
//	
//	NSLog(@"%@",person);


//	IMCPerson *person = [[IMCPerson alloc] init];
//	person.name = @"张三";
//	person.age = 100;
//	
//	//获取Documents路径 Library/Cache
//	NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
//	
//	NSString *archivedFilePath = [cachePath stringByAppendingPathComponent:@"userPhoto.archive"];
//	
//	//将自定义的person对象归档
//	[NSKeyedArchiver archiveRootObject:person toFile:archivedFilePath];
}


@end
