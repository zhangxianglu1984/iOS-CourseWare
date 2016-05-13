//
//  YourViewController.m
//  UINavigationController
//
//  Created by jianfeng on 15/1/29.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "YourViewController.h"
#import "UIButton+Util.h"

@interface YourViewController ()

@end

@implementation YourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"2222---self.navigationItem:%p",self.navigationItem);
    NSLog(@"2222---self.navigationController.navigationItem:%p",self.navigationController.navigationItem);
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
    self.navigationItem.title = @"第二个控制器";
    
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(100, 200, 200, 50) target:self andAction:@selector(clickButton)];
    [button setTitle:@"返回上一个视图" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

- (void)clickButton
{
    NSLog(@"222---%p",self.navigationController);
    [self.navigationController popViewControllerAnimated:YES];
    
    // 返回到一个特定的控制器
    // 数组 self.navigationController.viewControllers
//    UIViewController *some = self.navigationController.viewControllers[2];
//    [self.navigationController popToViewController:some animated:YES];
    
    // 直接返回到根控制器
//    [self.navigationController popToRootViewControllerAnimated:YES];
}



@end
