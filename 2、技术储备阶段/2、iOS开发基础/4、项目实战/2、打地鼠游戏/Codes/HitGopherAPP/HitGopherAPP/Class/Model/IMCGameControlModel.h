//
//  IMCGameControlModel.h
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, IMCGameState) {
    IMCGameStateStop = 0,
    IMCGameStateRun,
    IMCGameStatePause
};

@class IMCGameControlModel;

@protocol IMCGameControlModelDelegate <NSObject>


@optional
/*
 *  倒计时的数字改变了
 **/
- (void)controlModel:(IMCGameControlModel *)gameControlModel counterChanged:(NSInteger)counter;

/*
 *  游戏状态改变了
 **/
- (void)controlModel:(IMCGameControlModel *)gameControlModel stateChanged:(IMCGameState)gameState;

@end

/*
 *  游戏状态控制模型
 **/
@interface IMCGameControlModel : NSObject

/*
 *  记录当前游戏的状态：3个状态,未开始,进行中,暂停
 **/
@property(nonatomic, assign) IMCGameState gameState;

@property(nonatomic, weak) id<IMCGameControlModelDelegate> delegate;

- (void)startGame;

- (void)pauseGame;

- (void)stopGame;

- (void)resumGame;

@end
