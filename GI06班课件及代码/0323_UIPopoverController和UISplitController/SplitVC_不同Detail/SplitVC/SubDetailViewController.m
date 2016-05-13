//
//  SubDetailViewController.m
//  SplitVC
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "SubDetailViewController.h"

@interface SubDetailViewController ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation SubDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];


}

- (UILabel *)label
{
    if (!_label) {
        _label = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, 100, 30)];
        _label.backgroundColor = [UIColor orangeColor];
        [self.view addSubview:_label];
    }
    return _label;
}

- (void)setCityName:(NSString *)cityName
{
    _cityName = cityName;
    self.label.text = _cityName;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
