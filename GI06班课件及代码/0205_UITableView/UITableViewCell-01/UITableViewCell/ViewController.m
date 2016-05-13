//
//  ViewController.m
//  UITableViewCell
//
//  Created by jianfeng on 15/2/5.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "PersonCell.h"
#import "Person.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    NSMutableArray *dataList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initTableView];
    
    [self initData];
}

- (void)initTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.separatorColor = [UIColor blackColor];
    [self.view addSubview:tableView];
}

// 从plist文件里面取出需要的数据
- (void)initData
{
    dataList = [NSMutableArray array];
    
    // 1.获取文件路径
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"Persons.plist" ofType:nil];
    // 2.把文件内容转成数组;
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    // 3.把数组里面的字典转化成模型数据
    for (NSDictionary *dic in array) {
        Person *person = [Person personWithDic:dic];
        [dataList addObject:person];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    PersonCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[PersonCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    Person *cellPerson = dataList[indexPath.row];
    cell.person = cellPerson;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0f;
}


@end
