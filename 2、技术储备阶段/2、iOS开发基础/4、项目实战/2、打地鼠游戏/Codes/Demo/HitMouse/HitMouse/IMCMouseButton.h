//
//  IMCMouseButton.h
//  PlayMouse
//
//  Created by zhang xianglu on 15/4/21.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import <UIKit/UIKit.h>


@class IMCMouseButton;
@protocol IMCMouseButtonDelegate

@optional

/** 有地鼠时，击中啦 **/
- (void)onAppearedMouseHitted:(IMCMouseButton *)mouseButton;

@end

@interface IMCMouseButton : UIButton

@property(nonatomic,weak) id<IMCMouseButtonDelegate> delegate;

/** 出现地鼠 **/
- (void)appearMouse;

/** 消失地鼠 **/
- (void)disappearMouse;

@end
