//
//  MyViewController.m
//  UINavigationController
//
//  Created by jianfeng on 15/1/29.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "MyViewController.h"
#import "UIButton+Util.h"
#import "YourViewController.h"

@interface MyViewController ()
{
    UILabel *aLabel;
}

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    // 导航栏标题
    self.navigationItem.title = @"第一个控制器";
    
    // 设置NavigationController右边的视图
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(clickBookMark:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    aLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, 200, 50)];
    aLabel.backgroundColor = [UIColor lightGrayColor];
    aLabel.text = @"abc";
    [self.view addSubview:aLabel];
    
    // 初始化一个按钮
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(50, 150, 200, 50) target:self andAction:@selector(clickButton:)];
    [button setTitle:@"进入下一个视图" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

#pragma mark - click method

- (void)clickButton:(UIButton *)button {
    
    YourViewController *vc = [[YourViewController alloc]init];
    vc.stringToShow = aLabel.text;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickBookMark:(UIButton *)button
{
    NSLog(@"bookMark");
}




@end
