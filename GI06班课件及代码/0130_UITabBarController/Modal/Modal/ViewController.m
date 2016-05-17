//
//  ViewController.m
//  Modal
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}

- (IBAction)presentModal:(id)sender {
    ModalViewController *modal = [[ModalViewController alloc]init];
    modal.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:modal];
    [self presentViewController:nav animated:YES completion:^{
        NSLog(@"弹出完成");
    }];
}


@end
