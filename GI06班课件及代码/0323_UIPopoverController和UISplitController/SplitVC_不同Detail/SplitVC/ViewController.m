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
#import "DetailImageViewController.h"

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
    // 对于detail侧展示的内容形式不同的时候,需要手动替换splitViewController里面的控制器
    if (indexPath.row == 0) {
        DetailViewController *detail = [[DetailViewController alloc]init];
        detail.cities = [self.dataList[indexPath.row] cities];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detail];
        // 对splitController.viewControllers属性一赋值,显示就会变化
//        self.splitViewController.viewControllers = @[[self.splitViewController.viewControllers firstObject],nav];
       
        // 在iOS8之前,我们通过手动修改split的Viewcontrollers属性的方法来修改detail的显示
        // 在iOS8以后,使用下面的方法来替换之前的方法
        [self.splitViewController showDetailViewController:nav sender:nil];
         NSLog(@"%@",self.splitViewController.viewControllers);
    }
    else if (indexPath.row == 1){
        DetailImageViewController *detailImage = [[DetailImageViewController alloc]init];
        UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:detailImage];
        // 对splitController.viewControllers属性一赋值,显示就会变化
//        self.splitViewController.viewControllers = @[[self.splitViewController.viewControllers firstObject],nav];
        
        [self.splitViewController showDetailViewController:nav sender:nil];
        NSLog(@"%@",self.splitViewController.viewControllers);
    }
    else{
        // 点击第三行
        // 演示showViewController的方法
        // showViewController:sender:既适用于UISplitViewController也适用于UINavigationController
        
        SubDetailViewController *sub = [[SubDetailViewController alloc]init];
        
        // 在UINavigationController里面,使用这个方法相当于push
        [self.navigationController showViewController:sub sender:nil];
        
    }
}
@end








