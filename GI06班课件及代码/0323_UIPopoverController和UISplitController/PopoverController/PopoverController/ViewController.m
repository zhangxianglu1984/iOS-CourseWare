//
//  ViewController.m
//  PopoverController
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "PopViewController.h"

@interface ViewController ()
{
    UIButton *button;
    UIPopoverController *popover;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initViews];
}

- (void)initViews
{
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"choose" style:UIBarButtonItemStylePlain target:self action:@selector(showPop:)];
    
    self.navigationItem.leftBarButtonItem = barButtonItem;
    
    button = [UIButton buttonWithType: UIButtonTypeCustom];
    button.frame = CGRectMake(300, 100, 100, 100);
    button.backgroundColor = [UIColor greenColor];
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

#pragma mark - click

- (IBAction)clickButton:(UIButton *)btn {

    PopViewController *pop = [[PopViewController alloc]initWithBlock:^(UIColor *color) {
        button.backgroundColor = color;
        [popover dismissPopoverAnimated:NO];
    }];

    popover = [[UIPopoverController alloc]initWithContentViewController:pop];
    // 用来设置pop出来的控件显示有多大
    popover.popoverContentSize = CGSizeMake(200, 200);
    // 从指定的区域弹出
    [popover presentPopoverFromRect:btn.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)showPop:(UIBarButtonItem *)item
{
    // UIPopoverController直接继承自NSObject,所以没有可视化能力,需要用另一个控制器来初始化
    PopViewController *pop = [[PopViewController alloc]init];
    popover = [[UIPopoverController alloc]initWithContentViewController:pop];
    // 设置哪些视图可以穿透点击
    popover.passthroughViews = @[button];
    
    // 让popoer从制定的BarButtonItem弹出
    [popover presentPopoverFromBarButtonItem:item permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
    
    // 临时
    // 手动让popover消失的办法
//    [popover dismissPopoverAnimated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 传统actionSheet显示方法(iPad显示在屏幕中间,而不是像iPhone中从屏幕底部钻出)
//    UIActionSheet *as = [[UIActionSheet alloc]initWithTitle:@"biaoti" delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"111",@"222", nil];
//    [as showInView:self.view];
    
    // 新的显示方法
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"message" message:@"dkdkkd" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *sure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        NSLog(@"sure");
    }];
    UIAlertAction *aa = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        NSLog(@"cancel");
    }];
    [alert addAction:sure];
    [alert addAction:aa];
    NSLog(@"%@-%@",alert.presentationController,alert.popoverPresentationController);
    alert.popoverPresentationController.sourceRect = button.frame;
    alert.popoverPresentationController.sourceView = self.view;
    [self presentViewController:alert animated:YES completion:nil];
}

@end
