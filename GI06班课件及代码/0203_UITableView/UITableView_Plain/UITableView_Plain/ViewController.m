//
//  ViewController.m
//  UITableView_Plain
//
//  Created by jianfeng on 15/2/3.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Application.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    NSArray *dataList;
}

@property (nonatomic, strong)NSArray *dataList2;

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
    tableView.rowHeight = 60;
    [self.view addSubview:tableView];
}

- (void)initData
{
    Application *qj = [Application applicationWithImageName:@"001" appName:@"齐家网" andDesc:@"ha0"];
    Application *zxhb = [Application applicationWithImageName:@"002" appName:@"装修伙伴" andDesc:@"ha1"];
    Application *tk = [Application applicationWithImageName:@"003" appName:@"齐家图库" andDesc:@"ha2"];
    dataList = @[qj, zxhb, tk];
}


#pragma mark - UITableViewDelegate & UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.imageView.image = [UIImage imageNamed:[dataList[indexPath.row] imageName]];
    cell.textLabel.text = [dataList[indexPath.row] appName];
    cell.detailTextLabel.text = [dataList[indexPath.row] desc];
    cell.detailTextLabel.textColor = [UIColor lightGrayColor];
    return cell;
}


@end
