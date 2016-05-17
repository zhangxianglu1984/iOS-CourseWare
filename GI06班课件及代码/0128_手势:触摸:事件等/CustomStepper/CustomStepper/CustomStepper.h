//
//  CustomStepper.h
//  CustomStepper
//
//  Created by Apple on 15/1/27.
//  Copyright (c) 2015年 Summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomStepperDelegate <NSObject>

- (void)customStepperValueDidChanged:(NSInteger) value;

@end

@interface CustomStepper : UIView

@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) id<CustomStepperDelegate> delegate;

@end
