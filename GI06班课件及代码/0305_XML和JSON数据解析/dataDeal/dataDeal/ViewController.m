//
//  ViewController.m
//  dataDeal
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSArray *provinceArray;
    NSArray *cityArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 生成所有省份的代码
    [self getProvinceCodeDic];
    [self getCityCode];

    [self deal];
}

- (void)getCityCode
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"cityId.txt" ofType:nil];
    
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *arr = [str componentsSeparatedByString:@"\n"];

    NSMutableArray *cityArrayAfter = [NSMutableArray array];
    for (NSString *provinceStr in arr) {
        NSArray *singleProArray = [provinceStr componentsSeparatedByString:@":"];
        NSString *code = singleProArray[1];
        NSString *cityCode = [code substringFromIndex:5];
        NSDictionary *dic = @{singleProArray[0]:cityCode};
        [cityArrayAfter addObject:dic];
    }
    // @{北京:@"101001010",...};
    cityArray = cityArrayAfter;
    //    NSLog(@"provinceArray:%@",provinceArray);
    
}

- (void)getProvinceCodeDic
{
    NSString *filePath = [[NSBundle mainBundle]pathForResource:@"provinceCode.txt" ofType:nil];
    NSString *str = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    NSArray *arr = [str componentsSeparatedByString:@"\n"];
    NSMutableArray *provinceArrayAfter = [NSMutableArray array];
    for (NSString *provinceStr in arr) {
        NSArray *singleProArray = [provinceStr componentsSeparatedByString:@":"];
        NSDictionary *dic = @{singleProArray[0]:singleProArray[1]};
        [provinceArrayAfter addObject:dic];
    }
    // @{北京:@"101001010",...};
    provinceArray = provinceArrayAfter;
//    NSLog(@"provinceArray:%@",provinceArray);
}

- (NSString *)codeWithProvinceName:(NSString *)provinceName
{
    NSString *code = nil;
    for (NSDictionary *dic in provinceArray) {
        NSString *key = [dic allKeys][0];
        if ([key isEqualToString:provinceName]) {
            code = [dic valueForKey:key];
            break;
        }
    }
    return code;
}

- (NSString *)codeWithCityName:(NSString *)cityName
{
    NSString *code = nil;
    for (NSDictionary *dic in cityArray) {
        NSString *key = [dic allKeys][0];
        if ([key isEqualToString:cityName]) {
            code = [dic valueForKey:key];
            break;
        }
    }
    return code;
}

- (NSString *)filePath
{
    return [NSString stringWithFormat:@"%@/%@/%@",NSHomeDirectory(),@"Documents",@"final.plist"];
}

- (void)deal
{
    // 原始的省份和城市数据
    NSString *str = [[NSBundle mainBundle]pathForResource:@"city.plist" ofType:nil];
    NSArray *allCityArray = [[NSArray alloc]initWithContentsOfFile:str];
    
    // 最后得到的省份和城市数组
    NSMutableArray *mAllCityArray = [NSMutableArray array];
    
    // 遍历原始数组
    for (NSDictionary *dicBefore in allCityArray) {
        NSMutableDictionary *dicPc = [NSMutableDictionary dictionary];
        
        // 省份
        NSMutableDictionary *dicProAfter = [NSMutableDictionary dictionary];
        // 省份名称
        NSString *proName = dicBefore[@"state"];
        [dicProAfter setObject:proName forKey:@"name"];
        // 省份代码
        NSString *proCode = [self codeWithProvinceName:proName];
        if (proCode) {
            [dicProAfter setObject:proCode forKey:@"code"];
        }
        
        
        [dicPc setObject:dicProAfter forKey:@"province"];
        
        // 城市字典
        // 准备
        NSMutableDictionary *dicCityAfter = [NSMutableDictionary dictionary];
        NSMutableArray *cities = [NSMutableArray array];

        // 原始cities数组  只有名字(字符串)
        NSArray *cityNamesArray = dicBefore[@"cities"];

        for (NSInteger i = 0; i < [cityNamesArray count]; i++) {
            NSMutableDictionary *cityDic = [NSMutableDictionary dictionary];
            NSString *cityName = cityNamesArray[i];
            [cityDic setObject:cityName forKey:@"name"];
            NSString *cityCode = [self codeWithCityName:cityNamesArray[i]];
            if (cityCode) {
                [cityDic setObject:cityCode forKey:@"code"];
            }
            else{
                [cityDic setObject:@"" forKey:@"code"];
            }
            [cities addObject:cityDic];
        }

        [dicPc setObject:cities forKey:@"cities"];
    
        [mAllCityArray addObject:dicPc];
    }
    
    NSLog(@"%@",mAllCityArray);
    
    [mAllCityArray writeToFile:[self filePath] atomically:YES];
    
    
//    NSMutableArray *arrayFinal = [NSMutableArray array];
//    for (NSInteger i = 0; i < mAllCityArray.count; i++) {
//        NSDictionary *dic = @{@"province":mAllCityArray[i]};
//        [arrayFinal addObject:dic];
//    }
//    
//    NSLog(@"final:%@",arrayFinal);
//    
//    NSLog(@"%d",[arrayFinal writeToFile:[self filePath] atomically:YES]) ;
}

@end
