//
//  ViewController.m
//  MKMapView
//
//  Created by 敖 然 on 15/4/24.
//  Copyright (c) 2015年 imcore. All rights reserved.
//

#import "ViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "CustomAnnotation.h"

@interface ViewController ()<MKMapViewDelegate>

@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic, strong) CLLocationManager *manager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (CLLocationManager *)manager
{
    if (!_manager) {
        _manager = [[CLLocationManager alloc]init];
    }
    return _manager;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
//    // 设置地图中某一点显示到屏幕中心
//    [self.mapView setCenterCoordinate:CLLocationCoordinate2DMake(24.5, 118.f) animated:YES];
//    // 设置地图显示的区域
//    MKCoordinateRegion region = MKCoordinateRegionMake(CLLocationCoordinate2DMake(24.5, 118.f), MKCoordinateSpanMake(0.01, 0.01));
//    [self.mapView setRegion:region animated:YES];
    
    
    CustomAnnotation *anno = [[CustomAnnotation alloc]init];
    anno.coordinate = CLLocationCoordinate2DMake(25, 110);
    anno.title = @"广西";
    anno.subtitle = @"广西好地方";
    [self.mapView addAnnotation:anno];
    

//    // 显示用户当前的信息只要调用setShowsUserLocation：方法就可以了
//    // （别忘记那两步）
//    // 使用前先进行版本判断
    [self.manager requestWhenInUseAuthorization];
    self.mapView.showsUserLocation = YES;
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation
{
    // MKAnnotationView 大头针视图
    // MKAnnotation     大头针模型
    userLocation.title = @"福建";
    userLocation.subtitle = @"福建福建。。。";
    
    // 将定位到的用户位置移动到屏幕中心并设定跨度
//    CLLocationCoordinate2D coor = userLocation.location.coordinate;
//    [self.mapView setRegion:MKCoordinateRegionMake(coor, MKCoordinateSpanMake(0.1, 0.1)) animated:YES];
//    [self.mapView setCenterCoordinate:coor animated:YES];
    
    // 在其他地方也可以直接取用户当前位置的信息
//    [self.mapView setCenterCoordinate:self.mapView.userLocation.coordinate animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
//    // 如果返回是nil的话，就按照系统默认的显示
//    return nil;
    if ([annotation isKindOfClass:[MKUserLocation class]]) {
        return nil;
    }
    
//    MKPinAnnotationView *pinAnno = [[MKPinAnnotationView alloc]initWithAnnotation:nil reuseIdentifier:@"anno"];
//    pinAnno.pinColor = MKPinAnnotationColorPurple;
//    pinAnno.animatesDrop = YES;
//    pinAnno.canShowCallout = YES;
//    return pinAnno;
    
    MKAnnotationView *anno = [self.mapView dequeueReusableAnnotationViewWithIdentifier:@"anno"];
    if (!anno) {
        anno = [[MKAnnotationView alloc]initWithAnnotation:nil reuseIdentifier:@"anno"];
    }
    anno.image = [UIImage imageNamed:@"b558cbf0gw1efctjfr5pwj20h00h0dha.jpg"];
    anno.canShowCallout = YES;
    anno.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    anno.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
    return anno;
    
}



@end
