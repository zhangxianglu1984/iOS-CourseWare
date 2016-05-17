//
//  ModifyContactViewController.m
//  UITableView_modify
//
//  Created by jianfeng on 15/2/4.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ModifyContactViewController.h"

@interface ModifyContactViewController ()

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;

@end

@implementation ModifyContactViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveContact)];
    
    self.nameField.text = _contactMod.name;
    self.phoneField.text = _contactMod.phone;
}

- (void)saveContact
{
    self.contactMod.name = self.nameField.text;
    self.contactMod.phone = self.phoneField.text;
    [self.delegate didMoifyContact];
    [self.navigationController popViewControllerAnimated:YES];
}



@end
