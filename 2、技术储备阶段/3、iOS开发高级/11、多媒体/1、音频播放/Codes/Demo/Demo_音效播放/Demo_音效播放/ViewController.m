//
//  ViewController.m
//  Demo_音效播放
//
//  Created by zhang xianglu on 15/10/3.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"


#import <AVFoundation/AVFoundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	
	
	AVAudioRecorder *audioRecorder = nil;
	
	//允许测量
	audioRecorder.meteringEnabled = YES;
	//更新测量值
	[audioRecorder updateMeters];
	//获得平均分贝值(说话时，音量变大)
	float averagePower = [audioRecorder averagePowerForChannel:0];
	
	
	//配置字典
	NSMutableDictionary *settings = [NSMutableDictionary dictionary];
	//音频格式
	settings[AVFormatIDKey] = @(kAudioFormatAppleIMA4);
	//音频采样率
	settings[AVSampleRateKey] = @(8000.0);
	//音频声道数
	settings[AVNumberOfChannelsKey] = @(1);
	//线性音频拉伸的位深度
	settings[AVLinearPCMBitDepthKey] = @(8);
	
}


@end
