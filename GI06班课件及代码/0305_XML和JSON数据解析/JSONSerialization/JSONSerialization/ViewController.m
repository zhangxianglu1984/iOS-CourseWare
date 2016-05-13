//
//  ViewController.m
//  JSONSerialization
//
//  Created by jianfeng on 15/3/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController


- (IBAction)request:(id)sender {
    
    NSString *urlString = @"http://api.k780.com:88/?app=weather.future&weaid=1&appkey=10003&sign=b59bc3ef6191eb9f747dd4e83c99f2a4&format=json";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    // 1.使用苹果自己提供的NSJSONSerialization
    // 2.使用一些第三方框架(SBJSON,JSONKit)
    if (data) {
        NSError *jsonError = nil;
        NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data options:0 error:&jsonError];
        NSArray *array = result[@"result"];
        NSLog(@"dic:%@",result);
        NSLog(@"array:%@",array);
    }
}

@end














