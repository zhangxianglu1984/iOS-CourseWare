//
//  ViewController.m
//  NSUserDefault
//
//  Created by jianfeng on 15/3/16.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "SecViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
//    NSLog(@"%@",NSHomeDirectory());
}
- (IBAction)saveData:(id)sender {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:@"abcdefg" forKey:@"word"];
    [userDefaults setFloat:1.234 forKey:@"float"];
    // 把内存里面的数据马上同步到本地
    [userDefaults synchronize];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    SecViewController *vc = [[SecViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

@end
