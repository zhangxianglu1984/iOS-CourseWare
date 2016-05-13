//
//  ModifyContactViewController.m
//  UITableView_modify
//
//  Created by jianfeng on 15/2/4.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ModifyContactViewController.h"

@interface ModifyContactViewController ()
{
    UITextField *tf0;
    UITextField *tf1;
}

@end

@implementation ModifyContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveContact)];

    tf0 = [[UITextField alloc]initWithFrame:CGRectMake(50, 100, 100, 40)];
    tf0.placeholder = @"姓名";
    tf0.text = self.contactMod.name;
    [self.view addSubview:tf0];
    
    tf1 = [[UITextField alloc]initWithFrame:CGRectMake(50, 150, 100, 40)];
    tf1.placeholder = @"电话";
    tf1.text = self.contactMod.phone;
    [self.view addSubview:tf1];
}

- (void)saveContact
{
    self.contactMod.name = tf0.text;
    self.contactMod.phone = tf1.text;
    [self.delegate didMoifyContact];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
