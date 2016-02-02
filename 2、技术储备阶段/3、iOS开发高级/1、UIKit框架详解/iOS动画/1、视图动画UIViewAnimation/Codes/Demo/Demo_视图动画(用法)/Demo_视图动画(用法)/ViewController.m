//
//  ViewController.m
//  Demo_视图动画(用法)
//
//  Created by zhang xianglu on 15/6/25.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *greenView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *horizontalConstraint;
@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    NSLog(@"blueViewFrame before: %@",NSStringFromCGRect(_blueView.frame));
    
    [UIView animateWithDuration:1.0 delay:0.0 options:UIViewAnimationOptionCurveLinear|UIViewAnimationOptionAutoreverse animations:^{
        
        NSLog(@"%@",[NSThread currentThread]);
        
        //要做的动画(在该块中修改相关视图的动画属性)
        //1、frame 动画属性
        CGRect blueViewFrame = _blueView.frame;
        
        //_blueView.transform = CGAffineTransformMakeTranslation(200.0, 200.0);
        
        //视图动画，会改变视图的相关属性
        //改变完后，不会复原
        //_blueView.transform = CGAffineTransformMakeScale(0.5, 0.5);
        
        //_blueView.transform = CGAffineTransformMakeRotation(M_PI);
        //修改动画属性
        blueViewFrame.origin.x += 200.0;
        blueViewFrame.origin.y += 200.0;
        
        blueViewFrame.size.width += 100.0;
        blueViewFrame.size.height += 100.0;
        
        _blueView.backgroundColor = [UIColor redColor];
        
        _blueView.alpha = 0.2;
        
        _blueView.frame = blueViewFrame;
        
        
        
//        CGRect greenViewFrame = _greenView.frame;
//        greenViewFrame.origin.x -= 200.0;
//        greenViewFrame.origin.y += 200.0;
//        
//        greenViewFrame.size.width -= 100.0;
//        greenViewFrame.size.height -= 100.0;
//        
//        _greenView.backgroundColor = [UIColor yellowColor];
//        
//        _greenView.frame = greenViewFrame;
    } completion:^(BOOL finished) {
        //动画块执行完毕后，调用
        NSLog(@"blueViewFrame: after %@",NSStringFromCGRect(_blueView.frame));
    }];
    
    
    
    
	//视图动画的用法(支持Autolayout)
//	[UIView animateWithDuration:2.0f animations:^{
//		_horizontalConstraint.constant += 200;
//	
//		//更新约束
//		//第一步，告诉系统，需要更具更新的约束，重新布局
//		//修改约束
//		[self.view setNeedsLayout];
//		//强制系统在当前时刻重新布局
//		[self.view layoutIfNeeded];
	
//		//修改视图的属性
//		CGPoint blueViewCenterPoint = _blueView.center;
//		_blueView.center = CGPointMake(blueViewCenterPoint.x + 100, blueViewCenterPoint.y);
//		
//		_blueView.backgroundColor = [UIColor greenColor];
//		
//		_blueView.transform = CGAffineTransformMakeRotation(M_PI);
//	}];
}

@end
