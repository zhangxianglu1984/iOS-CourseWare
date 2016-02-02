//
//  ViewController.m
//  Demo_核心动画(转场动画)
//
//  Created by zhang xianglu on 15/6/24.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
    
 }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    CATransition *transitionAnimation = [CATransition new];
    transitionAnimation.duration = 2.0;
    
    transitionAnimation.type = @"rippleEffect";
    
    //transitionAnimation.subtype = @"fromRight";
    

    //
    //    transitionAnimation
    
    
    [_imageView.layer addAnimation:transitionAnimation forKey:nil];

    
    _imageView.image = [UIImage imageNamed:@"a"];
}
@end
