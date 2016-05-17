//
//  ViewController.h
//  0123_UIView
//
//  Created by jianfeng on 15/1/23.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *button;

- (IBAction)reset:(UIButton *)sender;

- (IBAction)xuanzhuan:(UIButton *)sender;


- (IBAction)translate:(id)sender;
- (IBAction)scale:(UIButton *)sender;

@end

