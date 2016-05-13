//
//  ViewControllerA.m
//  Block3
//
//  Created by jianfeng on 15/3/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewControllerA.h"
#import "ViewControllerB.h"

@interface ViewControllerA()
{
    UILabel *label;
}

@end

@implementation ViewControllerA

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"控制器A";
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"push" style:UIBarButtonItemStylePlain target:self action:@selector(push)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, 200, 40)];
    label.center = CGPointMake(self.view.bounds.size.width/2, 200);
    label.text = @"待传值";
    [self.view addSubview:label];

}

- (void)push
{
    ViewControllerB *vcb = [ViewControllerB viewControllerBWithBlock:^(NSString *str) {
        label.text = str;
    }];
    [self.navigationController pushViewController:vcb animated:YES];
}








@end
