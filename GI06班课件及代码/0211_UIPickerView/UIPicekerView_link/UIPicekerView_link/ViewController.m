//
//  ViewController.m
//  UIPicekerView_link
//
//  Created by jianfeng on 15/2/12.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Province.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (nonatomic, strong) NSArray *dataList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSArray *array = @[@{@"name":@"xiaoming",
//                         @"age":@12},
//                       @{@"name":@"xiaohong",
//                         @"age":@13}];
//    
//    
//    // 可以取出字典数组或者模型数组的某一个key或者属性的所有值,并放在数组里
//    NSArray *arr =  [array valueForKeyPath:@"name"];
//    NSArray *arr = [self.dataList valueForKeyPath:@"name"];
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


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.dataList.count;
    }
    else{
        // 先取出第一列选中的行数
        NSInteger selectedIndex = [pickerView selectedRowInComponent:0];
        // 取出选中的省份的模型
        Province *pro = self.dataList[selectedIndex];
        return pro.cities.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        // 取出每个城市的名字
        Province *pro = self.dataList[row];
        return pro.name;
    }
    else{
        // 先取出第一列选中的行数
        NSInteger selectedIndex = [pickerView selectedRowInComponent:0];
        // 取出选中的省份的模型
        Province *pro = self.dataList[selectedIndex];
        // 返回每一行对应的城市名
        return pro.cities[row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component > 0) return;
    
    
    [pickerView reloadComponent:1];
    [pickerView selectRow:0 inComponent:1 animated:YES];
    
    
    
}

@end
