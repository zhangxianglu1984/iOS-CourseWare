//
//  ViewController.m
//  Demo_MapKit(基本使用)
//
//  Created by zhang xianglu on 15/9/12.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

#import <MapKit/MapKit.h>
#import "ZXLMapKitAnnotation.h"

@interface ViewController () <MKMapViewDelegate>


@property (weak, nonatomic) IBOutlet MKMapView *mapView;

- (void)mapViewTappedAction:(UITapGestureRecognizer *)gesture;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	
	_mapView.mapType = MKMapTypeStandard;
	
	_mapView.userTrackingMode = MKUserTrackingModeFollow;
	
	_mapView.delegate = self;
	
	//UITapGestureRecognizer *tapGestureRecoginzer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(mapViewTappedAction:)];
	
	//[_mapView addGestureRecognizer:tapGestureRecoginzer];
	
	//美食Annotation
	ZXLMapKitAnnotation *foodAnnotation = [[ZXLMapKitAnnotation alloc] init];
	foodAnnotation.title = @"美食";
	foodAnnotation.subtitle = @"xxx大饭店，全场10折";
	foodAnnotation.iconImageName = @"category_1";
	foodAnnotation.coordinate = CLLocationCoordinate2DMake(24.495826, 118.1915);
	[_mapView addAnnotation:foodAnnotation];
	
	//电影
	ZXLMapKitAnnotation *cinemaAnnotation = [[ZXLMapKitAnnotation alloc] init];
	cinemaAnnotation.title = @"万达电影院";
	cinemaAnnotation.subtitle = @"会员免费看大片";
	cinemaAnnotation.iconImageName = @"category_5";
	cinemaAnnotation.coordinate = CLLocationCoordinate2DMake(24.5, 118.2);
	[_mapView addAnnotation:cinemaAnnotation];
	
}

- (void)mapViewTappedAction:(UITapGestureRecognizer *)gesture {

	CGPoint tappedPoint = [gesture locationInView:gesture.view];
	
	//将直角坐标系转为经纬度坐标
	CLLocationCoordinate2D locationCoordinate2D = [_mapView convertPoint:tappedPoint toCoordinateFromView:_mapView];

	ZXLMapKitAnnotation *annotation = [[ZXLMapKitAnnotation alloc] init];
	annotation.coordinate = locationCoordinate2D;
	annotation.title = @"软件园二期，果核教育科技";
	annotation.subtitle = @"iOS,PHP培训";
	
	
	//annotation.location = [[CLLocation alloc] initWithLatitude:locationCoordinate2D.latitude longitude:locationCoordinate2D.longitude];
	
	[_mapView addAnnotation:annotation];
}

#pragma MKMapView Delegate Methods
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
	CLLocationCoordinate2D userLocationCoordinate = userLocation.location.coordinate;
	
	MKCoordinateSpan span = MKCoordinateSpanMake(0.09, 0.09);
	
	MKCoordinateRegion region = MKCoordinateRegionMake(userLocationCoordinate, span);
	
	[mapView setRegion:region animated:YES];
	
	
}

/**
 *  根据大头针Annotation模型创建大头针视图(一种板式的视图，对应一个大头针模型类)
 */
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation {
	
	//返回空时，由系统指定默认的大头针视图
	if (![annotation isMemberOfClass:[ZXLMapKitAnnotation class]]) return nil;
	
	static NSString *annotationIdentifier = @"TuanGou";
	
	MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:annotationIdentifier];
	if (annotationView == nil) {
		annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationIdentifier];
		//显示标题等
		annotationView.canShowCallout = YES;
		//偏移量(点)
		annotationView.calloutOffset = CGPointMake(0, -10);
		//右边的按钮控件
		annotationView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
		//左边按钮控件
		annotationView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
		
		//如果是MKPinAnnotationView，可设置从天而降的动画
		annotationView.animatesDrop = YES;
	}
	
	ZXLMapKitAnnotation *mapKitAnnotation = (ZXLMapKitAnnotation *)annotation;
	//这里再次传递模型
	annotationView.annotation = mapKitAnnotation;
	annotationView.image = [UIImage imageNamed:mapKitAnnotation.iconImageName];
		
	return annotationView;
}


@end
