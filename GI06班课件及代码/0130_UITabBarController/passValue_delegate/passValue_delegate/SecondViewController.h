//
//  SecondViewController.h
//  passValue_delegate
//
//  Created by jianfeng on 15/1/30.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SecondViewControllerDelegate <NSObject>

- (void)dealWithString:(NSString *)str;

@end

@interface SecondViewController : UIViewController

@property (nonatomic ,assign) id<SecondViewControllerDelegate> delegate;

@end
