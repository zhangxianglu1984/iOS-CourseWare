//
//  SubDetailViewController.m
//  zh
//
//  Created by jianfeng on 15/3/25.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "SubDetailViewController.h"

@interface SubDetailViewController ()<UIWebViewDelegate>

@end

@implementation SubDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIWebView *web = [[UIWebView alloc]initWithFrame:self.view.bounds];
    [web loadRequest:self.reqest];
    web.delegate = self;
    [self.view addSubview:web];

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView1
{
    // document.title是js获取网页标题的方法
    NSString *str = [webView1 stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.title = str;
}


@end
