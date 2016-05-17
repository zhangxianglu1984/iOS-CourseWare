//
//  ViewController.m
//  Block2
//
//  Created by jianfeng on 15/3/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

typedef void(^AnimationBlock)();

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewA;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)move:(id)sender {
    
    [self useBlock:^{
        self.view.transform = CGAffineTransformTranslate(self.view.transform, 50, 50);
    }];
}
- (IBAction)rotate:(id)sender {
    
    [self useBlock:^{
        self.view.transform = CGAffineTransformRotate(self.view.transform, M_PI_2);
    }];
}

- (void)useBlock:(AnimationBlock) block
{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    
    block();
    
    [UIView commitAnimations];
}

@end
