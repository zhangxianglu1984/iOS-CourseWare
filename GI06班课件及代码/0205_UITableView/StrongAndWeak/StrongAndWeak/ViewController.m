//
//  ViewController.m
//  StrongAndWeak
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *MyLabel;

@end

@implementation ViewController

/**
 *  weak(相当于以前的assign) 代理(控件可用可不用)
 *  strong(相当于以前的retain) 其它对象
 *  copy 字符串(深拷贝,浅拷贝)
 *  assign 基本数据类型(整型,bool...)
 */
- (void)viewDidLoad {
    [super viewDidLoad];

}


@end
