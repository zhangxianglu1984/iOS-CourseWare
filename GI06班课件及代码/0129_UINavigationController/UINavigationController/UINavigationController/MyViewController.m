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

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor orangeColor];
    NSLog(@"111--self.navigationItem%p",self.navigationItem);
    NSLog(@"1111--self.navigationController.navigationItem%p",self.navigationController.navigationItem);
    
    
    self.navigationController.toolbarHidden = NO;
    UIBarButtonItem *item0 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:nil action:nil];
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:nil action:nil];
    UIBarButtonItem *itemFlex = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    [self setToolbarItems: @[item0,itemFlex,item1]];
    
    
    
//    self.title = @"aaa";
    // 导航栏标题
    self.navigationItem.title = @"第一个控制器";
    
    // 设置NavigationController右边的视图
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(clickBookMark:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // 左边和右边的视图都可以返回多个
//    self.navigationItem.rightBarButtonItems
//    self.navigationItem.leftBarButtonItems
    
    // 设置返回按钮的文字(返回按钮默认就可以返回上一级视图,所以这边action可以不实现,只是修改返回按钮的文字)
    // 返回按钮是指返回到本页的按钮,所以要在下个页面的左上角才能看到
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:@"hello" style:UIBarButtonItemStylePlain target:nil action:nil];
    self.navigationItem.backBarButtonItem = backItem;
    
    // 自定义titleView
    UISegmentedControl *seg = [[UISegmentedControl alloc]initWithItems:@[@"abc",@"def"]];
    seg.frame = CGRectMake(0, 0, 100, 30);
    self.navigationItem.titleView = seg;
    
    // 导航栏背景颜色
    self.navigationController.navigationBar.barTintColor = [UIColor yellowColor];
    
    // 初始化一个按钮
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(50, 100, 200, 50) target:self andAction:@selector(clickButton:)];
    [button setTitle:@"进入下一个视图" forState:UIControlStateNormal];
    [self.view addSubview:button];
}

#pragma mark - click method

- (void)clickButton:(UIButton *)button {
    
    YourViewController *vc = [[YourViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)clickBookMark:(UIButton *)button
{
    NSLog(@"bookMark");
}




@end
