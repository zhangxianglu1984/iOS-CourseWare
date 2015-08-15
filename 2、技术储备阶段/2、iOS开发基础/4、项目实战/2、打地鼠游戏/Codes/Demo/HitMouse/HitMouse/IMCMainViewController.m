//
//  IMCMainViewController.m
//  PlayMouse
//
//  Created by zhang xianglu on 15/4/20.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "IMCMouseButton.h"
#import "IMCCounter.h"

/** 地鼠出现的时间间隔 **/
static const CGFloat kIntervalOfMouseShow = 1.0f;

/** 游戏持续时间 **/
static const NSUInteger kGameDuration = 5;

typedef enum {
	GameStateRunning,
	GameStatePause,
	GameStateStop
} GameState;

@interface IMCMainViewController () <IMCMouseButtonDelegate,IMCCounterDelegate>

@property (weak, nonatomic) IBOutlet UIView *mouseButtonsAreaView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *gameCounterLabel;
@property (weak, nonatomic) IBOutlet UIButton *gameControlButton;

/** 地鼠定时器 **/
@property(nonatomic,strong) NSTimer *mouseTimer;
/** 游戏状态 **/
@property(nonatomic,assign) GameState gameState;

/** 游戏分数 **/
@property(nonatomic,assign) NSUInteger score;

/** 倒计时器 **/
@property(nonatomic,strong) IMCCounter *gameCounter;

- (IBAction)onGameButtonCliked:(UIButton *)button;

/** 显示地鼠 **/
- (void)mouseTimerHandler:(NSTimer *)timer;

/** 清除地鼠 **/
- (void)disappearAllMouse;

@end

@implementation IMCMainViewController

#pragma mark - Life Cycle Methods
- (id)initWithCoder:(NSCoder *)aDecoder {
	if (self = [super initWithCoder:aDecoder]) {
		self.gameState = GameStateStop;
		self.score = 0;
		
		self.gameCounter = [[IMCCounter alloc] initWithNumber:kGameDuration];
		_gameCounter.delegate = self;
		
		[self initMouseTimer];	
	}
	return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	/** 给按钮设置代理 **/
	for(NSUInteger i = 1; i <= 9; i ++){
		IMCMouseButton *mouseButton = (IMCMouseButton *)[self.mouseButtonsAreaView viewWithTag:i];
		mouseButton.delegate = self;
	}
	
	_gameCounterLabel.text = [NSString stringWithFormat:@"%lu",kGameDuration];
}

- (void)initMouseTimer {
	//初始化地鼠定时器
	self.mouseTimer = [NSTimer scheduledTimerWithTimeInterval:kIntervalOfMouseShow target:self selector:@selector(mouseTimerHandler:) userInfo:nil repeats:YES];
	
	_mouseTimer.fireDate = [NSDate distantFuture];
}

#pragma mark - Private Methods
- (void)mouseTimerHandler:(NSTimer *)timer {
	[self disappearAllMouse];

	NSUInteger mouseButtonTag = arc4random() % 9 + 1;
	
	IMCMouseButton *mouseButton = (IMCMouseButton *)[self.mouseButtonsAreaView viewWithTag:mouseButtonTag];
	[mouseButton appearMouse];
}

- (void)disappearAllMouse {
	/** 将所有的地鼠图片清空 **/
	for(NSUInteger i = 1; i <= 9; i ++){
		IMCMouseButton *mouseButton = (IMCMouseButton *)[self.mouseButtonsAreaView viewWithTag:i];
		[mouseButton disappearMouse];
	}
}

#pragma mark - Setters And Getters
- (void)setScore:(NSUInteger)score {
	_score = score;
	_scoreLabel.text = [NSString stringWithFormat:@"%lu",_score];
}


#pragma mark - Start Button Event Methods
- (IBAction)onGameButtonCliked:(UIButton *)button {
	switch (_gameState) {
  		case GameStatePause:
			//继续计时
			[_gameCounter resume];
			
			self.gameState = GameStateRunning;
			_mouseTimer.fireDate = [NSDate distantPast];
			[button setTitle:@"暂停" forState:UIControlStateNormal];
			break;
		case GameStateStop:
			//开始计时
			[_gameCounter start];
			
			self.gameState = GameStateRunning;
			_mouseTimer.fireDate = [NSDate distantPast];
			[button setTitle:@"暂停" forState:UIControlStateNormal];
			break;
			
		case GameStateRunning:
			//暂停计时
			[_gameCounter pause];
		
			self.gameState = GameStatePause;
			_mouseTimer.fireDate = [NSDate distantFuture];
			[button setTitle:@"继续" forState:UIControlStateNormal];
			break;
			
  		default:
			break;
	}
	
}

#pragma mark - IMCMouseButton Delegate Methods
- (void)onAppearedMouseHitted:(IMCMouseButton *)mouseButton {
	if(_gameState == GameStateRunning){
		self.score ++;
	}
}

#pragma mark - IMCCounter Delegate Methods
/** 告诉代理,计数器的值改变了 **/
- (void)counter:(IMCCounter *)counter changeCount:(NSUInteger)count {
	if (_gameState == GameStateRunning) {
		_gameCounterLabel.text = [NSString stringWithFormat:@"%lu",count];
	}
}

/** 告诉代理，计数器计数结束了 **/
- (void)counterCountOver:(IMCCounter *)counter {
	self.gameState = GameStateStop;
	self.mouseTimer.fireDate = [NSDate distantFuture];
	
	[_gameControlButton setTitle:@"开始" forState:UIControlStateNormal];
	
	[self disappearAllMouse];
	
	//显示一个对话框
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Game Over" message:[NSString stringWithFormat:@"恭喜您！您得了%lu分！",_score] preferredStyle:UIAlertControllerStyleAlert];
	
	//给提示框添加按钮
	__weak IMCMainViewController *mainViewController = self;
	UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
		mainViewController.score = 0;
		//让当前这个对话框消失
		[alertController dismissViewControllerAnimated:YES completion:^{}];
	}];
	[alertController addAction:alertAction];
	
	[self presentViewController:alertController animated:YES completion:^{
		
	}];
}


@end
