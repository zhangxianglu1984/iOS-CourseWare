//
//  ViewController.m
//  Demo_视图动画(基本动画)
//
//  Created by zhang xianglu on 15/6/28.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;

@property (weak, nonatomic) IBOutlet UIView *pinkView;

@property (weak, nonatomic) IBOutlet UIView *greenView;

@end

@implementation ViewController


- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UIView *yellowView = [UIView new];
    yellowView.frame = CGRectMake(100, 100, 100, 100);
    yellowView.backgroundColor = [UIColor yellowColor];
    //[self.view addSubview:yellowView];
	
    //这里会自动把toView加入视图树,自动把fromView移除
	[UIView transitionFromView:_pinkView toView:yellowView duration:1.0f options:UIViewAnimationOptionTransitionFlipFromBottom|UIViewAnimationOptionAllowAnimatedContent completion:^(BOOL finished) {
		//NSLog(@"sadfasdfa");
        
        NSLog(@"_pinkView: %@",_pinkView);
	}];
    
//    [UIView animateWithDuration:1.0f animations:^{
//        CGPoint greenViewCenter = _greenView.center;
//        greenViewCenter.x += 200.0;
//        _greenView.center = greenViewCenter;
//    }];
    
    
	
//    [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionCurveEaseIn animations:^{
//			
//        CGPoint blueViewCenter = _blueView.center;
//        blueViewCenter.y += 300;
//        _blueView.center = blueViewCenter;
//			
//			[UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionCurveEaseOut|UIViewAnimationOptionOverrideInheritedCurve animations:^{
//				_pinkView.transform = CGAffineTransformMakeTranslation(200, 0);
//			} completion:^(BOOL finished){}];
//        
////        CGPoint greenViewCenter = _greenView.center;
////        greenViewCenter.x += 250.0;
////        _greenView.center = greenViewCenter;
//	
//	
//		} completion:^(BOOL finished) {
//		
//			
//		}];


	
	/**
	 *  子视图动画,父视图有个过渡效果
	 */
//	[UIView transitionWithView:_blueView duration:1.0 options:0
//	 animations:^{
//		CGPoint greenViewCenter = _greenView.center;
//		greenViewCenter.x += 200;
//		_greenView.center = greenViewCenter;
//	} completion:^(BOOL finished) {}];

//	[UIView animateWithDuration:2.0f delay:0.0f options:0 animations:^{
//		
////		CGPoint greenViewCenter = _greenView.center;
////		greenViewCenter.x += 200;
////		_greenView.center = greenViewCenter;
//		
////		CGPoint blueViewCenter = _blueView.center;
////		blueViewCenter.y += 300;
////		_blueView.center = blueViewCenter;
//		
////		[UIView animateWithDuration:1.0f delay:1.0f options:0 animations:^{
////			_pinkView.transform = CGAffineTransformMakeTranslation(200, 0);
////		} completion:^(BOOL finished){}];
//
//
//	} completion:^(BOOL finished) {
//	
//		
//	}];
	
	
	
	
}












@end
