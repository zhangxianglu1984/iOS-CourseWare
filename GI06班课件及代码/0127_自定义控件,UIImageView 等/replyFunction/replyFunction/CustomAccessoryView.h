//
//  CustomAccessoryView.h
//  replyFunction
//
//  Created by jianfeng on 15/1/27.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CustomAccessoryViewDelegate <NSObject>

- (void)dealWithString:(NSString *)str;

@end

@interface CustomAccessoryView : UIView

- (void)becomeFirstResponder;
- (void)resignFirstResponder;
- (NSString *)showString;

@property (nonatomic, assign)id<CustomAccessoryViewDelegate> delegate;




//@property (nonatomic, strong) NSString *showString;

@end
