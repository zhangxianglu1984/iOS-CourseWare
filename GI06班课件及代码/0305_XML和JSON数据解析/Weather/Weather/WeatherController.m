//
//  WeatherController.m
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "WeatherController.h"
#import "WeatherCell.h"
#import "Defines.h"
#import "CityWeather.h"
#import "DataTool.h"
#import "City.h"
#import "CustomActionSheet.h"

@interface WeatherController ()<WeatherCellDelegate,CustomActionSheetDelegate>
{
    NSMutableArray *cityArray;
    CustomActionSheet *alert;
}

@property (nonatomic, strong) UIPickerView *cityPicker;
@property (nonatomic, strong) NSArray *pickerData;
@property (nonatomic, strong) UIToolbar *toolBar;

@end


@implementation WeatherController

static NSString * const reuseIdentifier = @"Cell";

// 重写UICollectionViewController的init方法,让flowLayout的设置都在自己内部进行
- (instancetype)init
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(kScreenWidth, kScreenHeight);
    layout.minimumLineSpacing = 0;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
//    if (self = [super initWithCollectionViewLayout:layout]) {
//        
//    }
//    return self;
    
    // 如果if语句里面没有执行任何操作,那么下面这句和上面三句是等同的
    return [super initWithCollectionViewLayout:layout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.collectionView.pagingEnabled = YES;
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"WeatherCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    
    [self setupData];
}

- (void)setupData
{
    cityArray = [NSMutableArray array];
    CityWeather *bjWeather = [DataTool getCityWeatherWithCityCode:@"101010100"];
//    if (bjWeather) {
        [cityArray addObject:bjWeather];
//    }
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return cityArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WeatherCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.delegate = self;
    cell.model = cityArray[indexPath.row];
    return cell;
}

#pragma mark - WeatherCellDelegate

- (void)weatherCell:(WeatherCell *)cell didClickPlusButton:(UIButton *)button
{
    // 初始化alertContrl
    alert = [CustomActionSheet actionSheet];
    alert.delegate = self;
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)weatherCell:(WeatherCell *)cell didClickMinusButton:(UIButton *)button
{
    // 1.获得减号所在cell的坐标(indexPath)
    NSInteger index = [self.collectionView indexPathForCell:cell].row;
    // 2.删除该下标对应的数据
    [cityArray removeObjectAtIndex:index];
    // 3.刷新表格
    [self.collectionView reloadData];
}

#pragma mark - CustomActionSheetDelegate

- (void)actionSheet:(CustomActionSheet *)as didSelectedCity:(NSString *)cityCode
{
    // 获取模型
    CityWeather *model = [DataTool getCityWeatherWithCityCode:cityCode];
    // 2.添加到数组
    [cityArray addObject:model];
    // 3.刷新界面
    [self.collectionView reloadData];
    // 4.滚动到新添加的城市
    CGFloat offsetX = self.collectionView.contentOffset.x;
    offsetX += kScreenWidth;
    [self.collectionView setContentOffset:CGPointMake(offsetX, 0) animated:YES];
}



@end
