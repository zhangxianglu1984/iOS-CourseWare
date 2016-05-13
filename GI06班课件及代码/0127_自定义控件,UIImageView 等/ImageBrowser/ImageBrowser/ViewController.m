//
//  ViewController.m
//  ImageBrowser
//
//  Created by jianfeng on 15/1/27.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()
{
    UIToolbar *toolBar;
    UIImageView *imageView;
    UIProgressView *progressView;
    NSArray *imageNameArray;
    NSInteger index;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initData];
    [self initViews];
    [self updateDisplay];
    
}

- (void)initViews
{
    UIBarButtonItem *lastItem = [[UIBarButtonItem alloc]initWithTitle:@"上一张" style:UIBarButtonItemStylePlain target:self action:@selector(last:)];
    lastItem.enabled = NO;
    
    UIBarButtonItem *nextItem = [[UIBarButtonItem alloc]initWithTitle:@"下一张" style:UIBarButtonItemStylePlain target:self action:@selector(next:)];
    
    UILabel *countTitle = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 50, 44)];
//    countTitle.text = @"1/8";
    countTitle.textAlignment = NSTextAlignmentCenter;
    UIBarButtonItem *labelItem = [[UIBarButtonItem alloc]initWithCustomView:countTitle];
    
    UIBarButtonItem *flexibleItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    
    toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 20, kScreenWidth, 44)];
    toolBar.items = @[lastItem, flexibleItem, labelItem, flexibleItem, nextItem];
    [self.view addSubview:toolBar];
    
    // UIView
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 280, 350)];
//    imageView.backgroundColor = [UIColor orangeColor];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
//    imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"01.jpg"]];
    imageView.center = self.view.center;
//    imageView.image = [UIImage imageNamed:@"01.jpg"];
    [self.view addSubview:imageView];
    
    progressView = [[UIProgressView alloc]initWithFrame:CGRectMake(30, kScreenHeight - 40, 260, 50)];
//    progressView.progress = 1.0/imageNameArray.count;
    [self.view addSubview:progressView];
}

- (void)initData
{
    index = 0;
    
    NSMutableArray *temp = [NSMutableArray array];
    
    for (NSInteger i = 0; i < 8; i++) {
        NSString *imageName = [NSString stringWithFormat:@"%02d.jpg",i+1];
        [temp addObject:imageName];
    }
    imageNameArray = [NSArray arrayWithArray:temp];
}

#pragma mark - click method

- (void)last:(UIBarButtonItem *)item
{
    index--;
//    if (index == 0) {
//        lastItem.enabled = NO;
//    }
//    nextItem.enabled = YES;
    
    [self updateDisplay];
}

- (void)next:(UIBarButtonItem *)item
{
    index++;
//    if (index == imageNameArray.count - 1) {
//        nextItem.enabled = NO;
//    }
//    lastItem.enabled = YES;

    [self updateDisplay];
}

- (void)updateDisplay
{
    ((UIBarButtonItem *)toolBar.items[0]).enabled = !(index == 0);
    ((UIBarButtonItem *)toolBar.items[4]).enabled = !(index == imageNameArray.count - 1);
    
    // 取图片
    NSString *imageName = imageNameArray[index];
    imageView.image =[UIImage imageNamed:imageName];
    
    // 更新标题
    NSInteger imageNameArrayCount = imageNameArray.count;
    UIBarButtonItem *titleItem = (UIBarButtonItem *)toolBar.items[2];
    ((UILabel *)titleItem.customView).text = [NSString stringWithFormat:@"%d/%d",index+1,imageNameArrayCount];
    float persent = (index + 1)/(float)imageNameArrayCount;
    
    // 更新进度条
    [progressView setProgress:persent animated:YES];
}

@end
