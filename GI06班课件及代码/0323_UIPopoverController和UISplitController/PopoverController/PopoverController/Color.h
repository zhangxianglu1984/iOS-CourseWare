//
//  Color.h
//  PopoverController
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Color : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) UIColor *color;

+ (instancetype)colorWithName:(NSString *)name andColor:(UIColor *)Color;
- (instancetype)initWithName:(NSString *)name andColor:(UIColor *)Color;

@end
