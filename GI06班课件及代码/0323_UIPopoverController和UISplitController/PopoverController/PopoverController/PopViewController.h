//
//  PopViewController.h
//  PopoverController
//
//  Created by jianfeng on 15/3/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^clickBlock)(UIColor *color);


@interface PopViewController : UIViewController

- (instancetype)initWithBlock:(clickBlock) block;


@end
