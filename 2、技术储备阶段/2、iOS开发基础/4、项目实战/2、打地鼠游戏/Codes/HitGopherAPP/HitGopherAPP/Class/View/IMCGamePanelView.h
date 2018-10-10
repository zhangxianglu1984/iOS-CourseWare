//
//  IMCGamePanelView.h
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol IMCGamePanelViewDelegate <NSObject>

@optional

/*
 *  当有地鼠的位置被打中后,通知它的代理
 **/
- (void)gopherHitted;

@end

@interface IMCGamePanelView : UIView

@property(nonatomic, weak) id<IMCGamePanelViewDelegate> delegate;

- (void)startGame;

- (void)stopGame;

- (void)pauseGame;

@end
