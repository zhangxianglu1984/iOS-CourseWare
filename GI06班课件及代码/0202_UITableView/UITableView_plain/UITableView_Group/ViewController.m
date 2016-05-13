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
    
    [self.view addSubview:tableView];
    
    
    Province *fj = [[Province alloc]initWithName:@"福建"
                                            desc:@"福建desc"
                                       andCities:@[@"厦门",@"泉州",@"漳州",@"福州",@"南平",@"宁德"]];
    
    Province *gd = [[Province alloc]initWithName:@"广东"
                                            desc:@"广东desc"
                                       andCities:@[@"广州",@"深圳",@"汕头",@"广州",@"深圳",@"汕头",@"广州",@"深圳",@"汕头",@"广州",@"深圳",@"汕头"]];
    
    
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
//
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    Province *province = cityDicArray[section];
//    return province.name;
//}

//- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 70;
//}

//- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
//{
//    Province *province = cityDicArray[section];
//    return province.desc;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];    
    Province *province = cityDicArray[indexPath.section];
    cell.textLabel.text = province.cityArray[indexPath.row];
    
    return cell;
}


@end
