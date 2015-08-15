//
//  ViewController.m
//  Demo_UIWebView
//
//  Created by zhang xianglu on 15/6/29.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property(nonatomic,weak) UIView *loadPage;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	UIView *loadPage = [[UIView alloc] init];
	loadPage.backgroundColor = [UIColor redColor];
	[self.view addSubview:loadPage];
	
	self.loadPage = loadPage;
	
	loadPage.translatesAutoresizingMaskIntoConstraints = NO;
	
	for (NSString *visualFormat in @[@"H:|[loadPage]|",@"V:|[loadPage]|"]) {
		NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:nil views:@{@"loadPage":loadPage}];
		
		[self.view addConstraints:constraints];
	}
	
	//第一步，构建NSURL
	NSURL *url = [NSURL URLWithString:@"http://www.baidu.com"];
	//第二步，构建NSURLRequest
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	_webView.delegate = self;
	
	//第三步,异步加载页面
	[_webView loadRequest:request];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView {
	[_loadPage removeFromSuperview];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
}

@end
