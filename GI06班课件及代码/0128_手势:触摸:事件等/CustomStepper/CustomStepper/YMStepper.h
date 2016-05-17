//
//  YMStepper.h
//  YAMI
//
//  Created by Apple on 14-9-2.
//  Copyright (c) 2014年 Summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YMStepper;

@protocol YMStepperDelegate <NSObject>

- (void)stepper:(YMStepper *)stepper valueDidChanged:(NSInteger)value;

@end

@interface YMStepper : UIView

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) id<YMStepperDelegate> delegate;

@end
