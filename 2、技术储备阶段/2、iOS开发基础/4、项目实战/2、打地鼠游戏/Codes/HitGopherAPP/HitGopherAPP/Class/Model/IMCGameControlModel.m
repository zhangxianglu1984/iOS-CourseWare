//
//  IMCGameControlModel.m
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "IMCGameControlModel.h"

static const NSInteger kCountNumber = 10;

@interface IMCGameControlModel ()

/*
 *  游戏全场定时器
 **/
@property(nonatomic, strong) NSTimer *timer;

/*
 *  倒计时
 **/
@property(nonatomic, assign) NSInteger counter;


- (void)timerRunAction;

@end

@implementation IMCGameControlModel

- (instancetype)init {
    if (self = [super init]) {
        self.counter = kCountNumber;
        self.gameState = IMCGameStateStop;
    }
    return self;
}

/*
 *  开始游戏
 **/
- (void)startGame {
    self.gameState = IMCGameStateRun;
}

- (void)pauseGame {
    self.gameState = IMCGameStatePause;
}

- (void)stopGame {
    self.gameState = IMCGameStateStop;
}

- (void)resumGame {
    self.gameState = IMCGameStateRun;
}

- (void)setGameState:(IMCGameState)gameState {
    switch (gameState) {
        case IMCGameStateStop: {
            if (_gameState == IMCGameStateRun) {
                [_timer invalidate];
            }
            break;
        }
        case IMCGameStateRun: {
            if (_gameState == IMCGameStateStop) {
                self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timerRunAction) userInfo:nil repeats:YES];
            }else if (_gameState == IMCGameStatePause) {
                _timer.fireDate = [NSDate distantPast];
            }
            break;
        }
        case IMCGameStatePause: {
            if (_gameState == IMCGameStateRun) {
                //定时器本身没有暂停方法
                _timer.fireDate = [NSDate distantFuture];
            }
            break;
        }
        default:
            break;
    }
    
    //把游戏的状态更新了
    _gameState = gameState;
    
    if ([_delegate respondsToSelector:@selector(controlModel:stateChanged:)]) {
        [_delegate controlModel:self stateChanged:_gameState];
    }
}

- (void)timerRunAction {
    if (_counter <= 0) {
        self.counter = kCountNumber;
    }
    self.counter --;
}

- (void)setCounter:(NSInteger)counter {
    _counter = counter;
    
    //如果计时已经到0，则停止计时
    if (_counter == 0) {
        [self.timer invalidate];
        self.gameState = IMCGameStateStop;
    }
    
    //通知代理
    if ([_delegate respondsToSelector:@selector(controlModel:counterChanged:)]) {
        [_delegate controlModel:self counterChanged:_counter];
    }
}

@end
