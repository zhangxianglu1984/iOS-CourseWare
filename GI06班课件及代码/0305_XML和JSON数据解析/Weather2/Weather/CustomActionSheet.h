//
//  CustomActionSheet.h
//  Weather
//
//  Created by jianfeng on 15/3/9.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomActionSheet;

@protocol CustomActionSheetDelegate <NSObject>

- (void)actionSheet:(CustomActionSheet *)as didSelectedCity:(NSString *)cityCode;

@end

@interface CustomActionSheet : UIAlertController

+ (instancetype)actionSheet;
@property (nonatomic, weak)id<CustomActionSheetDelegate> delegate;

// readonly表示只读(表示这个属性只能让别人读取,不能进行设置)
@property (nonatomic, copy, readonly) NSString *cityCode;

@end
