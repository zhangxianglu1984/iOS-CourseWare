//
//  DetailViewController.m
//  zh
//
//  Created by jianfeng on 15/3/18.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DetailViewController.h"
#import "AFNetworking.h"
#import "ConnTool.h"
#import "Defines.h"
#import "UIKit+AFNetworking.h"
#import "SubDetailViewController.h"

#define kBottomBarHeight 40

@interface DetailViewController ()<UIWebViewDelegate>
{
    UIWebView *webView;
    UIImageView *imgView;
    
    NSTimer *timer;
    NSInteger counter;
}

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self initViews];
    [self getData];
    
    // 测试用timer,用于演示定时器持有控制器
    counter = 0;
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(dealWithTimer) userInfo:nil repeats:YES];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES
                                             animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    if (timer){
        [timer invalidate];
        timer = nil;
    }
}

- (void)dealWithTimer
{
    counter++;
    NSLog(@"%ld",(long)counter);
}


- (void)initViews
{
    [self initWebView];
    
    // 防止bottomBar的阴影不被覆盖,要先添加webView再添加bottomBar
    UIView *bottomBar = [[UIView alloc]initWithFrame:CGRectMake(0,kScreenHeight - kBottomBarHeight, kScreenWidth, kBottomBarHeight)];
    bottomBar.backgroundColor = [UIColor whiteColor];
    bottomBar.layer.shadowColor = [UIColor grayColor].CGColor;
    bottomBar.layer.shadowOffset = CGSizeMake(2, 2);
    bottomBar.layer.shadowOpacity = 1;
    [self.view addSubview:bottomBar];
    
    // 返回按钮
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(40, 0, 60, 40);
    [backButton setTitle:@"<" forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(clickBackButton:) forControlEvents:UIControlEventTouchUpInside];
    [backButton setTitleColor:[UIColor blackColor]
                     forState:UIControlStateNormal];
    [bottomBar addSubview:backButton];
    
    // 为了能让图片跟随文章一起滚动,所以放在webview.scorllview上
    imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 80)];
    imgView.contentMode = UIViewContentModeScaleAspectFill;
    [webView.scrollView addSubview:imgView];
    
}

- (void)initWebView
{
    webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - kBottomBarHeight)];
    webView.delegate = self;
    webView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:webView];
}

- (void)getData
{
    NSString *urlStr = [NSString stringWithFormat:@"%@%@",kGetStoriesDetail,self.storyID];
    [ConnTool connWithURL:urlStr successBlock:^(NSDictionary *dic) {
        NSLog(@"%@",dic);
        // 加载html代码
        // <link href="style.css" rel="stylesheet" type="text/css" />
        NSString *cssUrlStr = dic[@"css"][0];
        NSString *linkStr = [NSString stringWithFormat:@"<link href=\"%@\" rel=\"stylesheet\" type=\"text/css\"/>",cssUrlStr];
        NSString *body = dic[@"body"];
        NSString *finalHtmlStr = [NSString stringWithFormat:@"%@%@",linkStr,body];
        [webView loadHTMLString:finalHtmlStr baseURL:nil];
        
        // 显示图片
        [imgView setImageWithURL:[NSURL URLWithString:dic[@"image"]]];
    } andFailBlock:^(NSError *error) {
        NSLog(@"error:%@",error.localizedDescription);
    }];
}

#pragma mark - click

- (void)clickBackButton:(UIButton *)btn
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - webViewDelegate

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    /*
        UIWebViewNavigationTypeLinkClicked,
        UIWebViewNavigationTypeFormSubmitted,
        UIWebViewNavigationTypeBackForward,
        UIWebViewNavigationTypeReload,
        UIWebViewNavigationTypeFormResubmitted,
        UIWebViewNavigationTypeOther
     */
    if (navigationType == UIWebViewNavigationTypeLinkClicked){
        NSLog(@"%@",request.URL.absoluteString);
        SubDetailViewController *subDetail = [[SubDetailViewController alloc]init];
        subDetail.reqest = request;
        [self.navigationController pushViewController:subDetail animated:YES];
        return NO;
    }
//    NSLog(@"%d",navigationType);
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView1
{
    // 使用这句让webView执行JS语句
//    [webView1 stringByEvaluatingJavaScriptFromString:@"alert(\"hello\")"];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView1
{
    
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    
}

- (void)dealloc{
    NSLog(@"detail dealloc");
}


@end
