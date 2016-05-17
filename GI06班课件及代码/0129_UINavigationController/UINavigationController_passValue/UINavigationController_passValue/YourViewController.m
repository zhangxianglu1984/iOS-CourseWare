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

@property (nonatomic, strong)UILabel *label;

@end

@implementation YourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"第二个控制器";
    
    UIButton *button = [UIButton buttonWithFrame:CGRectMake(50, 200, 200, 50) target:self andAction:@selector(clickButton)];
    [button setTitle:@"返回上一个视图" forState:UIControlStateNormal];
    [self.view addSubview:button];

}

- (void)clickButton
{
    NSLog(@"222---%p",self.navigationController);
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - setter & getter

// 懒加载(本质上就是手动实现属性的get方法)用到的时候才去创建
- (UILabel *)label
{
    if (!_label) {
        // 创建_label
        _label = [[UILabel alloc]initWithFrame:CGRectMake(50, 80, 200, 50)];
        [self.view addSubview:_label];
    }
    return _label;
}

- (void)setStringToShow:(NSString *)stringToShow
{
    _stringToShow = stringToShow;
    self.label.text = _stringToShow;
}



@end
