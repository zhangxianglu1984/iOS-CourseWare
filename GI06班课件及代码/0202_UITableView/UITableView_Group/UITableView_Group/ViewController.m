//
//  ViewController.m
//  UITableView_Group
//
//  Created by jianfeng on 15/2/2.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#define kProvinceName @"provinceName"
#define kCities @"cities"
#define kProvinceDesc @"provinceDesc"

@interface ViewController ()<UITableViewDataSource>
{
    NSArray *cityDicArray;
}

@end

@implementation ViewController

/**
 *  厦门
 *  泉州
 *  漳州
 *  福州
 *  
 *  广州
 *  深圳
 *  潮州
 */



- (void)viewDidLoad {
    [super viewDidLoad];

    UITableView *tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
//    fjNamesArray = @[@"厦门",@"泉州",@"漳州",@"福州",@"南平",@"宁德"];
//    gdNamesArray = @[@"广州",@"深圳",@"汕头"];
//    cityNamesArray = @[fjNamesArray,gdNamesArray];
    
    NSDictionary *fjDic = @{kProvinceName:@"福建",
                            kCities:@[@"厦门",@"泉州",@"漳州",@"福州",@"南平",@"宁德"],
                            kProvinceDesc:@"福建desc"};
    
    NSDictionary *gdDic = @{kProvinceName:@"广东",
                            kCities: @[@"广州",@"深圳",@"汕头"],
                            kProvinceDesc:@"广东desc"};
    
    NSDictionary *zjDic = @{kProvinceName:@"浙江",
                            kCities: @[@"杭州",@"温州"],
                            kProvinceDesc:@"浙江desc"};
    
    cityDicArray = @[fjDic,gdDic,zjDic];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return cityDicArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [cityDicArray[section][kCities] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return cityDicArray[section][kProvinceName];
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return cityDicArray[section][kProvinceDesc];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    NSString *cityName = nil;
    
    NSDictionary *dic = cityDicArray[indexPath.section];
    NSArray *cityArray = dic[kCities];
    cityName = cityArray[indexPath.row];
    
    cell.textLabel.text = cityName;
    return cell;
}

@end
