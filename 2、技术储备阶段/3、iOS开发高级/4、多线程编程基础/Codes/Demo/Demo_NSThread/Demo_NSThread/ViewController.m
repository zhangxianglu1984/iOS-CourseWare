//
//  ViewController.m
//  Demo_NSThread
//
//  Created by zhang xianglu on 15/5/29.
//  Copyright (c) 2015年 zhang xianglu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

- (void)downloadPhoto:(NSString *)photoPath;

- (void)updatePhotoImage:(UIImage *)photo;

@end

@implementation ViewController

- (IBAction)downloadButtonClickedAction:(UIButton *)sender {
	NSLog(@"sdkjfkdjfkd");
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	//创建一个子线程
	//方式一，手动启动线程(start)
	NSThread *subThread = [[NSThread alloc] initWithTarget:self selector:@selector(downloadPhoto:) object:@"http://d.3987.com/yeqc_131106/006.jpg"];
	subThread.name = @"子线程";
	[subThread start];

	//方式二，后台执行
	//[self performSelectorInBackground:@selector(downloadPhoto:) withObject:@"http://img0.imgtn.bdimg.com/it/u=1042085345,2395570537&fm=21&gp=0.jpg"];
	
	//方式三，从当前线程中分出一条线程
	//[NSThread detachNewThreadSelector:@selector(downloadPhoto:) toTarget:self withObject:@"http://d.3987.com/yeqc_131106/006.jpg"];
}

- (void)downloadPhoto:(NSString *)photoPath {
	NSLog(@"------begin-----");
	
	NSLog(@"1、%@",[NSThread currentThread]);
	
	/**
	 *  从网上下载一张图片，设置到photoView中
	 */
	 NSURL *url = [NSURL URLWithString:photoPath];
	 
	
	 
	 UIImage *photo = [UIImage imageWithData:photoData];
	 
	 //UI类型的任务(必须在主线程中完成)
	 //[self performSelectorOnMainThread:@selector(updatePhotoImage:) withObject:photo waitUntilDone:YES];
	 
	 //[self performSelector:@selector(updatePhotoImage:) onThread:[NSThread mainThread] withObject:photo waitUntilDone:YES];
	 
	 [_photoView performSelectorOnMainThread:@selector(setImage:) withObject:photo waitUntilDone:YES];
	
	//睡眠3秒
	//[NSThread sleepForTimeInterval:3.0f];
	//将当前线程睡眠到某个时间点
	//[NSThread sleepUntilDate:]
	
	NSLog(@"------end-----");
}

- (void)updatePhotoImage:(UIImage *)photo {
	NSLog(@"2、%@",[NSThread currentThread]);
	_photoView.image = photo;
}


- (void)viewDidLoad {
	[super viewDidLoad];
	
	
}



@end
