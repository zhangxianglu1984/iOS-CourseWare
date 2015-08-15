//
//  IMCMainViewController.m
//  Demo_视图动画(UIViewAnimation)
//
//  Created by zhang xianglu on 15/6/21.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

@property (weak, nonatomic) IBOutlet UIView *blueView;
@property (weak, nonatomic) IBOutlet UIView *pinkView;

@property(nonatomic,assign) CGRect blueViewOriginFrame;

@end

@implementation IMCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.blueViewOriginFrame = self.blueView.frame;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[UIView transitionWithView:_blueView duration:3.0f options:UIViewAnimationOptionTransitionFlipFromLeft|UIViewAnimationOptionAllowAnimatedContent animations:^{
	
	} completion:^(BOOL finished) {
		NSLog(@"动画播放完了。。");
	}];
}




@end
