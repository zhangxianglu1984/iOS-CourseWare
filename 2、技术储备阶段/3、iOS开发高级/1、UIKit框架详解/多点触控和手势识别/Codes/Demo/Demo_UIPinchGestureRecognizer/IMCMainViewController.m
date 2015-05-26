//
//  IMCMainViewController.m
//  Demo_UIPinchGestureRecognizer
//
//  Created by zhang xianglu on 15/5/5.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"

@interface IMCMainViewController ()

@property (weak, nonatomic) IBOutlet UIView *pinkView;

@end

@implementation IMCMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.view.userInteractionEnabled = YES;
	self.view.multipleTouchEnabled = YES;
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)viewPinchedAction:(UIPinchGestureRecognizer *)gesture {
	
	_pinkView.transform = CGAffineTransformMakeScale(gesture.scale, gesture.scale);
}



@end
