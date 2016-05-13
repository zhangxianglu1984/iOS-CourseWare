//
//  ViewController.m
//  Record
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
{
    AVAudioRecorder *recorder;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)record:(id)sender {
    NSString *docPath = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *filePath = [docPath stringByAppendingPathComponent:@"record.caf"];
    
    // [NSURL URLWithString:filePath] // www.baidu.com
    // file://
    // 初始化录音器,并附带生成文件的路径
    recorder = [[AVAudioRecorder alloc]initWithURL:[NSURL fileURLWithPath:filePath] settings:nil error:nil];
    
    // 真机调试要加入下面三句,否则不能录音
    AVAudioSession *session = [AVAudioSession sharedInstance];
    [session setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [session setActive:YES error:nil];
    
    [recorder prepareToRecord];
    // 开始录音
    BOOL success = [recorder record];
    NSLog(@"%d",success);
    
    
}
- (IBAction)stop:(id)sender {
    [recorder stop];
}

- (IBAction)play:(id)sender {
    
}

@end
