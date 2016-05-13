//
//  WeatherCell.m
//  Weather
//
//  Created by jianfeng on 15/3/6.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "WeatherCell.h"
#import "CityWeather.h"

@interface WeatherCell()

@property (weak, nonatomic) IBOutlet UIView *titleView;
@property (weak, nonatomic) IBOutlet UILabel *cityNameLabel;
@property (weak, nonatomic) IBOutlet UIView *panel;
@property (weak, nonatomic) IBOutlet UILabel *tempLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UILabel *tempIntervalLabel;
@property (weak, nonatomic) IBOutlet UILabel *windLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *qualityLabel;

@end

@implementation WeatherCell

- (void)awakeFromNib {
    self.panel.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    self.titleView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.4];
}

- (void)setModel:(CityWeather *)model
{
    _model = model;
    self.tempLabel.text = [NSString stringWithFormat:@"%@°",_model.wendu];
    self.descLabel.text = _model.type;
    self.tempIntervalLabel.text = [NSString stringWithFormat:@"%@ ~ %@",[_model.high substringFromIndex:3], [_model.low substringFromIndex:3]];
    self.windLabel.text = [NSString stringWithFormat:@"%@%@",_model.fengxiang, _model.fengli];
    self.dateLabel.text = _model.date;
    self.qualityLabel.text = [NSString stringWithFormat:@"空指:%@",_model.aqi];
    self.cityNameLabel.text = _model.city;
}

- (IBAction)removeCity:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(weatherCell:didClickMinusButton:)]) {
        [self.delegate weatherCell:self didClickMinusButton:sender];
    }
}
- (IBAction)addCity:(id)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(weatherCell:didClickPlusButton:)]) {
        [self.delegate weatherCell:self didClickPlusButton:sender];
    }
}


@end
