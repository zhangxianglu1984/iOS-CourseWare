//
//  ViewController.m
//  Demo_CoreLocation基本使用
//
//  Created by zhang xianglu on 15/8/28.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>

@interface ViewController () <CLLocationManagerDelegate>

@property(nonatomic,strong) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//CLLocationManager *locationManager = [[CLLocationManager alloc] init];
	
	
	//self.locationManager.distanceFilter = 100.0;
	
	self.locationManager.delegate = self;
	if ([[UIDevice currentDevice].systemVersion floatValue] >= 8.0) {
		[self.locationManager requestAlwaysAuthorization];
		//[self.locationManager requestWhenInUseAuthorization];
	} else {
		[self.locationManager startUpdatingLocation];
	}
}

#pragma mark - CLLocationManager Delegate Methods
/**
 *  当locationManager获得用户位置后,会发送这个消息给它的代理
 *
 *  @param manager   manager description
 *  @param locations locations 用户的位置信息
 */
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
	
	CLLocation *location = [locations lastObject];
	NSLog(@"%f,%f,speed = %f",location.coordinate.latitude,location.coordinate.longitude,location.speed);
	
	CLGeocoder *geocoder = [[CLGeocoder alloc] init];
	[geocoder reverseGeocodeLocation:经纬度 completionHandler:^(NSArray *placemarks, NSError *error) {
		//placemarks 包含了相关的地址信息
	}];
	
 	//[self.locationManager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading {
	NSLog(@"direction: %f",newHeading.magneticHeading);
	
	[manager stopUpdatingHeading];
}

#pragma mark - Getters And Setters Methods
- (CLLocationManager *)locationManager {
	if (!_locationManager) {
		self.locationManager = [[CLLocationManager alloc] init];
	}
	return _locationManager;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
	if (status == kCLAuthorizationStatusNotDetermined) {
		NSLog(@"弹出了询问授权提示框...");
	}else if (status == kCLAuthorizationStatusAuthorizedAlways) {
		NSLog(@"用户同意授权，开始获取用户位置");
		[manager startUpdatingLocation];
		
		//获取用户的方向信息
		[manager startUpdatingHeading];
	}else if (status == kCLAuthorizationStatusDenied) {
		NSLog(@"用户拒绝授权");
	}
}


@end
