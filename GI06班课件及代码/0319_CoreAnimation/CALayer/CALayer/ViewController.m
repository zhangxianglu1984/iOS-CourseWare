//
//  ViewController.m
//  CALayer
//
//  Created by jianfeng on 15/3/19.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self viewLayer];
    [self imageViewLayer];
}

- (void)viewLayer
{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 100)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    // 圆角效果
    view.layer.cornerRadius = 10;
    
    // 添加阴影(阴影的显示要靠下面三个属性一起作用)
    view.layer.shadowColor = [UIColor grayColor].CGColor;
    view.layer.shadowOffset = CGSizeMake(5, 5);
    view.layer.shadowOpacity = 1;
    
    // 添加边框(下面连个属性一起作用)
    view.layer.borderColor = [UIColor greenColor].CGColor;
    view.layer.borderWidth = 5.0f;
}

- (void)imageViewLayer
{
    UIImageView *imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"dog.jpg"]];
//    imgView.center = self.view.center;
    [self.view addSubview:imgView];
    
//     UIImageView类型添加圆角效果需要设置masksToBounds属性
//     因为UIImageView不止一个layer
    imgView.layer.cornerRadius = 20;
    imgView.layer.masksToBounds = YES;
    
//    // 如果UIImageView设置了圆角,那么阴影就不好使了
//    imgView.layer.shadowColor = [UIColor grayColor].CGColor;
//    imgView.layer.shadowOffset = CGSizeMake(5, 5);
//    imgView.layer.shadowOpacity = 1;
    
    // CAlayer的形变属性是3D的
    imgView.layer.position = CGPointMake(0, 0);
//    imgView.layer.anchorPoint = CGPointMake(0, 0);
    imgView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    imgView.layer.transform = CATransform3DMakeRotation(M_PI_4, 1, 1, 0);
//    imgView.layer.transform = CATransform3DMakeTranslation(100, 100, 0);
//    imgView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 1);
    
    

    
    
}

@end
