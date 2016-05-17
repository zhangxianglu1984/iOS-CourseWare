//
//  ViewController.m
//  UITableView_modify
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "ModifyContactViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,ModifyContactViewControllerDelegate>
{
    UITableView *tableView;
    NSMutableArray *dataList;
    
    NSMutableArray *deleteArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通讯录";
    self.navigationItem.leftBarButtonItem  =[[UIBarButtonItem alloc]initWithTitle:@"编辑" style:UIBarButtonItemStylePlain target:self action:@selector(enterEditMode)];

    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemTrash target:self action:@selector(deleteContact)];
    
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
    deleteArray = [NSMutableArray array];
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    Contact *contact = dataList[indexPath.row];
    cell.textLabel.text = contact.name;
    cell.detailTextLabel.text = contact.phone;
    return cell;
}

/**
 *  以下两个方法需要注意在编辑模式下和非编辑模式下的区别!!!!
 */

- (void)tableView:(UITableView *)tableView1 didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.navigationItem.leftBarButtonItem.enabled = YES;
    
    if (tableView.isEditing) {
        [deleteArray addObject:dataList[indexPath.row]];
    }
    else{
        ModifyContactViewController *modify  = [[ModifyContactViewController alloc]init];
        modify.delegate = self;
        modify.contactMod = dataList[indexPath.row];
        [self.navigationController pushViewController:modify animated:YES];
    }
}

// 非编辑模式(正常状态)下,点击第m行,再点击第n行,会先调用第n行的didDeselect方法,然后调用第m行的didSelect方法.
// (如果始终点击同一个cell,那么始终调用的都是这个cell的didSelect方法)
- (void)tableView:(UITableView *)tableView1 didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView.isEditing) {
        [deleteArray removeObject:dataList[indexPath.row]];
    }
}

// 如果返回UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete,在进入编辑模式时就会呈现多选的状态
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewCellEditingStyleInsert | UITableViewCellEditingStyleDelete;
}

#pragma mark - click method

- (void)deleteContact
{
    [dataList removeObjectsInArray:deleteArray];
    [deleteArray removeAllObjects];
    [tableView reloadData];
}

#pragma mark - ModifyContactViewControllerDelegate

// 这边协议方法传回了一个参数con,是第二个页面修改过的模型,其实是不太好的写法
// 这里这样写单纯是为了展示reloadRows方法的使用
// 这里其实不传模型回来会更简单
// 以后reloadRows方法可以在自己需要的时候调用
- (void)didMoifyContact:(Contact *)con
{
    NSInteger index = [dataList indexOfObject:con];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
    // 刷新特定行数的数据
    // reloadRows方法的使用需要注意: 刷新前和刷新后cell的个数必须相等
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
}

- (void)enterEditMode
{
    [tableView setEditing:!tableView.editing animated:YES];
}





@end
