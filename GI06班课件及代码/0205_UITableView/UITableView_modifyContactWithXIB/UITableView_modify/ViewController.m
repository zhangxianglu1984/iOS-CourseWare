//
//  ViewController.m
//  UITableView_modify
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "AddContactViewController.h"
#import "ModifyContactViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AddContactViewControllerDelegate,ModifyContactViewControllerDelegate>
{
    UITableView *tableView;
    NSMutableArray *dataList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];
    
    [self initTableView];
    [self initData];
}

- (void)initTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (void)initData
{
    Contact *person0 = [[Contact alloc]init];
    person0.name = @"小明";
    person0.phone = @"123";
    
    Contact *person1 = [[Contact alloc]init];
    person1.name = @"李雷";
    person1.phone = @"123";
    
    dataList = [NSMutableArray arrayWithArray:@[person0, person1]];
    
    NSString *str = [NSString stringWithFormat:@"abc"];
    NSString *str1 = [[NSString alloc]initWithFormat:@"abc"];
//    NSString *str2 = [[NSString alloc]initWithString:@"abc"];
    
    NSLog(@"str:%p",str);
    NSLog(@"str1:%p",str1);
    
    
//    dataList = [NSMutableArray array];
//    [dataList addObject:person0];
//    [dataList addObject:person1];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    Contact *contact = dataList[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
//    ModifyContactViewController *modifyVC = [[ModifyContactViewController alloc]initWithNibName:@"ModifyContactViewController" bundle:nil];
    
    ModifyContactViewController *modifyVC = [[ModifyContactViewController alloc]init];
    // 先去寻找ModifyContactView为名字的xib文件
    // 如果没找到,就找ModifyContactViewController为名字的xib文件
    // 还没找到的话就加载一个空白的view
    modifyVC.delegate = self;
    Contact *modifyContact = dataList[indexPath.row];
    modifyVC.contactMod = modifyContact;
    
    [self.navigationController pushViewController:modifyVC animated:YES];
}


#pragma mark - AddContactViewControllerDelegate

- (void)dealWithWith:(Contact *)contact
{
    // 1.修改数据源
    [dataList addObject:contact];
    // 2.刷新数据
    [tableView reloadData];
    
    NSLog(@"%@",contact);
}

#pragma mark - click method

- (void)addContact
{
    AddContactViewController *addContact = [[AddContactViewController alloc]init];
    addContact.delegate = self;
    [self.navigationController pushViewController:addContact animated:YES];
}

#pragma mark - ModifyContactViewControllerDelegate

- (void)didMoifyContact
{
    [tableView reloadData];
}

@end
