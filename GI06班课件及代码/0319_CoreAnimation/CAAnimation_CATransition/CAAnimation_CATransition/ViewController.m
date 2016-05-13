//
//  ViewController.m
//  CAAnimation_CATransition
//
//  Created by jianfeng on 15/3/19.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    NSInteger index;
}

@property (weak, nonatomic) IBOutlet UIImageView *imgView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (IBAction)last:(id)sender {
    index--;
    if (index < 0 ) {
        index = 4;
    }
    
    // 初始化一个动画
    CATransition *transition = [CATransition animation];
    
    // 两个比较重要的属性
    // 1.type:过渡动画的类型
    transition.type = @"cube";
    // 2.subType:过渡动画的方向
    transition.subtype = @"fromLeft";
    
    // 添加到layer
    [self.imgView.layer addAnimation:transition forKey:nil];
    
    NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",(long)index + 1];
    self.imgView.image = [UIImage imageNamed:imageName];
}

- (IBAction)next:(id)sender {
    index++;
    if (index > 4) {
        index = 0;
    }
    
    // 初始化一个动画
    CATransition *transition = [CATransition animation];
    
    // 两个比较重要的属性
    // 1.type:过渡动画的类型
    transition.type = @"cube";
    // 2.subType:过渡动画的方向
    transition.subtype = @"fromRight";
    
    transition.duration = 1;
    
    // 设置动画起点和终点的百分比(0-1);
//    transition.startProgress = 0.5;
//    transition.endProgress = 0.5;
    
    // 添加到layer
    [self.imgView.layer addAnimation:transition forKey:nil];
    
    NSString *imageName = [NSString stringWithFormat:@"%ld.jpg",(long)index + 1];
    self.imgView.image = [UIImage imageNamed:imageName];
}

@end
