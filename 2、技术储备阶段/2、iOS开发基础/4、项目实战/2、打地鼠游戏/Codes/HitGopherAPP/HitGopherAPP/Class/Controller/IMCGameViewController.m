//
//  IMCGameViewController.m
//  HitGopherAPP
//
//  Created by xiangluzhang on 16/5/19.
//  Copyright © 2016年 xiangluzhang. All rights reserved.
//

#import "IMCGameViewController.h"

#import "IMCGamePanelView.h"

#import "IMCGameControlModel.h"

#import "IMCScoreModel.h"

@interface IMCGameViewController () <IMCGameControlModelDelegate,IMCScoreModelDelegate,IMCGamePanelViewDelegate>

@property(nonatomic, weak) IMCGamePanelView *gamePanelView;

@property(nonatomic, weak) UIButton *gameControlButton;

@property(nonatomic, strong) IMCGameControlModel *gameControlModel;

@property(nonatomic, strong) IMCScoreModel *scoreModel;

@property(nonatomic, weak) UILabel *timerLabel;

@property(nonatomic, weak) UILabel *scoreLabel;

- (void)gameControlButtonClickedAction:(UIButton *)gameControlButton;

@end

@implementation IMCGameViewController

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        self.gameControlModel = [IMCGameControlModel new];
        _gameControlModel.delegate = self;
        
        self.scoreModel = [IMCScoreModel new];
        //把自己(Controller)设置为模型的代理
        _scoreModel.delegate = self;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    IMCGamePanelView *gamePanelView = [[IMCGamePanelView alloc] init];
    gamePanelView.backgroundColor = [UIColor greenColor];
    
    gamePanelView.delegate = self;
    
    [self.view addSubview:gamePanelView];
    
    self.gamePanelView = gamePanelView;
    
    //UIButton
    UIButton *gameControlButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [gameControlButton setTitle:@"开始" forState:UIControlStateNormal];
    gameControlButton.backgroundColor = [UIColor orangeColor];
    
    [gameControlButton addTarget:self action:@selector(gameControlButtonClickedAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:gameControlButton];
    self.gameControlButton = gameControlButton;
    
    //counterLabel
    UILabel *timerLabel = [UILabel new];
    timerLabel.textColor = [UIColor redColor];
    timerLabel.font = [UIFont systemFontOfSize:24.0];
    timerLabel.text = @"10";
    timerLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:timerLabel];
    self.timerLabel = timerLabel;
    
    //scoreLabel
    UILabel *scoreLabel = [UILabel new];
    scoreLabel.textColor = [UIColor greenColor];
    scoreLabel.font = [UIFont systemFontOfSize:24.0];
    scoreLabel.text = @"0";
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    
    [self.view addSubview:scoreLabel];
    self.scoreLabel = scoreLabel;
}

/*
 *  布局self.view的子视图的时候调用
 **/
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    //计算gamePanel的尺寸和位置
    CGFloat gamePanelViewX = 0.0;
    CGFloat gamePanelViewY = 80.0;
    
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    
    CGFloat gamePanelViewWidth = screenSize.width;
    CGFloat gamePanelViewHeight = screenSize.height - 160.0;
    
    _gamePanelView.frame = CGRectMake(gamePanelViewX, gamePanelViewY, gamePanelViewWidth, gamePanelViewHeight);
    
    //gameControlButton
    _gameControlButton.frame = CGRectMake(0.0, screenSize.height - 44.0, screenSize.width, 44.0);
    
    //counterLable
    _timerLabel.frame = CGRectMake(0.0, 20.0, 60.0, 40.0);
    
    //scoreLabel
    _scoreLabel.frame = CGRectMake(screenSize.width-60.0, 20.0, 60.0, 40.0);
}

- (void)gameControlButtonClickedAction:(UIButton *)gameControlButton{
    IMCGameState gameState = _gameControlModel.gameState;
    switch (gameState) {
        case IMCGameStateRun:
            [_gameControlModel pauseGame];
            break;
        
        case IMCGameStateStop:
            [_gameControlModel startGame];
            break;
        
        case IMCGameStatePause:
            [_gameControlModel resumGame];
            break;
            
        default:
            break;
    }
}

/*
 *  倒计时的数字改变了
 **/
- (void)controlModel:(IMCGameControlModel *)gameControlModel counterChanged:(NSInteger)counter {
    //整型转化成字符串
    _timerLabel.text = [NSString stringWithFormat:@"%ld",counter];
}

/*
 *  游戏状态改变了
 **/
- (void)controlModel:(IMCGameControlModel *)gameControlModel stateChanged:(IMCGameState)gameState {
    switch (gameState) {
        case IMCGameStateRun: {
            //设置按钮文字为暂停
            [_gameControlButton setTitle:@"暂停游戏" forState:UIControlStateNormal];
            
            //让游戏面板显示地鼠
            [_gamePanelView startGame];
            break;
        }
        case IMCGameStateStop: {
            [_gameControlButton setTitle:@"开始游戏" forState:UIControlStateNormal];
            
            //不再显示其地鼠
            [_gamePanelView stopGame];
            
            NSString *info = [NSString stringWithFormat:@"恭喜您，得到了%ld分", _scoreModel.score];
            
            //弹出框,提示游戏结束
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"游戏结束" message:info preferredStyle:UIAlertControllerStyleAlert];
            
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:nil];
            
            [alertController addAction:alertAction];
            
            //显示提示框
            [self presentViewController:alertController animated:YES completion:nil];
            
            break;
        }
        case IMCGameStatePause: {
            [_gameControlButton setTitle:@"继续游戏" forState:UIControlStateNormal];
            
            [_gamePanelView pauseGame];
            break;
        }
        default:
            break;
    }
}

- (void)scoreModel:(IMCScoreModel *)scoreModel scoreChanged:(NSInteger)score {
    _scoreLabel.text = [NSString stringWithFormat:@"%ld",score];
}

/*
 *  当有地鼠的位置被打中后,通知它的代理
 **/
- (void)gopherHitted {
    if (_gameControlModel.gameState == IMCGameStateRun) {
        [_scoreModel addScore];
    }
}

@end
