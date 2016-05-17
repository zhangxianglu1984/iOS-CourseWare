//
//  ViewController.m
//  0126_UISwitchAndSoOn
//
//  Created by jianfeng on 15/1/26.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *colorArray;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary *dic0 = @{@"colorName":@"red",
                           @"color":[UIColor redColor]};
    NSDictionary *dic1 = @{@"colorName":@"blue",
                           @"color":[UIColor blueColor]};
//    NSDictionary *dic2 = @{@"colorName":@"brown",
//                           @"color":[UIColor brownColor]};
//    NSDictionary *dic3 = @{@"colorName":@"orange",
//                           @"color":[UIColor orangeColor]};
    colorArray = @[dic0,dic1];

    [self createSegmentControl];
    
    self.clothes.backgroundColor = [UIColor redColor];
    
    // 使view半透明而他的子控件不透明
    self.panelBg.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
}

- (void)createSegmentControl
{
    NSMutableArray *colorNameArray = [NSMutableArray array];
    for (NSDictionary *dic in colorArray) {
        [colorNameArray addObject:dic[@"colorName"]];
    }
    self.segmentControl = [[UISegmentedControl alloc]initWithItems:colorNameArray];
    self.segmentControl.frame = CGRectMake(14, 14, colorNameArray.count*40, 29);
    [self.segmentControl addTarget:self action:@selector(chooseColor:) forControlEvents:UIControlEventValueChanged];
    [self.panelBg addSubview:self.segmentControl];
}

- (void)chooseColor:(UISegmentedControl *)sender {
    NSLog(@"%d",sender.selectedSegmentIndex);
    NSDictionary *colorDic = colorArray[sender.selectedSegmentIndex];
    self.clothes.backgroundColor = colorDic[@"color"];//等同于[colorDic valueForKey:@"color"];
}

- (IBAction)changeAlpha:(UISlider *)sender {
    NSLog(@"%f",sender.value);
    self.clothes.alpha = sender.value;
}

- (IBAction)changeSex:(UISwitch *)sender {
    self.butterfly.hidden = !sender.isOn;
}
@end
