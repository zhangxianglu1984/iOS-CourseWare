//
//  IMCMainViewController.m
//  Exe_Timer
//
//  Created by zhang xianglu on 15/4/17.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "IMCMainViewController.h"
#import "IMCCounter.h"

@interface IMCMainViewController () <IMCCounterDelegate>

/** 计数器(模型) **/
@property(nonatomic,strong) IMCCounter *counter;

/** 视图 **/
@property(weak, nonatomic) IBOutlet UILabel *counterLabel;
@property (weak, nonatomic) IBOutlet UIButton *startButton;
@property (weak, nonatomic) IBOutlet UIButton *resetButton;

- (void)resetAction:(UIButton *)button forEvent:(UIControlEvents)events;

@end

@implementation IMCMainViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.counter = [[IMCCounter alloc] initWithNumber:9];
	//将当前对象设置为模型的代理
	_counter.delegate = self;
	
	[_resetButton addTarget:self action:@selector(resetAction:forEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)resetAction:(UIButton *)button forEvent:(UIControlEvents)events {
	[_counter reset];
	_resetButton.enabled = NO;
}

- (IBAction)startAction:(UIButton *)button {
	//在没有计数的情况下(开始),点击以后
	if (_counter.status == IMCCounterStateOff) {
		/** 调用视图资源 **/
		[button setTitle:@"暂停" forState:UIControlStateNormal];
		/** 调用模型资源 **/
		[_counter start];
	}else if(_counter.status == IMCCounterStateOn){
		[button setTitle:@"开始" forState:UIControlStateNormal];
		[_counter pause];
		
		/** 让按钮可用，并响应时间 **/
		_resetButton.enabled = YES;
	}
}

#pragma mark - IMCCounter Delegate Methods
- (void)IMCCounter:(IMCCounter *)counter changeCount:(NSUInteger)count {
	_counterLabel.text = [NSString stringWithFormat:@"%ld",count];
}


- (void)IMCCounterCountOver:(IMCCounter *)counter {
	[_startButton setTitle:@"开始" forState:UIControlStateNormal];
}

@end
