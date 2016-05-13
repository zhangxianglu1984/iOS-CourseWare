//
//  ViewController.m
//  0123_UIView
//
//  Created by jianfeng on 15/1/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import "ViewController.h"

#define kAnimationDuration 0.5

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)reset:(UIButton *)sender {
    self.button.transform = CGAffineTransformIdentity;
}

//- (IBAction)goUp:(UIButton *)sender
//{
////    self.button.transform = CGAffineTransformMakeTranslation(0, -20);
////    self.button.transform = CGAffineTransformTranslate(self.button.transform, 0, -20);
//    // block
//    [UIView animateWithDuration:0.5 animations:^{
//        // 这里写button的目标状态
//        
//        // !!!!!不允许给对象的结构体属性的成员直接赋值
////        self.button.frame.origin.y -= 20;
//        
//        // 改变控件的frame
//        // 1.取出控件原来的frame
//        CGRect buttonFrame = self.button.frame;
//        // 2.该变这个frame的值
//        buttonFrame.origin.y -= 20;
//        // 3.把改变后的frame赋值回去
//        self.button.frame = buttonFrame;
//    }];
//    
//}


//- (IBAction)fangda:(UIButton *)sender
//{
//    [UIView animateWithDuration:0.5 animations:^{
//        self.button.transform = CGAffineTransformScale(self.button.transform, 1.2, 1.2);
//    }];
//}
//
//- (IBAction)suoxiao:(UIButton *)sender
//{
//    [UIView animateWithDuration:0.5 animations:^{
//        self.button.transform = CGAffineTransformScale(self.button.transform, 0.8, 0.8);
//    }];
//}

- (IBAction)xuanzhuan:(UIButton *)sender
{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        self.button.transform = CGAffineTransformRotate(self.button.transform, -M_PI_4);
    }];
}

- (IBAction)translate:(id)sender {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        // 改变控件的frame
        // 1.取出控件原来的frame
        CGRect buttonFrame = self.button.frame;
        // 2.该变这个frame的值
        switch (((UIButton *)sender).tag) {
            case 100:
                buttonFrame.origin.y -= 20;
                break;
            case 101:
                buttonFrame.origin.y += 20;
                break;
            case 102:
                buttonFrame.origin.x -= 20;
                break;
            case 103:
                buttonFrame.origin.x += 20;
                break;
            default:
                break;
        }
        
        // 3.把改变后的frame赋值回去
        self.button.frame = buttonFrame;
    }];
}

- (IBAction)scale:(UIButton *)sender {
    [UIView animateWithDuration:kAnimationDuration animations:^{
        float factor = sender.tag == 200 ? 1.2 : 0.8;
        self.button.transform = CGAffineTransformScale(self.button.transform, factor, factor);
    }];
}
@end
