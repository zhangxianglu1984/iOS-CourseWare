//
//  ViewController.m
//  NetWorking
//
//  Created by jianfeng on 15/3/4.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLConnectionDataDelegate>
{
    NSMutableData *serverData;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 网络基础
}

// 使用GET方式进行网络异步请求
- (IBAction)get:(id)sender {
    // 1.确定URL地址
    NSString *urlString = @"http://wxdata.weather.com/wxdata/weather/local/CHXX0138?cc=*&unit=m&dayf=2";
    
    // 如果url里面包含中文,需要进行特殊的处理(否则不能正常请求数据)
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2.建立请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.进行连接
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    [conn start];
    
    // 等待网络处理
    // 4.处理服务器返回的数据(在NSURLConnectionDataDelegate的协议方法中实现)
}

// 使用POST方式进行网络请求
- (IBAction)post:(id)sender {
    // post请求方式的过程和get基本一致,唯一不同的是对于请求的处理
    
    
    // 1.确定URL地址
    NSString *urlString = @"http://bulo2bulo.com:8080/mobile/api/passport/login.do";
    
    /*http://bulo2bulo.com:8080/mobile/api/passport/login.do?phoneNumber=13528562562&password=qq147523&device=mi3&client=ios*/
    
    // 如果url里面包含中文,需要进行特殊的处理(否则不能正常请求数据)
    urlString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];

// -------- 下面这块表示了POST和GET请求的不同之处
    
    // 2.建立请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    // 把请求参数放到请求体中
    NSString *bodyString = @"phoneNumber=13528562562&password=qq147523&device=mi3&client=ios";
    NSData *bodyData = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    [request setHTTPBody:bodyData];
    
    // 指定请求方式为post
    [request setHTTPMethod:@"post"];// post大小写都可以
    
    // 指定服务器响应超时时间
    [request setTimeoutInterval:30];
    
// ---------
    
    // 3.进行连接
    NSURLConnection *conn = [NSURLConnection connectionWithRequest:request delegate:self];
    [conn start];
}

// 进行同步连接
// 同步的get请求(异步也是可以的,这里只用get做例子)
- (IBAction)sync:(id)sender {
    // 1.确定URL地址
    NSString *urlString = @"http://wxdata.weather.com/wxdata/weather/local/CHXX0138?cc=*&unit=m&dayf=2";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2.建立请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.进行同步连接
    
    // 指向指针的指针
    /*只要在参数中看到*__autoreleasing *字样,就取地址*/
    NSURLResponse *response = nil;
    NSError *error = nil;
    
    // 同步操作完成前不会执行后面的代码
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    serverData = [data mutableCopy];
    if (error) {
        NSLog(@"error:%@",error.localizedDescription);
    }
    else{
        NSString *str = [[NSString alloc]initWithData:serverData encoding:NSUTF8StringEncoding];
        NSLog(@"接收到的数据是:%@",str);
    }
}

// 异步发送请求
- (IBAction)ansync:(id)sender {
    // 1.确定URL地址
    NSString *urlString = @"http://wxdata.weather.com/wxdata/weather/local/CHXX0138?cc=*&unit=m&dayf=2";
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    // 2.建立请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    // 3.进行异步连接
    // [NSOperationQueue mainQueue]表示主线程
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                               serverData = [data mutableCopy];
                               if (connectionError) {
                                   NSLog(@"error:%@",connectionError.localizedDescription);
                               }
                               else{
                                   NSString *str = [[NSString alloc]initWithData:serverData encoding:NSUTF8StringEncoding];
                                   NSLog(@"异步连接接收到的数据是:%@",str);
                               }
                           }];
    
}
#pragma mark - NSURLConnectionDataDelegate

// 开始接收服务器返回的请求
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"开始接收请求");
}

// 接收数据的过程(可能被多次调用)
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (!serverData) {
        serverData = [NSMutableData data];
    }
    [serverData appendData:data];
}

// 数据接收完成时调用
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 接收完成后,serverData就是一个完整的数据了
    NSString *receiveDataStr = [[NSString alloc]initWithData:serverData encoding:NSUTF8StringEncoding];
    NSLog(@"最终获取的数据:%@",receiveDataStr);
    // 清空数据,防止多次请求的数据叠加
    serverData = nil;
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // 把发生的网络错误转化成字符串
    NSLog(@"%@",error.localizedDescription);
    // 如果网络请求失败,也要讲数据清空
    serverData = nil;
}

@end








