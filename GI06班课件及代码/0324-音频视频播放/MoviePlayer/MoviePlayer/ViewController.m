//
//  ViewController.m
//  MoviePlayer
//
//  Created by jianfeng on 15/3/24.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface ViewController ()
{
    MPMoviePlayerController *moviePlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self localPlayPrepare];
    [self streamPlayPrepare];

}

- (void)localPlayPrepare
{
    // 1.路径
    NSURL *url = [[NSBundle mainBundle] URLForResource:@"popeye.mp4" withExtension:nil];
    
    // 2.初始化播放器
    moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:url];
    
    // 隐藏控制面板然后自定义
    moviePlayer.controlStyle = MPMovieControlStyleNone;
    
    // 3.
    moviePlayer.view.frame = CGRectMake(10, 70, 300, 200);
    [self.view addSubview:moviePlayer.view];
    
    // 通知中心(可以在收到响应消息的时候做事情,这里的消息都是系统定义好的消息,符合条件的时候由系统发出)
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didEndPlaying)
                                                 name:MPMoviePlayerPlaybackDidFinishNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(didChangeState)
                                                 name:MPMoviePlayerPlaybackStateDidChangeNotification object:nil];
}

- (void)streamPlayPrepare
{
    moviePlayer = [[MPMoviePlayerController alloc]initWithContentURL:[NSURL URLWithString:@"http://static.tripbe.com/videofiles/20121214/9533522808.f4v.mp4"]];
    
    moviePlayer.view.frame = CGRectMake(10, 70, 300, 200);
    [self.view addSubview:moviePlayer.view];
}


- (IBAction)playLocalMovie:(id)sender {
    
    // 4.播放
    [moviePlayer play];
}

- (void)didEndPlaying
{
    NSLog(@"end playing");
    
    // 可以通过这个方式移除观察者
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)didChangeState
{
    NSLog(@"%d",moviePlayer.playbackState);
}


- (IBAction)showPlayerViewController:(id)sender {
    // MPMoviePlayerViewController 只能全屏播放
    MPMoviePlayerViewController *vc = [[MPMoviePlayerViewController alloc]initWithContentURL:[[NSBundle mainBundle] URLForResource:@"popeye.mp4" withExtension:nil]];
//    [self presentViewController:vc animated:YES completion:nil];
    [self presentMoviePlayerViewControllerAnimated:vc];
}

@end
