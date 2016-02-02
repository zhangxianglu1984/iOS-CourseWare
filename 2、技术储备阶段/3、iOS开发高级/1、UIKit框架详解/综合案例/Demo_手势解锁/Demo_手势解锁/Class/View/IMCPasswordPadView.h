//
//  IMCPasswordPadView.h
//  Demo_手势解锁
//
//  Created by xiangluzhang on 15/12/15.
//  Copyright © 2015年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class IMCPasswordPadView;

@protocol IMCPasswordPadViewDelegate <NSObject>

@optional
- (void)passwordPadView:(IMCPasswordPadView *)passwordPadView didFinishInputPassword:(NSString *)password;

@end

@interface IMCPasswordPadView : UIView

@property(nonatomic,weak) id<IMCPasswordPadViewDelegate> delegate;

@end





