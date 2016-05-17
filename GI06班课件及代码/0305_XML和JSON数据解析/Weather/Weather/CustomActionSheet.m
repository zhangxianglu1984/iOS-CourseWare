//
//  CustomActionSheet.m
//  Weather
//
//  Created by jianfeng on 15/3/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "CustomActionSheet.h"
#import "City.h"
#import "Defines.h"

@interface CustomActionSheet()<UIPickerViewDelegate,UIPickerViewDataSource>

@property (nonatomic, strong) UIPickerView *cityPicker;
@property (nonatomic, strong) NSArray *pickerData;
@property (nonatomic, strong) UIToolbar *toolBar;

@end

@implementation CustomActionSheet

+ (instancetype)actionSheet
{
    return [self alertControllerWithTitle:@"\n\n\n\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view addSubview:self.toolBar];
    [self.view addSubview:self.cityPicker];
}


- (NSArray *)pickerData
{
    if (!_pickerData) {
        NSString *path =[[NSBundle mainBundle]pathForResource:@"final.plist" ofType:nil];
        NSArray *originArr = [NSArray arrayWithContentsOfFile:path];
        
        NSMutableArray *mArray = [NSMutableArray array];
        for (NSDictionary *dic in originArr) {
            City *city = [City cityWithDic:dic];
            [mArray addObject:city];
        }
        _pickerData = mArray;
    }
    return _pickerData;
}

- (UIPickerView *)cityPicker
{
    if (!_cityPicker) {
        _cityPicker = [[UIPickerView alloc]initWithFrame:CGRectMake(1, 44, kScreenWidth - 20, 216)];
        _cityPicker.delegate = self;
        _cityPicker.dataSource = self;
    }
    return _cityPicker;
}

- (UIToolbar *)toolBar
{
    if (!_toolBar) {
        _toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(1, 1, kScreenWidth - 20, 44)];
        UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelPick)];
        UIBarButtonItem *flex = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *OKItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(okPick)];
        _toolBar.items = @[cancelItem, flex, OKItem];
    }
    return _toolBar;
}

#pragma mark - UIPickerViewDelegate

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return self.pickerData.count;
    }
    else{
        // 得到第0组中选中的行数
        NSInteger index0 = [pickerView selectedRowInComponent:0];
        // 取出第一行选中的省份
        City *pro = self.pickerData[index0];
        return pro.cities.count;
    }
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        City *pro = self.pickerData[row];
        return pro.name;
    }
    else{
        NSInteger index0 = [pickerView selectedRowInComponent:0];
        City *pro = self.pickerData[index0];
        City *city = pro.cities[row];
        return city.name;
    }
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        [pickerView reloadComponent:1];
        [pickerView selectRow:0 inComponent:1 animated:YES];
    }
}

#pragma mark - click

- (void)cancelPick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)okPick
{
    // 第一列和第二列选中的行数
    NSInteger index0 = [self.cityPicker selectedRowInComponent:0];
    NSInteger index1 = [self.cityPicker selectedRowInComponent:1];

    // 取出选中的省份和城市
    City *pro = self.pickerData[index0];
    City *city = pro.cities[index1];

    // 1.获取城市数据模型
    NSString *cityCode = [NSString stringWithFormat:@"%@%@",pro.code, city.code];
    if (self.delegate && [self.delegate respondsToSelector:@selector(actionSheet:didSelectedCity:)]) {
        [self.delegate actionSheet:self didSelectedCity:cityCode];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}



@end
