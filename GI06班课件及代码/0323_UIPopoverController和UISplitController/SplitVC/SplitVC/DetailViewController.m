//
//  DetailViewController.m
//  SplitVC
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "DetailViewController.h"
#import "SubDetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"城市";
}

- (void)setCities:(NSArray *)cities
{
    _cities = cities;
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.cities.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    cell.textLabel.text = self.cities[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SubDetailViewController *subDetail = [[SubDetailViewController alloc]init];
    subDetail.cityName = self.cities[indexPath.row];
    // 页面是怎么样展示出来的
//    subDetail.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
//    // 页面最终会展示成什么样
//    subDetail.modalPresentationStyle = UIModalPresentationFormSheet;
//    [self presentViewController:subDetail animated:YES completion:nil];
}
@end

















