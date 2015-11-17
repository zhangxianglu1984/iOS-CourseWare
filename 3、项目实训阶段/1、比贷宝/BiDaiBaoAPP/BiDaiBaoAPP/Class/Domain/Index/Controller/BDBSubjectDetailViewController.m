//
//  BDBSubjectDetailViewController.m
//  BiDaiBaoAPP
//
//  Created by xiangluzhang on 15/10/29.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "BDBSubjectDetailViewController.h"

@interface BDBSubjectDetailViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *subjectDetailWebView;

@property(nonatomic,weak) BDBLoadDataIndicateView *loadDataIndicateView;

- (void)p_initSubjectDetailWebView;

@end

@implementation BDBSubjectDetailViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        self.title = @"比贷宝";
        self.hidesBottomBarWhenPushed = YES;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.loadDataIndicateView = [BDBLoadDataIndicateView showInView:self.view];
    
    [self p_initSubjectDetailWebView];
}

#pragma mark - UIWebView Delegate Methods
- (void)webViewDidFinishLoad:(UIWebView *)webView {
    [_loadDataIndicateView hide];
}

#pragma mark - Private Methods
- (void)p_initSubjectDetailWebView {
    _subjectDetailWebView.delegate = self;
    _subjectDetailWebView.scalesPageToFit = YES;
    
    NSURL *requestURL = [NSURL URLWithString:_detailURL];
    NSURLRequest *URLRequest = [NSURLRequest requestWithURL:requestURL];
    
    [_subjectDetailWebView loadRequest:URLRequest];
}



@end
