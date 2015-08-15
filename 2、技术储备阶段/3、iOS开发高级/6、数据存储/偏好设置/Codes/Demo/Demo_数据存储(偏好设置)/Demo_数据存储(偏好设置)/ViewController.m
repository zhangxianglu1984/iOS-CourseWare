//
//  ViewController.m
//  Demo_数据存储(偏好设置)
//
//  Created by zhang xianglu on 15/6/29.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

#import <CommonCrypto/CommonDigest.h>
#import "AFNetworking.h"

@interface ViewController ()



@end

@implementation ViewController

+ (NSString *)md5HexDigest:(NSString*)input 
{
	const char* str = [input UTF8String];
	unsigned char result[CC_MD5_DIGEST_LENGTH];
	CC_MD5(str, strlen(str), result);
	NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
	
	for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
		[ret appendFormat:@"%02x",result[i]];
	}    
	return ret;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	
	//1、用户输入用户名和密码
	//2、把用户名和加密后的密码传给服务器
	//3、如果密码正确，提示登录成功
	//4、将正确的用户名和密码(已经加好密：32位大写)存储在本地，供其他模块使用
	/**
	 *	数据存储(方法一：偏好设置)
	 */
	//获取偏好设置工具
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	//往设置中存放数据(键值对)
	[userDefaults setObject:@"1390000000" forKey:@"UID"];
	[userDefaults setObject:@"123456" forKey:@"PSW"];
	
	//立即写入偏好设置文件
	[userDefaults synchronize];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	//偏好设置-读取操作
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
