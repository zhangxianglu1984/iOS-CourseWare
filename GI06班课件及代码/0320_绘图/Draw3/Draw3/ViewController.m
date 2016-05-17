//
//  ViewController.m
//  Draw3
//
//  Created by jianfeng on 15/3/20.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet MyView *myView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)valueChanged:(UISlider *)sender {
    NSLog(@"%f",sender.value);
    self.myView.radius = sender.value;
}
@end
