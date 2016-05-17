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
    NSInteger removeIndex;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];

    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteContact)];
    
    self.navigationItem.leftBarButtonItem.enabled = NO;
    
    
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
    
    dataList = [NSMutableArray arrayWithArray:@[person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1,person0, person1]];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    
    
    if (indexPath.row == removeIndex) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    Contact *contact = dataList[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.navigationItem.leftBarButtonItem.enabled = YES;
    removeIndex = indexPath.row;
    [tableView reloadData];
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

- (void)deleteContact
{
    // 1.改变数据
    [dataList removeObjectAtIndex:removeIndex];
    
    removeIndex = -1;
    
    // 2.刷新界面
    [tableView reloadData];
    
    if (dataList.count == 0) {
        self.navigationItem.leftBarButtonItem.enabled = NO;
    }
}

@end
