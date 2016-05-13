//
//  ViewController.h
//  0122_storyBoard
//
//  Created by jianfeng on 15/1/22.
//  Copyright (c) 2015年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (IBAction)btnClicked:(UIButton *)sender;

@property (weak, nonatomic) IBOutlet UITextField *accountField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@end

