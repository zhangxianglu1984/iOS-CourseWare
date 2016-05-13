//
//  SecViewController.m
//  NSUserDefault
//
//  Created by jianfeng on 15/3/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "SecViewController.h"

@interface SecViewController ()

@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor orangeColor];
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *str = [userDefaults objectForKey:@"word"];
    [userDefaults floatForKey:@"float"];
    NSLog(@"%@",str);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
