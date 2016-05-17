//
//  ViewController.m
//  SplitVC
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"
#import "DetailViewController.h"
#import "SubDetailViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *tableView;
    
}

@property (nonatomic, strong)NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"省份";
    
    [self createTableView];
}

- (void)createTableView
{
    tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

- (NSArray *)dataList
{
    if (!_dataList) {
        Province *fj = [Province provinceWithDic:@{@"name":@"福建",
                                                   @"cities":@[@"厦门",@"福州"]}];
        Province *gd = [Province provinceWithDic:@{@"name":@"广东",
                                                   @"cities":@[@"深圳",@"汕头",@"广州"]}];
        Province *zj = [Province provinceWithDic:@{@"name":@"浙江",
                                                   @"cities":@[@"杭州",@"温州"]}];
        _dataList = @[fj, gd, zj];
        
    }
    return _dataList;
}

#pragma mark - UITableViewDelegate

- (NSInteger)tableView:(UITableView *)tableView1 numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView1 cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView1 dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    Province *prov = self.dataList[indexPath.row];
    cell.textLabel.text = prov.name;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//     这样该变detail侧数据的方法只适应于一种情况,就是所有detail侧要显示的结构都一样
    
    Province *prov = self.dataList[indexPath.row];
    // 取出datailNavigationController
    UINavigationController *detailNav = [self.splitViewController.viewControllers lastObject];
    // 取出detailViewController
    DetailViewController *detailVC = [detailNav.viewControllers firstObject];
    // 赋值
    detailVC.cities = prov.cities;
}
@end








