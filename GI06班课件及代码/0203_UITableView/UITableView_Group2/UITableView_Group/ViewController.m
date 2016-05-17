//
//  ViewController.m
//  UITableView_Group
//
//  Created by jianfeng on 15/2/2.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

#define kProvinceName @"provinceName"
#define kCities @"cities"
#define kProvinceDesc @"provinceDesc"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *cityDicArray;
}

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.rowHeight = 100;
    
    // 调整分割线的偏移
    tableView.separatorInset = UIEdgeInsetsMake(0, -100, 0, 0);
    // 调整分割线的颜色
    tableView.separatorColor = [UIColor redColor];
    // 调整分割线的样式
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.view addSubview:tableView];
    
    
    Province *fj = [[Province alloc]initWithName:@"福建"
                                            desc:@"福建desc"
                                       andCities:@[@"厦门",@"泉州",@"漳州",@"福州",@"南平",@"宁德"]];
    
    Province *gd = [[Province alloc]initWithName:@"广东"
                                            desc:@"广东desc"
                                       andCities:@[@"广州",@"深圳",@"汕头"]];
    
    
    cityDicArray = @[fj,gd];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return cityDicArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    Province *province = cityDicArray[section];
    return province.cityArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    Province *province = cityDicArray[section];
    return province.name;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerView = [[UIView alloc]init];
    return headerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    Province *province = cityDicArray[section];
    return province.desc;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];    
    Province *province = cityDicArray[indexPath.section];
    cell.textLabel.text = province.cityArray[indexPath.row];
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    cell.accessoryView = [[UISwitch alloc]init];
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"点击了第%d组,%d行",indexPath.section,indexPath.row);
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 100;
    }
    return 44;
}

@end
