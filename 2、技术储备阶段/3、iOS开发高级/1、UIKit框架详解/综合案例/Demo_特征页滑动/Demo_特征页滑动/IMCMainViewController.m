//
//  IMCMainViewController.m
//  Demo_特征页滑动
//
//  Created by xiangluzhang on 15/12/23.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *featureScrollView;

@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //指示当前是第几页(第几个小圆点)
    _pageControl.currentPage = 0;
    
    //选中小圆点的颜色
    //_pageControl.currentPageIndicatorTintColor
    //非选中小圆点的颜色
    //_pageControl.pageIndicatorTintColor
    
    //_featureScrollView.bounces = YES;
    
    UIImageView *featureImageView_0 = [UIImageView new];
    featureImageView_0.image = [UIImage imageNamed:@"app_feature_0"];
    
    [_featureScrollView addSubview:featureImageView_0];
    
    UIImageView *featureImageView_1 = [UIImageView new];
    featureImageView_1.image = [UIImage imageNamed:@"app_feature_1"];
    
    [_featureScrollView addSubview:featureImageView_1];
    
    UIImageView *featureImageView_2 = [UIImageView new];
    featureImageView_2.image = [UIImage imageNamed:@"app_feature_2"];
    
    [_featureScrollView addSubview:featureImageView_2];
    
    UIImageView *featureImageView_3 = [UIImageView new];
    featureImageView_3.image = [UIImage imageNamed:@"app_feature_3"];
    
    [_featureScrollView addSubview:featureImageView_3];
    
    featureImageView_0.translatesAutoresizingMaskIntoConstraints = NO;
    featureImageView_1.translatesAutoresizingMaskIntoConstraints = NO;
    featureImageView_2.translatesAutoresizingMaskIntoConstraints = NO;
    featureImageView_3.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat featureScrollViewWidth = _featureScrollView.bounds.size.width;
    CGFloat featureScrollViewHeight = _featureScrollView.bounds.size.height;
    
    NSString *visualFormat = @"H:|[featureImageView_0(featureScrollViewWidth)][featureImageView_1(featureScrollViewWidth)][featureImageView_2(featureScrollViewWidth)][featureImageView_3(featureScrollViewWidth)]|";
    
    NSDictionary *views = NSDictionaryOfVariableBindings(featureImageView_0,featureImageView_1,featureImageView_2,featureImageView_3);
    
    NSArray *constraints_h = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:NSLayoutFormatAlignAllTop|NSLayoutFormatAlignAllBottom metrics:@{@"featureScrollViewWidth":@(featureScrollViewWidth)} views:views];
    [_featureScrollView addConstraints:constraints_h];
    
    visualFormat = @"V:|[featureImageView_0(featureScrollViewHeight)]|";
    NSArray *constraints_v = [NSLayoutConstraint constraintsWithVisualFormat:visualFormat options:0 metrics:@{@"featureScrollViewHeight":@(featureScrollViewHeight)} views:@{@"featureImageView_0":featureImageView_0}];
    [_featureScrollView addConstraints:constraints_v];
}

#pragma mark UIScrollView Delegate Methods
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat contentOffsetX = scrollView.contentOffset.x;
    CGFloat scrollViewWidth = scrollView.bounds.size.width;
    
    NSInteger currentPage = round(contentOffsetX / scrollViewWidth);
    
    _pageControl.currentPage = currentPage;
    
    _pageControl.hidden = (currentPage == 3)? YES : NO;
    
}


@end
