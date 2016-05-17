//
//  ViewController.m
//  UIPickerView
//
//  Created by jianfeng on 15/2/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Defines.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
{
    NSArray *dataList;
    UIPickerView *picker;
}
- (IBAction)clickButton:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 50, kScreenWidth, 216)];
    picker.backgroundColor = [UIColor orangeColor];
    picker.dataSource = self;
    picker.delegate = self;
    [self.view addSubview:picker];
    
    NSArray *arr0 = @[@"comp0-row0",@"comp0-row1",@"comp0-row2",@"comp0-row3",@"comp0-row4"];
    NSArray *arr1 = @[@"comp1-row0",@"comp1-row1",@"comp1-row2",@"comp1-row3",@"comp1-row4"];
    
    dataList = @[arr0,arr1];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return dataList.count;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [dataList[component] count];
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return dataList[component][row];
}


- (IBAction)clickButton:(id)sender {
    NSInteger row0 = [picker selectedRowInComponent:0];
    NSString *str0 = dataList[0][row0];
    
    NSInteger row1 = [picker selectedRowInComponent:1];
    NSString *str1 = dataList[1][row1];
    
    NSLog(@"%@,%@",str0,str1);

}
@end
