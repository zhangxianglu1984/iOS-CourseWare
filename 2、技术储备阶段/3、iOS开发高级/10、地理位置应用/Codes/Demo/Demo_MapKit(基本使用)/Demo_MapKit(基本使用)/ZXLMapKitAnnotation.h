//
//  ZXLMapKitAnnotation.h
//  Demo_MapKit(基本使用)
//
//  Created by zhang xianglu on 15/9/14.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>

@interface ZXLMapKitAnnotation : NSObject <MKAnnotation>

@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *subtitle;

@property(nonatomic,copy) NSString *iconImageName;

@property (nonatomic,assign) CLLocationCoordinate2D coordinate;

@end
