//
//  ViewController.m
//  UIPickerView_pop
//
//  Created by jianfeng on 15/2/11.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import "Defines.h"

@interface ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate,UIActionSheetDelegate>
{
    UIPickerView *picker;
    NSArray *dataList;
}

@property (weak, nonatomic) IBOutlet UITextField *field;
- (IBAction)presentPicker:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    picker = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth-20, 216)];
    picker.dataSource = self;
    picker.delegate = self;
    
    dataList = @[@"111",@"222",@"333"];
    
//    [self pickerViewWithInputView];
//    self.field.delegate = self;
//    [self pickerViewWithAlertController];
    
}

// 当做键盘视图弹出(所有SKD都适用)
- (void)pickerViewWithInputView
{
//    self.field.inputAccessoryView = picker;
    UIToolbar *toolBar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 44)];
    UIBarButtonItem *flex = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc]initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(choose:)];
    toolBar.items = @[flex, doneItem];
    
    self.field.inputAccessoryView = toolBar;
    self.field.inputView = picker;
}

// 通过提示框弹出来
- (void)pickerViewWithAlertController
{
    // iOS8之后
    if (kIsiOS8){
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示\n\n\n\n\n\n\n\n\n\n\n" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        
        [alertController.view addSubview:picker];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
        [self performSelector:@selector(change) withObject:nil afterDelay:1];
    }
    else{
        UIActionSheet *actionSheet = [[UIActionSheet alloc]initWithTitle:@"提示\n\n\n\n\n\n\n\n\n\n\n" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"aaa",@"abb", nil];
        
        [actionSheet addSubview:picker];
        [actionSheet showInView:self.view];
    }
}

- (void)change
{
    [picker selectRow:2 inComponent:0 animated:YES];
}

#pragma mark - click

- (void)choose:(UIBarButtonItem *)item
{
    NSInteger row = [picker selectedRowInComponent:0];
    self.field.text = dataList[row];
    [self.field resignFirstResponder];
}

#pragma mark - UIPickerViewDelegate,UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return dataList.count;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return dataList[row];
}

// 或者picker每次滚动的时刻
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
{
    return YES;
}

- (IBAction)presentPicker:(id)sender {
    [self pickerViewWithAlertController];
}

#pragma mark - UIActionSheetDelegate

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        
    }
    else{
        
    }
}
@end
