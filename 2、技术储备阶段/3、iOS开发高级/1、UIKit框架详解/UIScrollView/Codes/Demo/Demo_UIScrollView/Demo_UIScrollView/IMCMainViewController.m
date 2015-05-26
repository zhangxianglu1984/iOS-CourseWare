//
//  IMCMainViewController.m
//  Demo_UIScrollView
//
//  Created by zhang xianglu on 15/5/12.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController () <UIScrollViewDelegate>

@end

@implementation IMCMainViewController

#pragma mark - UIScrollView Delegate Methods
/** 当内容区滚动时调用 **/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidScroll..");
}

/** 当用户滑动开始的时候 **/
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
	NSLog(@"scrollViewWillBeginDragging..");
}

/** 当用户手指滑动结束，并且离开屏幕的时候 **/
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset {
	NSLog(@"scrollViewWillEndDragging...");
}

/** 当用户手指滑动结束，并且离开屏幕,可以判断用户使用拖动还是滑动 **/
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
	NSLog(@"scrollViewDidEndDragging...%d",decelerate);
}

/** 当用户是滑动的方式，手指离开的时候 **/
- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
	NSLog(@"scrollViewWillBeginDecelerating..");
}

/** 当用户滑动的方式，手指离开以后，减速结束时 **/
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidEndDecelerating..");
}

/** 选择要缩放的视图 **/
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView {
	UIImageView *imageView = (UIImageView *)[self.view viewWithTag:110];
	
	return imageView;
}

/** 内容区开始缩放 **/
- (void)scrollViewDidZoom:(UIScrollView *)scrollView {
	//NSLog(@"scrollViewDidZoom..");
}

- (void)scrollViewWillBeginZooming:(UIScrollView *)scrollView withView:(UIView *)view{
	NSLog(@"scrollViewWillBeginZooming..%lu",view.tag);
}

- (void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale {
	NSLog(@"scrollViewDidEndZooming..%lu.scale = %g",view.tag,scale);
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView {
	NSLog(@"scrollViewShouldScrollToTop..");
	return YES;
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView {
	NSLog(@"scrollViewDidScrollToTop..");
}



- (void)viewDidLoad {
    [super viewDidLoad];
	
	/** UIScrollView的使用 **/
	UIScrollView *scrollView = [[UIScrollView alloc] init];
	scrollView.backgroundColor = [UIColor whiteColor];
	
	/** 设置是否弹回 **/
	scrollView.bounces = YES;
	
	scrollView.delegate = self;
	
	CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
	CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
	
	/** 设置可视区域 **/
	scrollView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
	
	/** 设置内容区域 **/
	scrollView.contentSize = CGSizeMake(screenWidth, screenHeight);
	
	//scrollView.scrollsToTop = YES;
	
	UIImageView *imageView = [[UIImageView alloc] init];
	imageView.tag = 110;
	
	imageView.frame = CGRectMake(0, 0, screenWidth, screenHeight);
	imageView.image = [UIImage imageNamed:@"image0.jpg"];
	
	[scrollView addSubview:imageView];
	
	/** 设置缩放的最大比例 **/
	scrollView.maximumZoomScale = 10.0;
	
	/** 设置缩放的最小比例 **/
	scrollView.minimumZoomScale = 0.5;
	
	scrollView.bouncesZoom = YES;
	
	/** 设置分页属性 **/
	//scrollView.pagingEnabled = YES;
	
	//scrollView.decelerationRate = 10;
	
	//[scrollView flashScrollIndicators];
	
	/** 设置滚动条的边距 **/
//	/scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(100, 100, 0, 100);
			
	//scrollView.scrollIndicatorInsets = UIEdgeInsetsMake(0, 10, 0, 0);
	
	
	/** 设置内容区域的外边距 **/
	//scrollView.contentInset = UIEdgeInsetsMake(0, screenWidth, 0, 0);
	
	/** 设置内容的偏移量 **/
	//scrollView.contentOffset = CGPointMake(100, 150);
	
	/** 移至某一块区域 **/
	//[scrollView scrollRectToVisible:CGRectMake(110, 110, 150, 150) animated:NO];
	/*
	for (NSUInteger i = 0; i < 3; i ++) {
		UIView *view = [[UIView alloc] init];
		view.frame = CGRectMake(i*screenWidth,0 , screenWidth, screenHeight);
		switch (i) {
			case 0:
				view.backgroundColor = [UIColor redColor];
    			break;
			case 1:
				view.backgroundColor = [UIColor greenColor];
				break;
			case 2:
				view.backgroundColor = [UIColor grayColor];
				break;
			default:
				break;
		}
		
		[scrollView addSubview:view];
	}
	*/
	
	[self.view addSubview:scrollView];
}


@end
