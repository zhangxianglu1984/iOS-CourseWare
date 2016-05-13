//
//  ViewController.m
//  CoreLocation
//
//  Created by 敖 然 on 15/4/23.
//  Copyright (c) 2015年 imcore. All rights reserved.
//

#import "ViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface ViewController ()<CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *manager;
@property (nonatomic, strong) CLGeocoder *geocoder;// 进行地理编码和逆地理编码

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (CLLocationManager *)manager
{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
        _manager.delegate = self;
        // 隔多少米定位一次
//        _manager.distanceFilter
        // 定位精度（越高越耗电）
//        _manager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    return _manager;
}

- (CLGeocoder *)geocoder
{
    if (!_geocoder) {
        _geocoder = [[CLGeocoder alloc]init];
    }
    return _geocoder;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 地理编码
    [self.geocoder geocodeAddressString:@"厦门市望海路55号" completionHandler:^(NSArray *placemarks, NSError *error) {
         CLPlacemark *placeMark = [placemarks firstObject];
        NSLog(@"%f - %f",placeMark.location.coordinate.latitude,
              placeMark.location.coordinate.longitude);
    }];
    
    // 逆地理编码
    CLLocation *location = [[CLLocation alloc]initWithLatitude:24.489363f longitude:118.185662f];
    [self.geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        NSLog(@"%@",[[placemarks firstObject] name]);
    }];
}

- (void)locManager
{
    CLLocationManager *manager = [[CLLocationManager alloc]init];
    manager.delegate = self;
    // XCode6之后，需要手动设置定位权限
    /* 1.1 要在plist里面增加两个键值对
     NSLocationAlwaysUsageDescription
     NSLocationWhenInUseUsageDescription
     并设置为YES
     */
    
    // 1.2 要在使用定位服务前设置定位权限(iOS8之后才有，使用的时候需要判断版本)
    //    [manager requestAlwaysAuthorization];
    [self.manager requestWhenInUseAuthorization];
    // 通常用来定位用户当前位置信息
    [self.manager startUpdatingLocation];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    CLLocation *loc = [locations lastObject];
    NSLog(@"%f-%f",loc.coordinate.latitude, loc.coordinate.longitude);
    
    // 获取到用户位置信息后要停止定位更新
    [self.manager stopUpdatingLocation];
}


@end
