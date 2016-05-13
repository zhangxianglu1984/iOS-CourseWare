//
//  ViewController.m
//  ComplexModelTableView
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "ColorGroup.h"
#import "Color.h"
#import "UIColor+Categroy.h"
#import "CustomHeaderView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,CustomHeaderViewDelegate>
{
    UITableView *tableView;
    NSMutableArray *dataList;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    [self initData];
}

// 初始化数据
- (void)initData
{
    // 从文件中初始化数组
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"color.plist" ofType:nil];
    NSArray *array = [NSArray arrayWithContentsOfFile:filePath];
    
    // 把字典转化成模型数据
    dataList = [NSMutableArray array];
    for (NSDictionary *dic in array) {
        ColorGroup *group = [ColorGroup colorGroupWithDic:dic];
        [dataList addObject:group];
    }
}

#pragma mark - UITableViewDelegate & dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    ColorGroup *group = dataList[section];
    if (group.isOpen) {
        return group.colorGroup.count;
    }
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView1 viewForHeaderInSection:(NSInteger)section
{
    CustomHeaderView *header = [CustomHeaderView headerViewWithTableView:tableView1];
    header.delegate = self;
    header.model = dataList[section];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 44;
}

//// 返回一组sectionHeader的标题索引
//- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
//{
//    return [dataList valueForKeyPath:@"groupName"];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    // 每组数据的模型
    ColorGroup *group = dataList[indexPath.section];
    // 每行数据的模型
    Color *color = group.colorGroup[indexPath.row];
    
    cell.textLabel.text = color.colorName;
    cell.textLabel.textColor = [UIColor colorWithHexColor:color.colorValue];
    return cell;
}

#pragma mark - CustomHeaderViewDelegate

- (void)didFinishedClick
{
    [tableView reloadData];
}



@end
