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
    
    NSMutableArray *deleteArray;// 被选中的cell
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
    tableView.separatorColor = [UIColor blackColor];
    
    // 以下两句是让tableView的分割线从0开始(cell里面也要设置)
    tableView.separatorInset = UIEdgeInsetsZero;
    if ([tableView respondsToSelector:@selector(setLayoutMargins:)]) {
        tableView.layoutMargins = UIEdgeInsetsZero;
    }
    
    
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
    
    Contact *person2 = [[Contact alloc]init];
    person2.name = @"李雷1";
    person2.phone = @"123";
    
    Contact *person3 = [[Contact alloc]init];
    person3.name = @"李雷2";
    person3.phone = @"123";
    
    Contact *person4 = [[Contact alloc]init];
    person4.name = @"李雷3";
    person4.phone = @"123";
    
    dataList = [NSMutableArray arrayWithArray:@[person0, person1,person2,person3,person4]];
    
    deleteArray = [NSMutableArray array];
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
        if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
            cell.layoutMargins = UIEdgeInsetsZero;
        }
    }
    
    Contact *contact = dataList[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    
    // 如果本行要展示的模型在要删除的数组里面,就打钩
    if ([deleteArray containsObject:contact]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
    else{
        // 否则去掉勾(这一句不能省略,否则会出现由于cell重用导致的cell错乱)
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.navigationItem.leftBarButtonItem.enabled = YES;
    
    
    // 取出点击这一行对应的contact模型数据
    Contact *selectedContact = dataList[indexPath.row];
    
    // 如果点击的cell对应的模型数据已经处于deleteArray中,就从数组中移除(表示这行就不删了)
    if ([deleteArray containsObject:selectedContact]){
        [deleteArray removeObject:selectedContact];
    }
    else{
        // 否则,把它放到要删除的数组里面
        [deleteArray addObject:selectedContact];
    }
    
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
    // 从数据源里面删除掉要删除的数组中的所有元素
    [dataList removeObjectsInArray:deleteArray];
    
    // 清空掉要删除的数组
    [deleteArray removeAllObjects];
    
    // 2.刷新界面
    [tableView reloadData];
    
    if (dataList.count == 0) {
        self.navigationItem.leftBarButtonItem.enabled = NO;
    }
}

@end
