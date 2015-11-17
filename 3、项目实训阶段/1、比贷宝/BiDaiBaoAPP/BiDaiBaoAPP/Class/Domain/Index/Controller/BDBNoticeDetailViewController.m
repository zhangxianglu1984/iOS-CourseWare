//
//  BDBNoticeDetailViewController.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/22.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBNoticeDetailViewController.h"

@interface BDBNoticeDetailViewController () <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *noticeDetailWebView;

@property(nonatomic,weak) BDBLoadDataIndicateView *loadDataIndicateView;

- (void)p_initNoticeDetailWebView;

@end

@implementation BDBNoticeDetailViewController

- (instancetype)initWithCoder:(NSCoder *)coder {
    if (self = [super initWithCoder:coder]) {
        self.title = @"比贷宝";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadDataIndicateView = [BDBLoadDataIndicateView showInView:self.view];
    
    [self p_initNoticeDetailWebView];
}

#pragma mark - Private Methods
- (void)p_initNoticeDetailWebView {
    
    _noticeDetailWebView.delegate = self;
    
    NSURL *requestURL = [NSURL URLWithString:_noticeDetailURL];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:requestURL];
    
    [_noticeDetailWebView loadRequest:request];
}

#pragma mark - UIWebView Delegate Methods
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_loadDataIndicateView hide];
}


@end
