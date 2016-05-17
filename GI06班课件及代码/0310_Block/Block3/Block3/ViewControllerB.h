//
//  ViewControllerB.h
//  Block3
//
//  Created by jianfeng on 15/3/10.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^passValueBlock)(NSString *str);

@interface ViewControllerB : UIViewController

@property (nonatomic, copy) passValueBlock block;

+ (instancetype)viewControllerBWithBlock:(passValueBlock)block;

@end
