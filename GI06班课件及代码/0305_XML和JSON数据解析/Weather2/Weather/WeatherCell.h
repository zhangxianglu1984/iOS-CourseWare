//
//  WeatherCell.h
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityWeather;
@class WeatherCell;

@protocol WeatherCellDelegate <NSObject>

- (void)weatherCell:(WeatherCell *)cell didClickPlusButton:(UIButton *)button;
- (void)weatherCell:(WeatherCell *)cell didClickMinusButton:(UIButton *)button;

@end

@interface WeatherCell : UICollectionViewCell

@property (nonatomic, strong) CityWeather *model;
@property (nonatomic, weak) id<WeatherCellDelegate> delegate;

@end
