//
//  ViewController.m
//  UITableView_EditMode
//
//  Created by jianfeng on 15/2/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "AddContactViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,AddContactViewControllerDelegate>
{
    UITableView *tableView;
    NSMutableArray *dataList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    self.navigationItem.leftBarButtonItem  =[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(enterEditMode)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addContact)];
    
    [self initTableView];
    [self initData];
}

- (void)initTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorInset = UIEdgeInsetsZero;
    tableView.layoutMargins = UIEdgeInsetsZero;
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
    person2.name = @"Lucy";
    person2.phone = @"10000";
    
    Contact *person3 = [[Contact alloc]init];
    person3.name = @"吉姆";
    person3.phone = @"99999";
    
    Contact *person4 = [[Contact alloc]init];
    person4.name = @"大卫";
    person4.phone = @"67890";
    
    dataList = [NSMutableArray arrayWithArray:@[person0, person1, person2, person3, person4]];
}

#pragma mark - UITableViewDataSource & delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
    }
    Contact *contact = dataList[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

// 设置哪些行可以被编辑
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 2) {
        return YES;
    }
    return NO;
}


// 只要一出现这个方法,在tableView上就会产生滑动出现删除按钮的效果
- (void)tableView:(UITableView *)tableView1 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除功能
        // 1.删除数据
        Contact *contact = dataList[indexPath.row];
        [dataList removeObject:contact];
        //    [dataList removeObjectAtIndex:indexPath.row];
        // 2.刷新界面
        //    [tableView reloadData];
        // 删除确定行数的方法(只负责刷新界面,不负责修改数据)
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    }
    else{
        // 插入操作
        Contact *contactToInsert = [[Contact alloc]init];
        contactToInsert.name = @"xiaohong";
        contactToInsert.phone = @"90909";
        
        // 1.改变数据
        [dataList insertObject:contactToInsert atIndex:indexPath.row + 1];
        
        // 2. 刷新界面
//        [tableView reloadData];
        NSIndexPath *indexPathToInsert = [NSIndexPath indexPathForRow:indexPath.row + 1 inSection:0];
        [tableView insertRowsAtIndexPaths:@[indexPathToInsert] withRowAnimation:UITableViewRowAnimationFade];
    }
}

// 设置tableView编辑模式的类型
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
}

// 表示支持某些行可以移动
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row < 3) {
        return YES;
    }
    return NO;
}

// 只要出现这个方法,就可以在tableView进入编辑模式的时候在cell的右侧出现可移动的图标
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
//    [dataList exchangeObjectAtIndex:sourceIndexPath.row withObjectAtIndex:destinationIndexPath.row];
    Contact *contactSource = dataList[sourceIndexPath.row];
    
    // 先从数据源里面删除
    [dataList removeObject:contactSource];
    
    // 再插入到要移动的地方
    [dataList insertObject:contactSource  atIndex:destinationIndexPath.row];
}

#pragma mark - AddContactViewControllerDelegate

- (void)dealWithWith:(Contact *)contact
{
    [dataList addObject:contact];
    [tableView reloadData];
}

#pragma mark - click

- (void)enterEditMode
{
    // 让tableView进入或者是取消编辑状态
    [tableView setEditing:!tableView.editing animated:YES];
}

- (void)addContact
{
    AddContactViewController *addContact = [[AddContactViewController alloc]init];
    addContact.delegate = self;
    [self.navigationController pushViewController:addContact animated:YES];
}

@end
