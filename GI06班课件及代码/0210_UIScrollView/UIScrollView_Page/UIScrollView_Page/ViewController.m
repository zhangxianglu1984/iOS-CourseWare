//
//  ViewController.m
//  UIScrollView_Page
//
//  Created by jianfeng on 15/2/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#define kImageWidth 173
#define kImageHeight 130
#define kImageCount 5

@interface ViewController ()<UIScrollViewDelegate>
{
    UIScrollView *scrollView;
    UIPageControl *pageControl;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.创建scrollView
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(50, 50, kImageWidth, kImageHeight)];
    scrollView.delegate = self;
    // 设置是否分页滑动
    scrollView.pagingEnabled = YES;

    [self.view addSubview:scrollView];
    
    // 2.把图片放在scrollView上并排列好
    for (int i = 0; i < kImageCount; i++) {
        UIImageView *imageView0 = [[UIImageView alloc]initWithFrame:CGRectMake(kImageWidth * i, 0, kImageWidth, kImageHeight)];
        NSString *imageName = [NSString stringWithFormat:@"image%d.jpg",i + 1];
        imageView0.image = [UIImage imageNamed:imageName];
        [scrollView addSubview:imageView0];
    }
    
    // 3.设置contentSize(如果设置为0表示不支持该方向上的滑动)
    scrollView.contentSize = CGSizeMake(kImageWidth * kImageCount, 0);
    
    
    // 分页指示器(不能加在scrollView上,否则会跟着sv的子视图一起滚动)
    pageControl = [[UIPageControl alloc]init];
    pageControl.center = CGPointMake(scrollView.center.x, scrollView.center.y + 50);
    pageControl.numberOfPages = kImageCount;
    pageControl.enabled = NO;
    pageControl.pageIndicatorTintColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = [UIColor greenColor];
    [self.view addSubview:pageControl];
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView1
{
    NSInteger page = (NSInteger)scrollView.contentOffset.x / kImageWidth;
    pageControl.currentPage = page;
}


@end
