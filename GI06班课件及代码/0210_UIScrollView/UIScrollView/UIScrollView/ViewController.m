//
//  ViewController.m
//  UIScrollView
//
//  Created by jianfeng on 15/2/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
}

- (IBAction)moveToRight:(id)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // 1.创建一个scrollView
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(20, 140, 280, 200)];
    scrollView.delegate = self;
    scrollView.backgroundColor = [UIColor orangeColor];
    // 设置scrollView是否有弹簧效果
//    scrollView.bounces = NO;
    // 设置滚动条是否可见
//    scrollView.showsHorizontalScrollIndicator = NO;
//    scrollView.showsVerticalScrollIndicator = NO;
    
    // 设置缩放比例
    scrollView.maximumZoomScale = 2.0;
    scrollView.minimumZoomScale = 0.5;
    
    [self.view addSubview:scrollView];
    
    // 2.在ScrollView上添加要滚动的视图
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"image0.jpg"]];
    [scrollView addSubview:imgView];
    
    NSLog(@"%@",NSStringFromCGRect(imgView.frame));
    
    // 3.告诉scrollView要滚动的区域是多大(重要,否则不能滚动)
    scrollView.contentSize = imgView.image.size;
    
    // 设置或者是得到scrollView滚动的位置
//    scrollView.contentOffset = CGPointMake(100, 50);
    
    // 可以用来给scrollView一些额外的滚动区域
//    scrollView.contentInset = UIEdgeInsetsMake(20, 40, 60, 80);
    
    NSLog(@"%@",scrollView.subviews);
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView1
{
//    NSLog(@"%@", NSStringFromCGPoint(scrollView.contentOffset));
}

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView1
{
    // 要缩放的视图需为scrollView的子视图
    return scrollView.subviews[0];
}

// 可以手动控制(通过按钮等方式而非通过手指滑动)scrollView滚动的位置
- (IBAction)moveToRight:(id)sender {
    [scrollView setContentOffset:CGPointMake(100, 50) animated:YES];
}
@end
