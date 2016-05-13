//
//  AddContactViewController.m
//  UITableView_modify
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "AddContactViewController.h"

@interface AddContactViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end

@implementation AddContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加记录";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveContact)];
}

- (void)saveContact
{
    // 1.传值
    Contact *contact = [[Contact alloc]init];
    contact.name = self.nameField.text;
    contact.phone = self.phoneField.text;
    
    [self.delegate dealWithWith:contact];
    
    // 2.返回前一页面
    [self.navigationController popViewControllerAnimated:YES];
}

@end
